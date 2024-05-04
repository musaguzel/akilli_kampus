import 'package:flutter/material.dart';

class AcademicCalendar extends StatefulWidget {
  const AcademicCalendar({super.key});

  @override
  _AcademicCalendarState createState() => _AcademicCalendarState();
}

class _AcademicCalendarState extends State<AcademicCalendar> {
  final List<Map<String, String>> events = [
    {'title': 'Senato Toplantı Tarihi', 'date': '25.05.2023'},
    {'title': 'Senato Toplantı Sayısı', 'date': '16'},
    {'title': 'Elektronik Kayıt (e-kayıt yeni Öğrenci)', 'date': '28-30 Ağustos 2023'},
    {'title': 'Şahsen Kayıt (e-kayıt yapmak istemeyen yeni öğrenciler)', 'date': '28 Ağustos-1 Eylül 2023'},
    {'title': 'Ek Yerleştirme Kayıt', 'date': '27 Eylül - 3 Ekim 2023'},
    {'title': 'Kayıt Yenileme', 'date': '25-29 Eylül 2023'},
    {'title': 'Derslerin Başlaması', 'date': '02 Ekim 2023 (*)'},
    {'title': 'Ekle-Sil', 'date': '02-04 Ekim 2023'},
    {'title': 'Danışman Onayı', 'date': '25 Eylül- 04 Ekim 2023'},
    {'title': 'Mazeretli Kayıt Başvurusu', 'date': '05-06-09 Ekim 2023'},
    {'title': 'Mazeretli Kayıt Başvuruları Değerlendirilmesi', 'date': '10 Ekim 2023'},
    {'title': 'Mazeretli Kayıt (Mazereti Birim Kurulunca Kabul Edilenler)', 'date': '11-12-13 Ekim 2023'},
    {'title': 'İngilizce I-II Dersi Muafiyet Sınavı', 'date': '14 Ekim 2023'},
    {'title': 'Yarıyıl İçi Sınavları Birimler Tarafından Belirlenecek Tarihlerde ()', 'date': ''},
    {'title': 'Yarıyıl İçi Sınavları Not İlanı Son Tarih', 'date': '10 Aralık 2023'},
    {'title': 'Yarıyıl İçi Mazeret Sınavları', 'date': '18-23 Aralık 2023'},
    {'title': 'Yarıyıl İçi Mazeret Sınavları Not İlanı Son Tarih', 'date': '27 Aralık 2023'},
    {'title': 'Derslerin Sonu', 'date': '06 Ocak 2024'},
    {'title': 'Yarıyıl Sonu Sınavları', 'date': '09-17 Ocak 2024'},
    {'title': 'Yarıyıl Sonu Sınavları Not İlanı Son Tarih', 'date': '21 Ocak 2024'},
    {'title': 'Yarıyıl İçi Ödev, Proje,Uygulama vb. Sınavlar Not İlanı Son Tarihi', 'date': '21 Ocak 2024'},
    {'title': 'Bütünleme Sınavları', 'date': '23-31 Ocak 2024'},
    {'title': 'Bütünleme Sınavları Not İlanı Son Tarih', 'date': '04 Şubat 2024'},
    {'title': 'Mezuniyet Sınavları', 'date': '08 Şubat 2024'},
    {'title': 'Mezuniyet Sınavları Not İlanı Son Tarih', 'date': '09 Şubat 2024'},
    {'title': 'Azami Süre Ek 1. Sınavları', 'date': '05-06 Şubat 2024'},
    {'title': 'Azami Süre Ek 1. Sınavları Not İlanı Son Tarih', 'date': '06 Şubat 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları Sınav hakkı verilecek öğrencilerin durumlarının değerlendirilmesi', 'date': '09 Şubat 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları', 'date': '12-13 Şubat 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları Not İlanı Son Tarih', 'date': '13 Şubat 2024'},
    {'title': 'Kayıt Yenileme', 'date': '12-16 Şubat 2024'},
    {'title': 'Derslerin Başlaması', 'date': '19 Şubat 2024'},
    {'title': 'Ekle-Sil', 'date': '19-21 Şubat 2024'},
    {'title': 'Danışman Onayı', 'date': '12-21 Şubat 2024'},
    {'title': 'Mazeretli Kayıt Başvurusu', 'date': '22-26 Şubat 2024'},
    {'title': 'Mazeretli kayıt başvuruları değerlendirilmesi', 'date': '27 Şubat 2024'},
    {'title': 'Mazeretli Kayıt (Mazereti Birim kurulunca kabul edilenler)', 'date': '28-29 Şubat-1 Mart 2024'},
    {'title': 'Yarıyıl İçi Sınavları Birimler Tarafından Belirlenecek Tarihlerde ()', 'date': ''},
    {'title': 'Yarıyıl İçi Sınavları Not İlanı Son Tarih', 'date': '5 Mayıs 2024'},
    {'title': 'Yarıyıl İçi Mazeret Sınavları', 'date': '13 Mayıs-18 Mayıs 2024'},
    {'title': 'Yarıyıl İçi Mazeret Sınavları Not İlanı Son Tarih', 'date': '22 Mayıs 2024'},
    {'title': 'Derslerin Sonu', 'date': '01 Haziran 2024'},
    {'title': 'Yarıyıl Sonu Sınavları (8-9 Haziran 2024 tarihlerinde sınav yapılmayacaktır.) (*)', 'date': '03-12 Haziran 2024'},
    {'title': 'Yarıyıl Sonu Sınavları Not İlanı Son Tarih (*)', 'date': '23 Haziran 2024'},
    {'title': 'Yarıyıl İçi Ödev, Proje,Uygulama vb. Sınavlar Not İlanı Son Tarihi (*)', 'date': '23 Haziran 2024'},
    {'title': 'Bütünleme Sınavları (*)', 'date': '26 Haziran 2024-4 Temmuz 2024'},
    {'title': 'Bütünleme Sınavları Not İlanı Son Tarih', 'date': '07 Temmuz 2024'},
    {'title': 'Mezuniyet Sınavları (*)', 'date': '10 Temmuz 2024'},
    {'title': 'Mezuniyet Sınavları Not İlanı Son Tarih (*)', 'date': '11 Temmuz 2024'},
    {'title': 'Azami Süre Ek 1. Sınavları', 'date': '09-10 Eylül 2024'},
    {'title': 'Azami Süre Ek 1. Sınavları Not İlanı Son Tarih', 'date': '10 Eylül 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları Sınav hakkı verilecek öğrencilerin durumlarının değerlendirilmesi', 'date': '13 Eylül 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları', 'date': '16-17 Eylül 2024'},
    {'title': 'Azami Süre Ek 2. Sınavları Not İlanı Son Tarih', 'date': '17 Eylül 2024'},
    {'title': '(*) 01.09.2023 Tarih ve 25 Sayılı Senato Kararı', 'date': ''},
    {'title': '() 12.10.2023 Tarih ve 29 Sayılı Senato Kararı', 'date': ''},
    {'title': '(*) 08.02.2024 Tarih ve 04 Sayılı Senato Kararı', 'date': ''},
  ];

  List<Map<String, String>> filteredEvents = [];

  void filterEvents(String query) {
    List<Map<String, String>> filteredList = events
        .where((event) => event['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredEvents = filteredList;
    });
  }

  @override
  void initState() {
    filteredEvents = events;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademik Takvim'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Etkinlik Ara',
                hintText: 'Etkinlik adını girin',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: filterEvents,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Text(
                      filteredEvents[index]['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Tarih: ${filteredEvents[index]['date']}',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

