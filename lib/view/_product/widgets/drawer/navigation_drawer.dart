import 'package:akilli_kampus/view/profile/viewModel/profile_page_view_model.dart';
import 'package:akilli_kampus/view/weather/view/weather_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../profile/view/profil_page.dart';



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
                const Text("İyi Günler Musa ",style: TextStyle(color: Color(0xFF4E4CCA),fontSize: 20,fontWeight: FontWeight.bold),),


                Container(height: 140,child: WeatherPage()),

              ],
            ),
          ),
        ),

        const SizedBox(height: 20,),
      ],
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
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
          leading: const Icon(Icons.currency_lira,color: Color(0xFF4E4CCA),),
          title: const Text("Qr ile ödeme",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: ()=> selectedItem(context, 2),
        ),if(!kIsWeb)ListTile(
          leading: const Icon(Icons.support_agent,color: Color(0xFF4E4CCA),),
          title: const Text("Destek",style: TextStyle(color: Color(0xFF9C9BE0)),),
          onTap: ()=> selectedItem(context, 3),
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
        navigation.navigateToPage(path: NavigationConstants.TERMS_CONDITIONS);
        break;
      case 2:
        navigation.navigateToPage(path: NavigationConstants.BANK_CARD);
        break;
      case 3:
        navigation.navigateToPage(path: NavigationConstants.CHANGE_PASSWORD);
        break;
      case 4:
        navigation.navigateToPage(path: NavigationConstants.EMERGENCYBUTTON);
        break;
      case 5:
        navigation.navigateToPage(path: NavigationConstants.EMERGENCYBUTTON);
        break;
      case 6:
        navigation.navigateToPage(path: NavigationConstants.EMERGENCYBUTTON);
        break;
    }
  }

}
