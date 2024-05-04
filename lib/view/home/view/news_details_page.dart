import 'package:akilli_kampus/core/base/view/base_widget.dart';
import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/view/home/model/news_model/news_model.dart';
import 'package:akilli_kampus/view/home/viewModel/home_page_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/components/Animation/Fade_Animation.dart';
import '../../../product/widgets/shimmer/shimmer_widget.dart';
import '../model/anouncement_model/anouncement_model.dart';


class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final AnouncementModel newsModel = ModalRoute.of(context)?.settings.arguments as AnouncementModel;
    return BaseView(viewModel: HomePageViewModel(),  onModelReady: (model){

    },
      onPageBuilder: (context,viewModel,networkResult) => Scaffold(
        body: FadeAnimation(
          delay: 0.5,
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context,newsModel),
              buildSliverToBoxAdapter(context,newsModel)
            ],
          ),
        ),
      )
      );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context, AnouncementModel newsModel) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: newsModel.title,
                  style: const TextStyle(fontSize: 25, color: Colors.indigo)),
              TextSpan(
                  text:
                  "\n${newsModel.content}",style: const TextStyle(color: Colors.black)),
          ]),
        ),
      ),
    ));
  }

  SliverAppBar buildSliverAppBar(BuildContext context,AnouncementModel newsModel) {
    return SliverAppBar(
      expandedHeight: context.height * 0.27,
      pinned: true,
      title: const Text("Haber Detayı"),
      flexibleSpace: FlexibleSpaceBar(
          background: CachedNetworkImage(
            imageUrl: newsModel.imageUrl.toString(),
            fit: BoxFit.fill,
            placeholder: (context, url) => ShimmerWidget.rectangular(heigth: 15),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
    );
  }
}
