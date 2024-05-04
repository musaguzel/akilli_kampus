import 'dart:ui';
import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/view/main/viewModel/main_page_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/base/view/base_widget.dart';
import '../../core/init/network/network_change_manager.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: MainPageViewModel() , onModelReady: (model)
    {

    },onPageBuilder: (context,viewModel,networkResult) => buildAnimatedCrossFade
    (context,networkResult)
    );
  }

  AnimatedCrossFade buildAnimatedCrossFade(BuildContext context,NetworkResult networkResult) {
    return AnimatedCrossFade(
      duration: context.lowDuration,
      crossFadeState: networkResult == NetworkResult.off ? CrossFadeState
          .showFirst : CrossFadeState.showSecond,
      firstChild: Container(alignment: Alignment.center,decoration: const BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15))),
          height: context.height * 0.1,width: context.width,child: Text('İnternet Baglantınızı Kontrol Edin',textAlign: TextAlign.center,),),
      secondChild: const SizedBox(),
    );
  }
}

