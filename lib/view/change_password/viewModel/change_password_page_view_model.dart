import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/model/base_view_model.dart';
part 'change_password_page_view_model.g.dart';

class ChangePasswordPageViewModel = _ChangePasswordPageViewModelBase with _$ChangePasswordPageViewModel;

abstract class _ChangePasswordPageViewModelBase with Store,BaseViewModel {
  @override
  Future<void> init() async {

  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

}