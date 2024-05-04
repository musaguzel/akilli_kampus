import 'package:flutter/material.dart';

class Meal {
  final String date;
  final String day;
  final String soup;
  final String mainCourse;
  final String sideDish;
  final String dessert;
  final int totalCalories;

  Meal({
    required this.date,
    required this.day,
    required this.soup,
    required this.mainCourse,
    required this.sideDish,
    required this.dessert,
    required this.totalCalories,
  });
}

class yemekhane extends StatelessWidget {
  final List<Meal> meals = [
    Meal(
      date: "2024-02-05",
      day: "Pazartesi",
      soup: "SÜLEYMANİYE ÇORBA",
      mainCourse: "KIYMALI YUMURTA",
      sideDish: "YOG MANTI",
      dessert: "MEYVE",
      totalCalories: 998,
    ),
    Meal(
      date: "2024-02-06",
      day: "Salı",
      soup: "ŞEHRİYE ÇORBA",
      mainCourse: "BALIK",
      sideDish: "FASULYE PİYAZ",
      dessert: "IRMIK HELVA",
      totalCalories: 1236,
    ),
    Meal(
      date: "2024-02-07",
      day: "Çarşamba",
      soup: "EZOGELİN ÇORBA",
      mainCourse: "SEBZELİ KÖFTE",
      sideDish: "SADE BULGUR PILAVI KEMALPASA",
      dessert: "MEYVE",
      totalCalories: 1144,
    ),
    Meal(
      date: "2024-02-08",
      day: "Perşembe",
      soup: "TAVUK SUYU ÇORBA",
      mainCourse: "KIYMALI KURU FASULYE",
      sideDish: "PİRİNG PILAVI",
      dessert: "CACIK",
      totalCalories: 1002,
    ),
    Meal(
      date: "2024-02-09",
      day: "Cuma",
      soup: "KÖY ÇORBA",
      mainCourse: "PÜRELİ KEBAP",
      sideDish: "ERİSTE",
      dessert: "SÜTLAÇ",
      totalCalories: 1195,
    ),
    Meal(
      date: "2024-02-12",
      day: "Pazartesi",
      soup: "DOMATES ÇORBA",
      mainCourse: "KIYMALI FIRIN PATATES",
      sideDish: "SOSLU MAKARNA",
      dessert: "CACIK",
      totalCalories: 968,
    ),
    Meal(
      date: "2024-02-13",
      day: "Salı",
      soup: "YAYLA ÇORBA",
      mainCourse: "TAVUK BAGET",
      sideDish: "MERCİMEKLİ ERİŞTE",
      dessert: "SUPANGLE",
      totalCalories: 1005,
    ),
    Meal(
      date: "2024-02-14",
      day: "Çarşamba",
      soup: "DIMDIK ÇORBA",
      mainCourse: "KIYMALI NOHUT",
      sideDish: "ŞEH PİRİNÇ PİLAVI",
      dessert: "MEYVE",
      totalCalories: 930,
    ),
    Meal(
      date: "2024-02-15",
      day: "Perşembe",
      soup: "TARHANA ÇORBA",
      mainCourse: "TERBİYELİ KÖFTE",
      sideDish: "BÖREK",
      dessert: "AYRAN",
      totalCalories: 930,
    ),
    Meal(
      date: "2024-02-16",
      day: "Cuma",
      soup: "SOĞAN ÇORBA",
      mainCourse: "HAŞLAMA ET",
      sideDish: "ŞEHRİYELİ BULGUR PİLAVI",
      dessert: "SEKERPARE",
      totalCalories: 1270,
    ),
    Meal(
      date: "2024-02-19",
      day: "Pazartesi",
      soup: "MERCİMEK ÇORBA",
      mainCourse: "KIYMALI ISPANAK",
      sideDish: "",
      dessert: "",
      totalCalories: 0, // Bu günün verisi eksik, bu yüzden kalori değeri 0
    ),
    // Diğer yemekler buraya eklenebilir
  ];

   yemekhane({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Yemekhane'),
        ),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealCard(meal: meals[index]);
          },
        ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(meal.day),
        subtitle: Text(meal.date),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(meal.date),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Çorba: ${meal.soup}"),
                    Text("Ana Yemek: ${meal.mainCourse}"),
                    Text("Yan Yemek: ${meal.sideDish}"),
                    Text("Tatlı: ${meal.dessert}"),
                    Text("Toplam Kalori: ${meal.totalCalories}"),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Kapat'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}