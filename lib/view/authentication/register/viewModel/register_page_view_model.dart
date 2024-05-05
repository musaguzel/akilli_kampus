import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/firebase/firebase_constants.dart';
import '../model/user_model.dart';

part 'register_page_view_model.g.dart';

class RegisterPageViewModel = _RegisterPageViewModelBase
    with _$RegisterPageViewModel;

abstract class _RegisterPageViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @action
  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    try {

        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);



          showsnackbar(
              message: 'Hesap Oluşturuldu', backgroundColor: Colors.green);

    } catch (error) {
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-email':
            showsnackbar(message: 'Geçersiz E-mail');
            break;
          case 'network-request-failed':
            showsnackbar(message: 'Ağ Bağlantı Hatası');
            break;
          case 'weak-password':
            showsnackbar(
                message:
                'Zayıf Parola');
            break; //No such user found
          case 'email-already-in-use':
            showsnackbar(message: 'Bu E-mail Zaten Kullanımda');
            break;
        }
      }
    }
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLock = true;

  @observable
  bool emailValidate = false;

  @action
  void isLockStateChange() {
    isLock = !isLock;
  }
}
