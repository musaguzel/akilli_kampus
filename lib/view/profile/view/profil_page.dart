import 'package:akilli_kampus/core/base/view/base_widget.dart';
import 'package:akilli_kampus/view/profile/viewModel/profile_page_view_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool ekonomiSelected = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: ProfilePageViewModel(), onModelReady: (model){

    },
      onPageBuilder: (context,viewModel,networkResult) => Scaffold(
        appBar: AppBar(
          title: const Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                'Profil',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: 24,
            ),
          ]),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    'Bildirimleri açarak anında güncel haberleri takip edin!',
                    style: TextStyle(
                      fontSize: 12,
                      color: viewModel.isDarkTheme(context) ? Colors.white : Colors.black
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ekonomiSelected = !ekonomiSelected;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: const Text("Bildirimler"),
                          trailing: Switch(
                            value: ekonomiSelected,
                            onChanged: (value) {
                              setState(() {
                                ekonomiSelected = !ekonomiSelected;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Buraya Şifre Değiştir ile ilgili yapılacak işlemleri ekle
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: Text("Şifre Değiştir"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Buraya Privacy ile ilgili yapılacak işlemleri ekle
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: Text("Privacy"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Buraya Terms & Conditions ile ilgili yapılacak işlemleri ekle
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: Text("Terms & Conditions"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Buraya Çıkış Yap ile ilgili yapılacak işlemleri ekle
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          title: Text("Çıkış Yap"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}