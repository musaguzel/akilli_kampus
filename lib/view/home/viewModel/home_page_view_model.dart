import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../../../core/base/model/base_view_model.dart';
import '../model/anouncement_model/anouncement_model.dart';
import '../model/news_model/news_model.dart';
part 'home_page_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store,BaseViewModel {


  @observable
  ObservableList<Map<String,dynamic>> sliderImages = ObservableList<Map<String,dynamic>>();
  @observable
  ObservableList<AnouncementModel> anouncementPosts = ObservableList<AnouncementModel>();

  @observable
  bool sliderImagesLoading = false;


  @observable
  int sliderImageActiveIndex = 0;


  @override
  Future<void> init() async {
   getAnouncementStream().listen(updateAnouncementList);
   await fetchNews();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  Stream<QuerySnapshot> getAnouncementStream() {
    return firebaseFirestore.collection('duyurular').snapshots();
  }

  @action
  Future<void> updateAnouncementList(QuerySnapshot snapshot) async {
    anouncementPosts.clear();
    snapshot.docs.forEach((doc) {
      anouncementPosts.add(AnouncementModel.fromJson(doc.data() as Map<String, dynamic>));
    });
  }

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>();

  @action
  Future<void> fetchNews() async {
    changeLoading();
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('haber').get();
      newsList.clear();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final news = NewsModel.fromJson(data);
          newsList.add(news);
        }
      } else {
        // Koleksiyonda belge bulunamadı
      }
    } catch (e) {
      // Hata durumunda buraya düşecek
      print("Haberler alınırken bir hata oluştu: $e");
    }
    changeLoading();
  }


  @action
  void changeLoading() {
    sliderImagesLoading = !sliderImagesLoading;
  }
}