import 'package:akilli_kampus/view/academic_calendar/view/academic_calendar_page.dart';
import 'package:akilli_kampus/view/authentication/login/view/login_page.dart';
import 'package:akilli_kampus/view/authentication/onboarding/view/onboarding_page.dart';
import 'package:akilli_kampus/view/authentication/register/view/register_page.dart';
import 'package:akilli_kampus/view/bank_card/view/bank_card_page.dart';
import 'package:akilli_kampus/view/change_password/view/change_password._page.dart';
import 'package:akilli_kampus/view/home/view/news_details_page.dart';
import 'package:akilli_kampus/view/main/view/main_page.dart';
import 'package:akilli_kampus/view/privacy_policy/view/privacy_policy_page.dart';
import 'package:akilli_kampus/view/restourant/view/restourant_page.dart';
import 'package:akilli_kampus/view/sos/view/sos.dart';
import 'package:akilli_kampus/view/splash/view/splash_view.dart';
import 'package:akilli_kampus/view/student_community/view/student_community_page.dart';
import 'package:akilli_kampus/view/suggestion/view/suggestion_page.dart';
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

      case NavigationConstants.STUDENT_COMMUNITY:
        return normalNavigate(const CommunitySearchPage(), NavigationConstants.STUDENT_COMMUNITY ,args.arguments);

      case NavigationConstants.SUGGESTION:
        return normalNavigate(const SuggestionPage(), NavigationConstants.SUGGESTION ,args.arguments);

      case NavigationConstants.RESTOURANT:
        return normalNavigate(yemekhane(), NavigationConstants.RESTOURANT ,args.arguments);

      case NavigationConstants.ONBOARDING:
        return normalNavigate(const OnBoardingScreen(), NavigationConstants.ONBOARDING ,args.arguments);

      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginPage(), NavigationConstants.LOGIN ,args.arguments);

      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterPage(), NavigationConstants.REGISTER ,args.arguments);

      case NavigationConstants.ACADEMIC_CALENDAR:
        return normalNavigate(const AcademicCalendar(), NavigationConstants.ACADEMIC_CALENDAR ,args.arguments);

      case NavigationConstants.BANK_CARD:
        return normalNavigate(BankaCard(), NavigationConstants.BANK_CARD ,args.arguments);

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
