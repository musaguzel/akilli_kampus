import 'package:akilli_kampus/core/init/theme/app_theme.dart';
import 'package:akilli_kampus/view/main/view/main_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/network/main_build.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/remote/firebase_remote_config_service.dart';
import 'firebase_options.dart';


Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: const MyApp(),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage (RemoteMessage message) async {

}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);

  //Paint.enableDithering = true;
  await FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  final firebaseRemoteConfigService = FirebaseRemoteConfigStore(
    firebaseRemoteConfig: FirebaseRemoteConfig.instance,
  );
  await firebaseRemoteConfigService.init();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: MainBuild.build,
      darkTheme: ThemeData.dark(),
      theme:  MyAppTheme,
      //theme: MyAppTheme,
      //darkTheme: MyDarkAppTheme,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}


