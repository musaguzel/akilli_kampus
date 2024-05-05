import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/network/network_change_manager.dart';
import '../viewModel/login_page_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: LoginPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
        },
        onPageBuilder: (context, viewModel, networkResult) => Scaffold(
              resizeToAvoidBottomInset: false,
              body:GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    child: buildForm(networkResult,viewModel),
                  ),
                ),

            ));
  }

  Form buildForm(NetworkResult networkResult,LoginPageViewModel viewModel) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: viewModel.formState,
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            sizedBox1,
            Image.asset('DPUTAK LOGO'.toPNG),
            textFieldEmail(context, viewModel),
            sizedBox2,
            textFieldPassword(context, viewModel),
            textForgotPassword(viewModel),
            sizedBox2,
            ButtonLogin(networkResult,viewModel),
            sizedBox3,
            //rowLoginWithSteam,
            wrapSignUp(networkResult)
          ],
        ),
      ),
    );
  }

  SizedBox get sizedBox1 => SizedBox(height: dynamicHeight(0.15));

  TextFormField textFieldEmail(
      BuildContext context, LoginPageViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? null : "Hatalı E-mail",
      decoration: const InputDecoration(
          labelText: "E-mail",
          icon: Icon(Icons.email)),
    );
  }

  SizedBox get sizedBox2 => const SizedBox(
        height: 14,
      );

  Observer textFieldPassword(
      BuildContext context, LoginPageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return TextFormField(
          controller: viewModel.passwordController,
          validator: (value) =>
              value!.isNotEmpty ? null : "Bu Alan Gerekli",
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
            labelText: "Şifre",
            icon: const Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              onPressed: () {
                viewModel.isLockStateChange();
              },
              padding: EdgeInsets.zero,
              icon: Observer(
                builder: (_) {
                  return Icon(
                      viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Padding textForgotPassword (LoginPageViewModel viewModel){
    return Padding(
      padding: context.paddingLowVertical,
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
            child: const Text("Şifremi Unuttum",
              textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
            onPressed: () {
              //viewModel.navigation.navigateToPage(path: NavigationConstants.FORGOT_PASSWORD);
            }),
      ),
    );
  }

  ElevatedButton ButtonLogin(NetworkResult networkResult,LoginPageViewModel viewModel) {
    return ElevatedButton(
      onPressed: () async {
        FocusScope.of(context).unfocus();
        if (viewModel.emailController.text.isNotEmpty &&
            viewModel.passwordController.text.isNotEmpty) {
          await viewModel.loginWithEmailAndPassword(context);
        }
      },

      child: const Text("Giriş Yap"),
    );
  }

  SizedBox get sizedBox3 {
    return SizedBox(
      height: dynamicHeight(0.07),
    );
  }


  Spacer get spacer => const Spacer();

  Padding wrapSignUp(NetworkResult networkResult) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 12,
        children: [
          const Text(
            'Hala bir hesabın yok mu ?',
          ),
          ElevatedButton(
              onPressed: () {
                navigation.navigateToPage(path: NavigationConstants.REGISTER);
              },

              child: const Text("Üye Ol"),),
        ],
      ),
    );
  }
}
