import 'dart:convert';
import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mobx/mobx.dart';
part 'firebase_remote_config_service.g.dart';

class FirebaseRemoteConfigStore = _FirebaseRemoteConfigStore
    with _$FirebaseRemoteConfigStore;

abstract class _FirebaseRemoteConfigStore with Store {
  final FirebaseRemoteConfig firebaseRemoteConfig;

  _FirebaseRemoteConfigStore({required this.firebaseRemoteConfig});

  @observable
  Map<String, dynamic> streamerAnnouncement = {};



 /* @observable
  String streamLink = '';

  @observable
  bool streamLive = false;

  @observable
  bool favoritesEnabled = false;

  @observable
  String favoriteButtonType = '';*/

  @action
  Future<void> fetchStreamerAnnouncement() async {
    //streamerAnnouncement = firebaseRemoteConfig.getString('streamer_announcement');
    final jsonValue = await firebaseRemoteConfig.getString('stream_announcement');
    // JSON verisini ayrıştırmak
    //streamerAnnouncement = json.decode(jsonValue);
    if(jsonValue.isNotEmpty) {
      streamerAnnouncement =  json.decode(jsonValue);
    }
  }



  @action
  Future<void> init() async {
    try {
      await firebaseRemoteConfig.ensureInitialized();
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await firebaseRemoteConfig.fetchAndActivate();
    } on FirebaseException catch (e, st) {
      developer.log(
        'Firebase Remote Config başlatılamadı',
        error: e,
        stackTrace: st,
      );
    }
  }


}
