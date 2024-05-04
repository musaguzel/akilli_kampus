import 'package:flutter/material.dart';
import 'package:akilli_kampus/core/base/view/base_widget.dart';
import 'package:akilli_kampus/view/change_password/viewModel/change_password_page_view_model.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ChangePasswordPageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel, networkResult) => Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white), // Tüm metinlerin rengi beyaz
            bodyText2: TextStyle(color: Colors.white), // Tüm metinlerin rengi beyaz
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black), // Text field hint rengi siyah
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              'Şifreyi Değiştir',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const PasswordTextField(labelText: 'Eski Şifre'),
                const SizedBox(height: 20),
                const PasswordTextField(labelText: 'Yeni Şifre'),
                const SizedBox(height: 20),
                const PasswordTextField(labelText: 'Yeni Şifre Tekrar'),
                const SizedBox(height: 20),
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String labelText;

  const PasswordTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8.0),
          const Icon(Icons.lock),
          const SizedBox(width: 8.0),
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
