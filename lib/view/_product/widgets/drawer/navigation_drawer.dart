import 'package:akilli_kampus/view/weather/view/weather_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';



class NavigationDrawerMain extends StatelessWidget {
   NavigationDrawerMain({super.key});

  final NavigationService navigation = NavigationService.instance;

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) =>Container(
    color: Colors.transparent,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.indigo, // Çizgi rengi
                width: 3.0, // Çizgi kalınlığı
              ),),
            padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 50.0,right: 50.0),
            child:  Column(
              children: [
                const Text("İyi Günler",style: TextStyle(color: Color(0xFF4E4CCA),fontSize: 25,fontWeight: FontWeight.bold),),


                SizedBox(height: 140,child: WeatherPage()),

              ],
            ),
          ),
        ),

        const SizedBox(height: 7,),
      ],
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    child: Wrap(
      runSpacing: 8,
      children: [
        ListTile(
          leading: const Icon(Icons.add,color: Color(0xFF4E4CCA),),
          title: const Text("Akademik Takvim",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: () => selectedItem(context, 0),
        ),
        ListTile(
          leading: const Icon(Icons.reorder_sharp,color: Color(0xFF4E4CCA),),
          title: const Text("Öğrenci Toplulukları",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: ()=> selectedItem(context, 1),
        ),
        ListTile(
          leading: const Icon(Icons.credit_card,color: Color(0xFF4E4CCA),),
          title: const Text("DPUTAK KART",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: ()=> selectedItem(context, 2),
        ),if(!kIsWeb)ListTile(
          leading: const Icon(Icons.support_agent,color: Color(0xFF4E4CCA),),
          title: const Text("İstek & Öneri Bildirimi",style: TextStyle(color: Color(0xFF9C9BE0)),),
          onTap: ()=> selectedItem(context, 3),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(onPressed: () async {
              var link = 'https://obs.dpu.edu.tr/';
              Uri uri = Uri.parse(link);
              await launchUrl(uri);
            }, icon: const Icon(Icons.link), label: const Text("OBS'ye git")),
            ElevatedButton.icon(onPressed: () async {
              var link = 'https://oys.dpu.edu.tr/';
              Uri uri = Uri.parse(link);
              await launchUrl(uri);
            }, icon: const Icon(Icons.link), label: const Text("OYS'ye git"))
          ],
        ),
        const Divider(color: Colors.pink,),
        ListTile(
          leading: const Icon(Icons.person,color: Color(0xFF4E4CCA),),
          title: const Text("Acil Durum Çağrısı (Güvenlik)",style: TextStyle(color: Color(0xFF9C9BE0)),),
          onTap: ()=>selectedItem(context, 4),
        ),
      ],
    ),
  );

  void selectedItem(BuildContext context,int index){
    Navigator.of(context).pop();
    switch(index){
      case 0:
        navigation.navigateToPage(path: NavigationConstants.ACADEMIC_CALENDAR);
        break;
      case 1:
        navigation.navigateToPage(path: NavigationConstants.STUDENT_COMMUNITY);
        break;
      case 2:
        navigation.navigateToPage(path: NavigationConstants.BANK_CARD);
        break;
      case 3:
        navigation.navigateToPage(path: NavigationConstants.SUGGESTION);
        break;
      case 4:
        navigation.navigateToPage(path: NavigationConstants.EMERGENCYBUTTON);
        break;
    }
  }

}
