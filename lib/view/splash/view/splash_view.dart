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
    return const Scaffold(
      body:  CustomGradientBackground(
        child: Center(
          child: Text('Akıllı Kampüs'),
        ),
      )
    );
  }



}
