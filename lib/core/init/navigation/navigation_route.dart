import 'package:akilli_kampus/view/change_password/view/change_password._page.dart';
import 'package:akilli_kampus/view/home/view/news_details_page.dart';
import 'package:akilli_kampus/view/main/view/main_page.dart';
import 'package:akilli_kampus/view/privacy_policy/view/privacy_policy_page.dart';
import 'package:akilli_kampus/view/sos/view/sos.dart';
import 'package:akilli_kampus/view/splash/view/splash_view.dart';
import 'package:akilli_kampus/view/terms_conditions/view/terms_conditions._page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../product/exception/navigate_model_not_found.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {

      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT ,args.arguments); //SplashView

      case NavigationConstants.CHANGE_PASSWORD:
        return normalNavigate(const ChangePassword(), NavigationConstants.CHANGE_PASSWORD ,args.arguments); //SplashView

      case NavigationConstants.PRIVACY_POLICY:
        return normalNavigate(const PrivacyPolicy(), NavigationConstants.CHANGE_PASSWORD ,args.arguments);

      case NavigationConstants.NEWS_DETAILS:
        return normalNavigate(const NewsDetailsPage(), NavigationConstants.NEWS_DETAILS ,args.arguments);

      case NavigationConstants.TERMS_CONDITIONS:
        return normalNavigate(const Terms(), NavigationConstants.TERMS_CONDITIONS ,args.arguments);

      case NavigationConstants.QR:
        return normalNavigate(const PrivacyPolicy(), NavigationConstants.QR ,args.arguments);

      case NavigationConstants.MAIN:
        return normalNavigate( const MainPage(), NavigationConstants.MAIN ,args.arguments);

      case NavigationConstants.EMERGENCYBUTTON:
        return normalNavigate( const EmergencyButtonApp(), NavigationConstants.EMERGENCYBUTTON ,args.arguments);

      case NavigationConstants.NOTFOUND:
        return normalNavigate( const NotFoundNavigationWidget(), NavigationConstants.NOTFOUND ,args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  PageTransition normalNavigate(Widget widget, String pageName,Object? data) {
    return PageTransition(
        type: PageTransitionType.fade,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName,arguments: data),child: widget,
    );
  }
  /*MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }*/
}

//
