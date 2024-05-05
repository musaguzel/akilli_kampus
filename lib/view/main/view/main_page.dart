import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/product/widgets/shimmer/shimmer_widget.dart';
import 'package:akilli_kampus/view/home/view/home_page.dart';
import 'package:akilli_kampus/view/profile/view/profil_page.dart';
import 'package:akilli_kampus/view/qr/view/qr_page.dart';
import 'package:akilli_kampus/view/restourant/view/restourant_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/network/network_change_manager.dart';
import '../../_product/widgets/alert_dialog/streamer_announcement_dialog.dart';
import '../../_product/widgets/drawer/navigation_drawer.dart';
import '../viewModel/main_page_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainPageProviderWatch = Provider.of<MainPageViewModel>(context);
    final mainPageProviderRead =
        Provider.of<MainPageViewModel>(context, listen: false);
    return BaseView(
        viewModel: MainPageViewModel(),
        onModelReady: (model) async {
          model.setContext(context);
          mainPageProviderRead.init();
          model.firebaseRemoteConfigStore
              .fetchStreamerAnnouncement()
              .then((value) => checkAnnouncement(context, model));
        },
        onPageBuilder: (context, viewModel, networkResult) =>
            buildDefaultTabController(
                context, viewModel, networkResult, mainPageProviderWatch));
  }

  DefaultTabController buildDefaultTabController(
      BuildContext context,
      MainPageViewModel viewModel,
      NetworkResult networkResult,
      MainPageViewModel mainPageProviderWatch) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: NavigationDrawerMain(),
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff475AD7),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: context.height * 0.9,
                      child: const WebView(
                        initialUrl: 'https://poe.com/DPU-CHATBOTS',
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    );
                  },
                );
              
              },
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            shape: const CircularNotchedRectangle(),
            child: TabBar(
                indicatorColor: const Color(0xff475AD7),
                onTap: (currentIndex) {
                  viewModel.setTabIndex(currentIndex);
                },
                tabs: [
                  buildObserver(
                      viewModel: viewModel,
                      icon: Icons.home,
                      selectedTabIndex: 0,
                      text: 'Ana Sayfa'),
                  buildObserver(
                      viewModel: viewModel,
                      icon: Icons.fastfood_outlined,
                      selectedTabIndex: 1,
                      text: "Yemekhane"),
                  buildObserver(
                      viewModel: viewModel,
                      icon: Icons.qr_code,
                      selectedTabIndex: 2,
                      text: 'QR'),
                  buildObserver(
                      viewModel: viewModel,
                      icon: Icons.person,
                      selectedTabIndex: 3,
                      text: 'Profile'),
                ]),
          ),
          appBar: buildAppBar(
              context, viewModel, networkResult, mainPageProviderWatch),
          resizeToAvoidBottomInset: false,
          body: networkResult == NetworkResult.on
              ? buildTabBarView
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  TabBarView get buildTabBarView {
    return  TabBarView(children: [
      const HomePage(),
      yemekhane(),
      const QRCodeWidget(),
      const ProfilePage(),
    ]);
  }

  AppBar buildAppBar(BuildContext context, MainPageViewModel viewModel,
      NetworkResult networkResult, MainPageViewModel mainPageProviderWatch) {
    return AppBar(
      title: const Text("DPUTAK"),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              imageUrl: 'https://avatars.githubusercontent.com/u/102770456?v=4',
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  ShimmerWidget.rectangular(heigth: 15),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        )
      ],
    );
  }

  SizedBox get buildSizedBoxWidth5 => const SizedBox(
        width: 5,
      );

  Observer buildObserver(
      {required MainPageViewModel viewModel,
      required IconData icon,
      required int selectedTabIndex,
      required String text}) {
    return Observer(builder: (_) {
      return Tab(
        icon: Icon(
          icon,
          color: viewModel.selectedTabIndex == selectedTabIndex
              ? const Color(0xff475AD7)
              : Colors.grey,
        ),
        text: text,
      );
    });
  }

  void checkAnnouncement(BuildContext context, MainPageViewModel viewModel) {
    var anyNewAnnouncements = viewModel
                .firebaseRemoteConfigStore.streamerAnnouncement['active']
                .toString() ==
            "true"
        ? true
        : false;

    //uygulama güncel.
    if (anyNewAnnouncements) {
      //Duyuru var mı kontrol et.
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StreamerAnnouncementDialog(viewModel: viewModel);
          });
    }
  }
}
