import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/core/extension/string_extension.dart';
import 'package:akilli_kampus/view/home/model/anouncement_model/anouncement_model.dart';
import 'package:akilli_kampus/view/home/viewModel/home_page_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/components/Animation/Fade_Animation.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/widgets/shimmer/shimmer_widget.dart';


class AnouncementItem extends StatelessWidget {
  AnouncementItem({Key? key, required this.anouncementModel, required this.viewModel}) : super(key: key);

  final AnouncementModel anouncementModel;
  final HomePageViewModel viewModel;

  NavigationService navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          buildAnouncementImage(context),
          buildAnouncementTextDetails(context),
        ],
      ),
    );
  }

  Expanded buildAnouncementTextDetails(BuildContext context) {
    return Expanded(
      child: ListTile(
        onTap: () {
          viewModel.navigation.navigateToPage(path: NavigationConstants.NEWS_DETAILS,data: anouncementModel);
        },
        title: anouncementModel.toJson().isNotEmpty
            ? Text(
          anouncementModel.title,
          style:  TextStyle(color: viewModel.isDarkTheme(context) ? Colors.white : const Color(0xFF615FE8),fontSize: 14),
        )
            : ShimmerWidget.rectangular(heigth: 15),
        subtitle: anouncementModel.toJson().isNotEmpty
            ? RichText(
          textAlign: TextAlign.right,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: "\n",//anouncementModel.content.getFirst15Words,
                style: context.textTheme?.newsListSubtitle,
              ),
              TextSpan(
                  text: 'Daha fazla oku..',
                  style: context.textTheme?.newsListReadMore),
            ]))
            : ShimmerWidget.rectangular(heigth: 15),
      ),
    );
  }

  SizedBox buildAnouncementImage(BuildContext context) {
    return SizedBox(
        width: context.width * 0.2,
        height: context.height * 0.09,
        child: anouncementModel.imageUrl != null
            ? FadeAnimation(
            delay: 1,
            child: CachedNetworkImage(
              imageUrl: anouncementModel.imageUrl.toString(),
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  ShimmerWidget.rectangular(heigth: 15),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ))
            : ShimmerWidget.rectangular(heigth: 30));
  }
}
