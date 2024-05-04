import 'package:akilli_kampus/core/base/view/base_widget.dart';
import 'package:akilli_kampus/view/change_password/viewModel/change_password_page_view_model.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: ChangePasswordPageViewModel(),
        onModelReady: (model){
        model.setContext(context);
        model.init();
        },
      onPageBuilder: (context,viewModel,networkResult) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text(
          'Şifreyi Değiştir',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff333647),
          ),
        ),backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20), // Metin alanları arasına boşluk ekliyoruz
              const PasswordTextField(labelText: 'Eski Şifre'),
              const SizedBox(height: 20), // Metin alanları arasına boşluk ekliyoruz
              const PasswordTextField(labelText: 'Yeni Şifre'),
              const SizedBox(height: 20), // Metin alanları arasına boşluk ekliyoruz
              const PasswordTextField(labelText: 'Yeni Şifre Tekrar'),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
// Butona tıklama işlemi
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF475AD7),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Şifre Değiştir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}

class PasswordTextField extends StatelessWidget {
  final String labelText;

  const PasswordTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // Kenar boşluğu
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6), // Arka plan rengi
        borderRadius: BorderRadius.circular(10.0), // Köşe yuvarlaklığı
      ),
      child: Row(
        children: [
          const SizedBox(width: 8.0), // İkon ile metin alanı arasına boşluk ekliyoruz
          const Icon(Icons.lock), // Kilit simgesi
          const SizedBox(width: 8.0), // İkon ile metin alanı arasına boşluk ekliyoruz
          Expanded(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: labelText,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

