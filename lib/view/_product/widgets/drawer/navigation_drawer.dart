import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
            child: const Column(
              children: [
                Text("İyi Günler Musa ☀️",style: TextStyle(color: Color(0xFF4E4CCA)),),
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
          onTap: (){
            navigation.navigateToPageClear(path: NavigationConstants.MAIN);
          },
        ),
        ListTile(
          leading: const Icon(Icons.reorder_sharp,color: Color(0xFF4E4CCA),),
          title: const Text("Öğrenci Toplulukları",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.MAIN);
          },
        ),
        ListTile(
          leading: const Icon(Icons.currency_lira,color: Color(0xFF4E4CCA),),
          title: const Text("Qr ile ödeme",style: TextStyle(color: Color(
              0xFF9C9BE0)),),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.MAIN,);
          },
        ),if(!kIsWeb)ListTile(
          leading: const Icon(Icons.support_agent,color: Color(0xFF4E4CCA),),
          title: const Text("Destek",style: TextStyle(color: Color(0xFF9C9BE0)),),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.MAIN,);
          },
        ),
        const Divider(color: Colors.pink,),
        ListTile(
          leading: const Icon(Icons.person,color: Color(0xFF4E4CCA),),
          title: const Text("Profil",style: TextStyle(color: Color(0xFF9C9BE0)),),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.MAIN,);
          },
        ),
      ],
    ),
  );


}
