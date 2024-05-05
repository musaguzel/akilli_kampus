import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/Animation/Fade_Animation.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../viewModel/register_page_view_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: RegisterPageViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          //model.init();
        },
        onPageBuilder: (context, viewModel,networkResult) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('DPUTAK'),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: buildForm(viewModel, context),
                  ),
                ),

            ));
  }

  Form buildForm(RegisterPageViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: viewModel.formState,
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTitle(context),
            sizedBox2,
            textFieldFullName(context, viewModel),
            sizedBox2,
            textFieldEmail(context, viewModel),
            sizedBox2,
            textFieldPassword(context, viewModel),
            sizedBox2,
            textFieldConfirmPassword(context, viewModel),
            sizedBox2,
            elevatedButtonLogin(context,viewModel),
            sizedBox3(context),
          ],
        ),
      ),
    );
  }

  FadeAnimation buildTitle(BuildContext context) => FadeAnimation(delay: 0.2,child: Text("Üye Ol",textAlign: TextAlign.center,style: context.textTheme?.headline5,));



  FadeAnimation textFieldFullName(
      BuildContext context, RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: TextFormField(
        controller: viewModel.fullNameController,
        validator: (value) => value!.isNotEmpty ? null : "Bu Alan Gerekli",
        decoration: const InputDecoration(
            labelText: "Tam Adınız",
            icon: Icon(Icons.drive_file_rename_outline)),
      ),
    );
  }

  FadeAnimation textFieldEmail(
      BuildContext context, RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: TextFormField(
        controller: viewModel.emailController,
        validator: (value) {
          if (value!.isValidEmails) {
            viewModel.emailValidate = true;
            return null;
          } else {
            viewModel.emailValidate = false;
            return "Bu Alan Gerekli";
          }
        },
        decoration: const InputDecoration(
            labelText: "Okul E-mail Adresiniz",
            icon: Icon(Icons.email)),
      ),
    );
  }

  SizedBox get sizedBox2 => const SizedBox(
        height: 14,
      );

  Observer textFieldPassword(
      BuildContext context, RegisterPageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return FadeAnimation(
          delay: 0.2,
          child: TextFormField(
            controller: viewModel.passwordController,
            validator: (value) =>
                value!.isNotEmpty ? null : 'Bu Alan Gerekli',
            obscureText: viewModel.isLock,
            decoration: InputDecoration(
              labelText: 'Şifre',
              icon: const Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                icon: Observer(
                  builder: (_) {
                    return Icon(
                        viewModel.isLock ? Icons.lock : Icons.lock_open);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Observer textFieldConfirmPassword(
      BuildContext context, RegisterPageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return FadeAnimation(
          delay: 0.2,
          child: TextFormField(
            controller: viewModel.confirmPasswordController,
            validator: (value) =>
            value!.isNotEmpty ? null : 'Bu Alan Gerekli',
            obscureText: viewModel.isLock,
            decoration: const InputDecoration(
              labelText: 'Şifrenizi Onaylayın',
              icon: Icon(Icons.vpn_key),
            ),
          ),
        );
      },
    );
  }


  FadeAnimation elevatedButtonLogin(BuildContext context,RegisterPageViewModel viewModel) {
    return FadeAnimation(
      delay: 0.2,
      child: ElevatedButton(
        child: Center(
          child: Text(
            'Üye Ol',
            style: context.textTheme?.buttonTextStyle2,
          ),
        ),
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if(viewModel.fullNameController.text.isNotEmpty
              && viewModel.emailValidate
              && viewModel.passwordController.text.isNotEmpty
              && viewModel.confirmPasswordController.text.isNotEmpty)
          {
            if(viewModel.passwordController.text == viewModel.confirmPasswordController.text){
              await viewModel.createUserWithEmailAndPassword(context);
            }else{
              viewModel.showsnackbar(message: 'Şifreler Uyuşmuyor');
            }
          }else{
            viewModel.showsnackbar(message: 'Bir Hatayla Karşılaşıldı');
          }
        },
      ),
    );
  }

  SizedBox sizedBox3(BuildContext context) {
    return SizedBox(
      height: context.height * 0.07,
    );
  }
}
