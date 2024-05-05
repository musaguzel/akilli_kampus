
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
part 'login_page_view_model.g.dart';

class LoginPageViewModel = _LoginPageViewModelBase with _$LoginPageViewModel;

abstract class _LoginPageViewModelBase with Store,BaseViewModel{

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();


  @override
  void init() {
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<void> loginWithEmailAndPassword(BuildContext context) async {
    showDialog(context: viewModelContext, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim()).then((value) =>  NavigationConstants.MAIN);
    }catch(error){

      Navigator.of(viewModelContext).pop();
    }
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}