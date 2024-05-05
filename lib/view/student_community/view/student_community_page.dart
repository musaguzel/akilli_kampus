import 'package:flutter/material.dart';

class CommunitySearchPage extends StatefulWidget {
  const CommunitySearchPage({super.key});

  @override
  _CommunitySearchPageState createState() => _CommunitySearchPageState();
}

class _CommunitySearchPageState extends State<CommunitySearchPage> {
  List<String> filteredCommunityList = [];

  @override
  void initState() {
    super.initState();
    filteredCommunityList.addAll(communityList);
  }

  void filterCommunityList(String query) {
    setState(() {
      filteredCommunityList = communityList
          .where((community) =>
          community.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topluluk Arama'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                filterCommunityList(value);
              },
              decoration: const InputDecoration(
                labelText: 'Topluluk Ara',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCommunityList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCommunityList[index]),
                  onTap: () {
                    // İlgili topluluğun detay sayfasına gitmek için yönlendirme işlemi burada yapılabilir.
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> communityList = [
  "AHBAP TOPLULUĞU",
  "ANALİTİK DÜŞÜNCE TOPLULUĞU",
  "ARAMA KURTARMA ve KORUMA TOPLULUĞU",
  "ASYA PASİFİK TOPLULUĞU",
  "ATATÜRKÇÜ DÜŞÜNCE TOPLULUĞU",
  "AZERBAYCAN KÜLTÜR TOPLULUĞU",
  "BİLGİSAYAR ve BİLİŞİM TOPLULUĞU",
  "BİLİM KURGU ve FANTEZİ TOPLULUĞU",
  "BİLİM ve ÇEVRE TOPLULUĞU",
  "ÇAĞDAŞ GENÇLİK TOPLULUĞU",
  "ÇEVİRİ TOPLULUĞU",
  "ÇOCUKOLOJİ TOPLULUĞU",
  "DAĞCILIK TOPLULUĞU",
  "DANS TOPLULUĞU",
  "DİRİLİŞ GELENEKSEL TÜRK OKÇULUĞU TOPLULUĞU",
  "DOĞADAN İZLER TOPLULUĞU",
  "DOMANİÇ HAYME ANA BİLİM KÜLTÜR SANAT TOPLULUĞU",
  "DUMLUPINAR BİLİM KÜLTÜR SANAT TOPLULUĞU",
  "DUMLUPINAR İLETİŞİM TOPLULUĞU",
  "DUSCART ALTERNATİF ENERJİLİ ARAÇLAR TOPLULUĞU",
  "DÜNYA DİLLERİ TOPLULUĞU",
  "EĞİTİM, DAYANIŞMA ve UZLAŞI TOPLULUĞU",
  "EKSİ 25 TOPLULUĞU",
  "ELEKTRONİK SPOR TOPLULUĞU",
  "ENDÜSTRİ VE VERİMLİLİK TOPLULUĞU",
  "ENGELSİZ HAYAT TOPLULUĞU",
  "FIKIH TOPLULUĞU",
  "FİZİK VE ASTRONOMİ TOPLULUĞU",
  "FOTOĞRAFÇILIK ve SİNEMA TOPLULUĞU",
  "FRİGYA ARKEOLOJİ VE SANAT TOPLULUĞU",
  "GASTRONOMİ TOPLULUĞU",
  "GEÇERKEN TOPLULUĞU",
  "GELENEKSEL TÜRK SANATLARI ve TÜRK MUSİKİSİ TOPLULUĞU",
  "GENÇ FİKİR ve AKADEMİK KALİTE TOPLULUĞU",
  "GENÇ TEMA ve ÇEVRECİLİK TOPLULUĞU",
  "GENÇ TÜRKOLOGLAR TOPLULUĞU",
  "GENÇ YEŞİLAY TOPLULUĞU",
  "GENÇHİLAL TOPLULUĞU",
  "GÖRSEL İLETİŞİM TOPLULUĞU",
  "HADİS TOPLULUĞU",
  "HALK DANSLARI TOPLULUĞU",
  "HAVACILIK TOPLULUĞU",
  "HAYVAN HAKLARI KORUMA TOPLULUĞU",
  "İEEE (ULUSLARARASI ELEKTRİK ELEKTRONİK MÜHENDİSLİĞİ ENSTİTÜSÜ) TOPLULUĞU",
  "İKTİSADİ ve İDARİ BİLİMLER TOPLULUĞU",
  "İLİM YAYMA ve SOSYAL AKTİVİTELER TOPLULUĞU",
  "İNGİLİZ EDEBİYATI TOPLULUĞU",
  "İNOVASYON ve LİDERLİK TOPLULUĞU",
  "İNSANSIZ SİSTEMLER TOPLULUĞU",
  "İNŞAAT TOPLULUĞU",
  "KALİTE GÖNÜLLÜLERİ TOPLULUĞU",
  "KARANDA İNSANSIZ HAVA ARAÇLARI TOPLULUĞU",
  "KARİYER VE GELECEK TOPLULUĞU",
  "KAZAKİSTAN ÖĞRENCİLER TOPLULUĞU",
  "KIZILAY TOPLULUĞU",
  "KİMYA BİLİMİ TOPLULUĞU",
  "KORUMALI FUTBOL TOPLULUĞU",
  "KÜLTÜREL MİRASI KORUMA TOPLULUĞU",
  "KÜTAHYA AHISKALI ÖĞRENCİLER TOPLULUĞU",
  "LİSAN-I HAL TOPLULUĞU",
  "LÖSEMİLİ ÇOCUKLARA FAYDA TOPLULUĞU",
  "MAKİNE MÜHENDİSLİĞİ TOPLULUĞU",
  "MATEMATİK, BİLİM VE EĞİTİM TOPLULUĞU",
  "MEDYA VE ANİMASYON TOPLULUĞU",
  "MİLLİ BİLİNÇ ve FARKINDALIK TOPLULUĞU",
  "MİLLİ DEĞERLERİ YAŞATMA TOPLULUĞU",
  "MOTORSİKLET ve BİSİKLET TOPLULUĞU",
  "MUHASEBE ARAŞTIRMALARI TOPLULUĞU",
  "MÜCEVHER ve TAKI TASARIM TOPLULUĞU",
  "MÜZİK TOPLULUĞU",
  "PROJE, EĞİTİM ve KÜLTÜR TOPLULUĞU",
  "RADYO TOPLULUĞU",
  "RESİM TOPLULUĞU",
  "RİSK TOPLULUĞU",
  "ROBOT ve OTOMASYON",
  "ROCK KÜLTÜR TOPLULUĞU",
  "SESİMİ DUYAN VARMI? TOPLULUĞU",
  "SİBER GÜVENLİK ÖĞRENCİ TOPLULUĞU",
  "SİMAV TEKNOLOJİ ve KÜLTÜR TOPLULUĞU",
  "SİYASAL DÜŞÜNCELER TOPLULUĞU",
  "SİYASETNAME TOPLULUĞU",
  "SOSYAL ETKİLEŞİM ve GEZİ TOPLULUĞU",
  "SOSYAL ETKİNLİK VE EĞLENCE TOPLULUĞU",
  "SOSYAL KÜLTÜR ve EĞLENCE",
  "SOSYAL ORYANTASYON SAHASI TOPLULUĞU",
  "SOSYOLOJİ TOPLULUĞU",
  "ŞAHİN ROKET SİSTEMLERİ TOPLULUĞU",
  "ŞEHİT KÜTÜPHANELERİ TOPLULUĞU",
  "TARİH BİRLİĞİ TOPLULUĞU",
  "TARİH KÜLTÜR VE FİKİR AKADEMİSİ TOPLULUĞU",
  "TARİH KÜLTÜR VE TURİZM TOPLULUĞU",
  "TARİHSEL DÖNÜŞÜM TOPLULUĞU",
  "TASARIM ve İNOVASYON TOPLULUĞU",
  "TEKNOFEST TOPLULUĞU",
  "THE MEDENİYET TOPLULUĞU",
  "TİYATRO TOPLULUĞU",
  "TURİSTİK GEZİ SOSYALLEŞME TOPLULUĞU",
  "TÜRK DÜNYASI ARAŞTIRMA TOPLULUĞU",
  "TÜRK TARİHİ TOPLULUĞU",
  "ULUSAL VE ULUSAŞIRI MESELELERDE US TOPLULUĞU",
  "ULUSLARARASI İLİŞKİLER TOPLULUĞU",
  "UZAY VE HAVACILIK TOPLULUĞU",
  "ÜNİVERSİTELİ AK GENÇLİK TOPLULUĞU",
  "VERİ BİLİMİ TOPLULUĞU",
  "VÜCUT GELİŞTİRME TOPLULUĞU",
  "YAPAY ZEKA ve BİLİŞİM TEKNOLOJİLERİ TOPLULUĞU",
  "YAŞAYAN ARAPÇA TOPLULUĞU",
  "YENİLER TOPLULUĞU",
];