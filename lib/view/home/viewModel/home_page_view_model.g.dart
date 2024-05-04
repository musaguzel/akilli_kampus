// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  late final _$sliderImagesAtom =
      Atom(name: '_HomePageViewModelBase.sliderImages', context: context);

  @override
  ObservableList<Map<String, dynamic>> get sliderImages {
    _$sliderImagesAtom.reportRead();
    return super.sliderImages;
  }

  @override
  set sliderImages(ObservableList<Map<String, dynamic>> value) {
    _$sliderImagesAtom.reportWrite(value, super.sliderImages, () {
      super.sliderImages = value;
    });
  }

  late final _$anouncementPostsAtom =
      Atom(name: '_HomePageViewModelBase.anouncementPosts', context: context);

  @override
  ObservableList<AnouncementModel> get anouncementPosts {
    _$anouncementPostsAtom.reportRead();
    return super.anouncementPosts;
  }

  @override
  set anouncementPosts(ObservableList<AnouncementModel> value) {
    _$anouncementPostsAtom.reportWrite(value, super.anouncementPosts, () {
      super.anouncementPosts = value;
    });
  }

  late final _$sliderImagesLoadingAtom = Atom(
      name: '_HomePageViewModelBase.sliderImagesLoading', context: context);

  @override
  bool get sliderImagesLoading {
    _$sliderImagesLoadingAtom.reportRead();
    return super.sliderImagesLoading;
  }

  @override
  set sliderImagesLoading(bool value) {
    _$sliderImagesLoadingAtom.reportWrite(value, super.sliderImagesLoading, () {
      super.sliderImagesLoading = value;
    });
  }

  late final _$sliderImageActiveIndexAtom = Atom(
      name: '_HomePageViewModelBase.sliderImageActiveIndex', context: context);

  @override
  int get sliderImageActiveIndex {
    _$sliderImageActiveIndexAtom.reportRead();
    return super.sliderImageActiveIndex;
  }

  @override
  set sliderImageActiveIndex(int value) {
    _$sliderImageActiveIndexAtom
        .reportWrite(value, super.sliderImageActiveIndex, () {
      super.sliderImageActiveIndex = value;
    });
  }

  late final _$newsListAtom =
      Atom(name: '_HomePageViewModelBase.newsList', context: context);

  @override
  ObservableList<NewsModel> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(ObservableList<NewsModel> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  late final _$updateAnouncementListAsyncAction = AsyncAction(
      '_HomePageViewModelBase.updateAnouncementList',
      context: context);

  @override
  Future<void> updateAnouncementList(QuerySnapshot<Object?> snapshot) {
    return _$updateAnouncementListAsyncAction
        .run(() => super.updateAnouncementList(snapshot));
  }

  late final _$fetchNewsAsyncAction =
      AsyncAction('_HomePageViewModelBase.fetchNews', context: context);

  @override
  Future<void> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  late final _$_HomePageViewModelBaseActionController =
      ActionController(name: '_HomePageViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sliderImages: ${sliderImages},
anouncementPosts: ${anouncementPosts},
sliderImagesLoading: ${sliderImagesLoading},
sliderImageActiveIndex: ${sliderImageActiveIndex},
newsList: ${newsList}
    ''';
  }
}
