import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/network/network_change_manager.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {

  final INetworkChangeManager _networkChange = NetworkChangeManager();



  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    await fetchFirstResult();
   // await updateConsent();
    Future.delayed(const Duration(seconds: 2)).then((value) {

        firebaseAuth.authStateChanges().listen((User? user) {
          if (user == null) {
            navigation.navigateToPageClear(path: NavigationConstants.MAIN);
            debugPrint("çıkış yapıldı");
          } else {
            navigation.navigateToPageClear(path:  NavigationConstants.MAIN);
            debugPrint("giriş yapıldı");
          }
        });
    });
  }

  @action
  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  @action
  void _updateView(NetworkResult result) {
  }

  /*@action
  Future<void> updateConsent() async {
    // Make sure to continue with the latest consent info.
    var info = await UserMessagingPlatform.instance.requestConsentInfoUpdate();

    // Show the consent form if consent is required.
    if (info.consentStatus == ConsentStatus.required) {
      // `showConsentForm` returns the latest consent info, after the consent from has been closed.
      info = await UserMessagingPlatform.instance.showConsentForm();
    }
  }*/
}
