// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_remote_config_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirebaseRemoteConfigStore on _FirebaseRemoteConfigStore, Store {
  late final _$streamerAnnouncementAtom = Atom(
      name: '_FirebaseRemoteConfigStore.streamerAnnouncement',
      context: context);

  @override
  Map<String, dynamic> get streamerAnnouncement {
    _$streamerAnnouncementAtom.reportRead();
    return super.streamerAnnouncement;
  }

  @override
  set streamerAnnouncement(Map<String, dynamic> value) {
    _$streamerAnnouncementAtom.reportWrite(value, super.streamerAnnouncement,
        () {
      super.streamerAnnouncement = value;
    });
  }

  late final _$fetchStreamerAnnouncementAsyncAction = AsyncAction(
      '_FirebaseRemoteConfigStore.fetchStreamerAnnouncement',
      context: context);

  @override
  Future<void> fetchStreamerAnnouncement() {
    return _$fetchStreamerAnnouncementAsyncAction
        .run(() => super.fetchStreamerAnnouncement());
  }

  late final _$initAsyncAction =
      AsyncAction('_FirebaseRemoteConfigStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
streamerAnnouncement: ${streamerAnnouncement}
    ''';
  }
}
