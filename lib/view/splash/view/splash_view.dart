import 'package:akilli_kampus/core/extension/string_extension.dart';
import 'package:akilli_kampus/product/gradient_background/gradient_background.dart';
import 'package:flutter/material.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_widget.dart';
import '../viewModel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends BaseState<SplashView> {


  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model)  {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context,viewModel,networkResult) => buildScaffoldBody(context,viewModel),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return  Scaffold(
      body:  CustomGradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('DPUTAK LOGO'.toPNG,height: 170,),
              const Center(
                child: ListTile(
                  title: Divider(color: Colors.indigo,thickness: 1 ,)           ,
                  subtitle: Center(child: Text('\nTeknolojik Akıllı Kampüs',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),

                ),
              )

            ],
          ),
        ),
      )
    );
  }



}
