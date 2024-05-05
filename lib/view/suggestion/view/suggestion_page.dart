import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  String _textInput = '';
  String _imageUrl = '';

  void _submitFeedback(String type) {
    // Burada geri bildiriminizi ve fotoğraf url'sini işleme koyabilirsiniz
    print('Geri bildiriminiz: $_textInput');
    print('Fotoğraf URL\'si: $_imageUrl');
    // Geri bildirimi gönderdikten sonra kutucukları temizleyin
    setState(() {
      _textInput = '';
      _imageUrl = '';
    });
    if (type == 'sorun') {
      // Sorun bildirme için ek işlemleri yapın
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sorun Bildirme'),
            content: const Text('Sorununuzu bildirmek istediğinizden emin misiniz?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('İptal'),
              ),
              TextButton(
                onPressed: () {
                  // Sorun bildirme işlemleri buraya gelecek
                  Navigator.pop(context);
                },
                child: const Text('Evet, Gönder'),
              ),
            ],
          );
        },
      );
    } else if (type == 'oneri') {
      // Öneri bildirme için ek işlemleri yapın
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Öneri Bildirme'),
            content: const Text('Önerinizi göndermek istediğinizden emin misiniz?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('İptal'),
              ),
              TextButton(
                onPressed: () {
                  // Öneri bildirme işlemleri buraya gelecek
                  Navigator.pop(context);
                },
                child: const Text('Evet, Gönder'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageUrl = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öneri ve Görüş',style:TextStyle(color: Colors.indigo)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[200],
                      child: _imageUrl != ''
                          ? Image.file(
                        File(_imageUrl),
                        fit: BoxFit.cover,
                      )
                          : Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _textInput = value;
                      });
                    },
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Buraya görüş ve önerilerinizi yazın',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _submitFeedback('sorun'),
              child: const Text('Sorun Bildir'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _submitFeedback('oneri'),
              child: const Text('Öneri Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}