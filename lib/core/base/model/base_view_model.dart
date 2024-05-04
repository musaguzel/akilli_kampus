import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/enums/button_enum.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/remote/firebase_remote_config_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  /*ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance;

  LocaleManager localeManager = LocaleManager.instance;*/

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final FirebaseRemoteConfigStore firebaseRemoteConfigStore = FirebaseRemoteConfigStore(firebaseRemoteConfig: FirebaseRemoteConfig.instance);

  String dateFormat = 'yyyy-MM-dd HH:mm:ss';

  NavigationService navigation = NavigationService.instance;

  ButtonState buttonState = ButtonState.init;

  void launchURL(String navigateUrl) async {
    final Uri url = Uri.parse(navigateUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.externalApplication);
    } else {
      throw 'Web sitesi açılamıyor: $navigateUrl';
    }
  }

  bool isDarkTheme(BuildContext context){
    if (Theme.of(context).brightness == Brightness.light) {
    return false;
    } else {
      return true;
    }
  }


  void setContext(BuildContext context);
  void init();

  void playSound(String audioAsset) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(audioAsset),
      autoStart: true,
      showNotification: true,
    );
  }
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showsnackbar({required String message,Color? backgroundColor,SnackBarAction? snackBarAction}){
    var snackBar = SnackBar(content: Text(message.toString()),backgroundColor: backgroundColor ?? Colors.white,action: snackBarAction,);
    return ScaffoldMessenger.of(viewModelContext).showSnackBar(snackBar);
  }




  void showOrCloseLoadingDialog({required bool shouldShow}) {
    if (viewModelContext.mounted && shouldShow) {
      showDialog(
        context: viewModelContext,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const CupertinoAlertDialog(
              title: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      );
    } else {
      Navigator.of(viewModelContext, rootNavigator: true).pop();
    }
  }
}