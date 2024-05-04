import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şartlar ve Koşullar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              title: 'Kullanıcı Hesapları ve Kimlik Doğrulama',
              content:
              'Kullanıcıların hesap oluşturması ve giriş yapması gerekmelidir. Hesap oluştururken, kullanıcıların geçerli e-posta adresleri ve diğer gerekli bilgileri sağlaması istenebilir. Kullanıcıların hesaplarını doğrulamak için bir kimlik doğrulama mekanizması sağlanabilir (örneğin, e-posta doğrulaması).',
            ),
            buildSection(
              title: 'Kullanıcı Profili',
              content:
              'Kullanıcılar, profil fotoğrafı, iletişim bilgileri gibi kişisel bilgilerini düzenleyebilmelidir. Profil bilgilerinin düzenlenmesi sırasında güvenlik önlemleri alınmalıdır.',
            ),
            buildSection(
              title: 'Okul Bilgileri ve Programlar',
              content:
              'Uygulamada okulun genel bilgileri (adı, adresi, iletişim bilgileri vb.) sunulabilir. Okulun sunduğu programlar (dersler, etkinlikler, spor faaliyetleri, kulüpler vb.) ve bunlarla ilgili bilgiler paylaşılabilir.',
            ),
            buildSection(
              title: 'Ders Takvimi ve Programı',
              content:
              'Kullanıcılar, ders programını görüntüleyebilmeli ve ders saatleri, ödevler, sınavlar vb. gibi önemli tarihleri takip edebilmelidir. Öğretmenler, öğrencilere ders planı ve ders materyalleri sağlayabilir.',
            ),
            buildSection(
              title: 'Ödevler ve Sınavlar',
              content:
              'Öğretmenler, ödevler ve sınavlar için görevler oluşturabilir ve bu görevleri öğrencilere atayabilir. Öğrenciler, ödevleri teslim edebilmeli ve sınav sonuçlarını görüntüleyebilmelidir.',
            ),
            buildSection(
              title: 'Haberler ve Duyurular',
              content:
              'Okul yönetimi, öğrencilere ve velilere önemli haberleri ve duyuruları iletebilmelidir. Öğrenciler, veliler ve öğretmenler, okulun güncel olaylarını ve etkinliklerini takip edebilmelidir.',
            ),
            buildSection(
              title: 'İletişim',
              content:
              'Kullanıcılar, öğretmenlerle, okul yönetimiyle ve diğer öğrencilerle iletişim kurabilmelidir. Uygulama içi mesajlaşma veya e-posta gibi iletişim araçları sağlanabilir.',
            ),
            buildSection(
              title: 'Güvenlik ve Gizlilik',
              content:
              'Kullanıcı bilgilerinin güvenliği ve gizliliği sağlanmalıdır. Kullanıcıların kişisel verilerinin toplanması, saklanması ve işlenmesi yasalara ve uygun gizlilik politikalarına uygun olmalıdır.',
            ),
            buildSection(
              title: 'Geliştirme ve Güncelleme',
              content:
              'Uygulama, kullanıcı geri bildirimlerine dayanarak düzenli olarak güncellenmelidir. Yazılım hatalarının düzeltilmesi ve performansın artırılması için düzenli bakım yapılmalıdır.',
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