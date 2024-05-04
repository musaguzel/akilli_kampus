import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmergencyButtonApp extends StatelessWidget {
  const EmergencyButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(
            'Acil Durum Butonu',
            style: TextStyle(color: Colors.indigo),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Acil Durum Bildirimi'),
                        content: const Text(
                            'Güvenliğe haber vermek istediğine emin misin?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Evet',
                                style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              // Acil durum bildirimini göndermek için burada bir işlem yapılabilir.
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Hayır'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                    'assets/animation/sos.json', // Lottie animasyon dosyasının yolu
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Acil Durum Butonu\n',
              style: TextStyle(fontSize: 24, color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            const EmergencyButton(),
          ],
        ),
    );
  }
}

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Acil Durum Bildirimi'),
                content: const Text('Güvenliğe haber vermek istediğine emin misin?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Evet', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      // Acil durum bildirimini göndermek için burada bir işlem yapılabilir.
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Hayır'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Butonun rengi
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        child: const Text('ACİL', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}