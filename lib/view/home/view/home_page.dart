import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:akilli_kampus/product/gradient_background/gradient_background.dart';
import 'package:akilli_kampus/view/home/components/anouncement__item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/components/Animation/Fade_Animation.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../product/widgets/shimmer/shimmer_widget.dart';
import '../model/news_model/news_model.dart';
import '../viewModel/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
        viewModel: HomePageViewModel(),
        onModelReady: (model) async {
          model.setContext(context);
          await model.init();
        },
        onPageBuilder: (BuildContext context, HomePageViewModel viewModel,
            networkResult) =>
          Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height:  200 ,child: horizontalNewsList(viewModel)),
              buildNewsTitle(context,viewModel),
              //buildSliderImages(viewModel),
              buildNewsPostList(viewModel),
            ],
          ),
        ));
  }

  Padding  buildNewsTitle (BuildContext context,HomePageViewModel viewModel){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 12.0),
      child: Text(
        "Duyurular",
        style: TextStyle(fontSize: 25,color: viewModel.isDarkTheme(context) ? Colors.white : Colors.black),
      ),
    );
  }

  Observer buildSliderImages(HomePageViewModel viewModel) {
    return Observer(
      builder: (_) {
        return Column(children: [
          FadeAnimation(
            delay: 0.7,
            child: CarouselSlider.builder(
                itemCount: viewModel.sliderImagesLoading
                    ? 1
                    : viewModel.sliderImages.length,
                options: CarouselOptions(
                    height: 140,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    //viewportFraction: 1 sayfada 1 tane 1 tane resim gösterir
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) =>
                    viewModel.sliderImageActiveIndex = index),
                itemBuilder: (context, index, realIndex) {
                  if (viewModel.sliderImagesLoading) {
                    return ShimmerWidget.rectangular(
                        heigth: context.width * 0.75);
                  } else {
                    final urlImage = viewModel.sliderImages[index]['imageurl'].toString();
                    final redirectUrl = viewModel.sliderImages[index]['redirecturl'].toString();
                    return buildImage(urlImage, redirectUrl ,index, context,viewModel);
                  }
                }),
          ),
          const SizedBox(
            height: 7,
          ),
          buildIndicator(viewModel),
        ]);
      },
    );
  }

  Widget buildImage(String urlImage, String redirectUrl, int index, BuildContext context,HomePageViewModel viewModel) =>
      InkWell(
        onTap: (){
          redirectUrl.isNotEmpty ? viewModel.launchURL(redirectUrl) : null;
        },
        child: Container(
          margin: context.paddingLowHorizontal,
          color: Colors.grey,
          child: CachedNetworkImage(
            imageUrl: urlImage,
            fit: BoxFit.cover,
            placeholder: (context, url) => ShimmerWidget.rectangular(heigth: 15),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );

  Widget buildIndicator(HomePageViewModel viewModel) => Observer(
    builder: (_) {
      return AnimatedSmoothIndicator(
          effect: const ScrollingDotsEffect(
            dotHeight: 7.0,
            dotWidth: 7.0,
          ),
          activeIndex: viewModel.sliderImageActiveIndex,
          count: viewModel.sliderImages.length);
    },
  );

  Observer buildNewsPostList(HomePageViewModel viewModel) {
    return Observer(builder: (_) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: FadeAnimation(
            delay: 0.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final newsItem = viewModel.anouncementPosts[index];
                return AnouncementItem(
                  anouncementModel: viewModel.anouncementPosts[index],
                  viewModel: viewModel,
                );
              },
              itemCount: viewModel.anouncementPosts.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
      );
    });
  }

  Observer horizontalNewsList (HomePageViewModel viewModel) {
    return Observer(builder: (_){
      return ListView.builder(
        itemCount: viewModel.newsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final newsItem = viewModel.newsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: GestureDetector(
                onTap: () {
                },
                child: CachedNetworkImage(
                  imageUrl: viewModel.newsList[index].imageUrl.first,
                  placeholder: (context, url) => ShimmerWidget.rectangular(heigth: 100),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: 150, // Resim genişliği istediğiniz değer olabilir
                ),
              ),
            ),
          );
        },
      );
    });
  }
  }


