import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';

part 'main_page_view_model.g.dart';

class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase
    with Store, BaseViewModel, ChangeNotifier {

  @override
  Future<void> init() async {

  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  int selectedTabIndex = 0;

  //@observable
  //UserModel? currentUser;

  @action
  void setTabIndex(int index) {
    selectedTabIndex = index;
  }

}