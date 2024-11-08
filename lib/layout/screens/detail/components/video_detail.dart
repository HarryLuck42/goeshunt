import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import '../../../../core/constraint/spacer.dart';
import '../../../../model/response/videos_response.dart';
import '../../../../widgets/custom_image_network.dart';
import '../../../../widgets/custom_text.dart';

class VideoDetail extends StatelessWidget {
  final Video video;
  const VideoDetail({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
        return [SliverAppBar(
          expandedHeight: 200.0,
          backgroundColor: context.getColorScheme().onPrimary,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomText(
                textToDisplay: 'Photo Detail',
                textStyle: context.getTextTheme().titleSmall?.copyWith(
                    color: context.getColorScheme().primary,
                    fontWeight: FontWeight.w600),
              ),
              background: CustomImageNetwork(
                width: double.infinity,
                height: context.getWidth() * 0.6,
                imageUrl: video.image ?? (video.videoPictures?[0].picture ?? ''),
                fit: BoxFit.cover,
              )),
        ),];
      }, body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          eightPx,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomText(
              textToDisplay:
              video.user?.name ?? "-",
              textStyle: context
                  .getTextTheme()
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700, color: context.getColorScheme().primary),
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      )),
    );
  }
}
