import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../product/widgets/shimmer/shimmer_widget.dart';
import '../../../main/viewModel/main_page_view_model.dart';

class StreamerAnnouncementDialog extends StatelessWidget {
  const StreamerAnnouncementDialog({Key? key, required this.viewModel}) : super(key: key);

  final MainPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(viewModel.firebaseRemoteConfigStore.streamerAnnouncement['title'].toString()),
      content: Text(viewModel.firebaseRemoteConfigStore.streamerAnnouncement['message'].toString()),
      iconPadding: context.paddingMedium,
      icon: viewModel.firebaseRemoteConfigStore.streamerAnnouncement['imageurl'].toString().isNotEmpty ?
      CachedNetworkImage(
        imageUrl: viewModel.firebaseRemoteConfigStore.streamerAnnouncement['imageurl'].toString(),
        fit: BoxFit.contain,
        height: context.height * 0.25,
        cacheManager: null,
        placeholder: (context, url) => ShimmerWidget.rectangular(heigth: 40),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ): null,
      //Image.network(firebaseRemoteConfigStore.streamerAnnouncement['imageurl'].toString()): null,
      actions: <Widget>[
        TextButton(
          child: const Text("1",style: TextStyle(color: Colors.blueGrey),),
          onPressed: () {
            Navigator.of(context).pop(); // Dialog'u kapat
          },
        ),
        TextButton(
          child: const Text("2",style: TextStyle(color: Colors.pink),),
          onPressed: () {
            Navigator.of(context).pop();
            var link = viewModel.firebaseRemoteConfigStore.streamerAnnouncement['link'].toString();
            viewModel.launchURL(link);
          },
        )
      ],
    );
  }
}
