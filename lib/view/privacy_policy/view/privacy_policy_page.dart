import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gizlilik Politikası'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              title: 'Kullanıcı Hesapları ve Kimlik Doğrulama',
              content:
              'Kullanıcıların hesap oluşturması ve giriş yapması gerekmektedir. Hesap oluştururken, kullanıcıların geçerli e-posta adresleri ve diğer gerekli bilgileri sağlaması istenebilir. Kullanıcıların hesaplarını doğrulamak için bir kimlik doğrulama mekanizması sağlanabilir (örneğin, e-posta doğrulaması).',
            ),
            buildSection(
              title: 'Kullanıcı Profili',
              content:
              'Kullanıcılar, profil fotoğrafı, iletişim bilgileri gibi kişisel bilgilerini düzenleyebilmelidir. Profil bilgilerinin düzenlenmesi sırasında güvenlik önlemleri alınmalıdır.',
            ),
            buildSection(
              title: 'Kişisel Verilerin Toplanması ve Kullanılması',
              content:
              'Uygulama, kullanıcıların kişisel verilerini yalnızca belirli amaçlar doğrultusunda toplar ve kullanır. Kişisel veriler, gizlilik politikası çerçevesinde korunur ve yalnızca kullanıcı izniyle üçüncü taraflarla paylaşılır.',
            ),
            buildSection(
              title: 'Çerezler ve İzleme Teknolojileri',
              content:
              'Uygulama, kullanıcı deneyimini iyileştirmek ve hizmetleri sunmak için çerezler ve benzer izleme teknolojilerinden yararlanabilir. Kullanıcılar, çerez tercihlerini ayarlamak için tarayıcılarının ayarlarını değiştirebilirler.',
            ),
            buildSection(
              title: 'Güvenlik',
              content:
              'Uygulama, kullanıcı bilgilerinin güvenliği için uygun teknik ve organizasyonel önlemleri alır. Ancak, internet üzerinden iletişim veya veri depolama yöntemlerinin tam güvenliği garanti edilemez.',
            ),
            buildSection(
              title: 'Değişiklikler ve Güncellemeler',
              content:
              'Gizlilik politikası, gerektiğinde güncellenebilir veya değiştirilebilir. Bu nedenle, kullanıcılar periyodik olarak bu sayfayı ziyaret ederek güncellemeler hakkında bilgi edinmelidir.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}