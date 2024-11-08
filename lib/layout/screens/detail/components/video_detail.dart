import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/widgets/custom_loading.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constraint/spacer.dart';
import '../../../../model/response/videos_response.dart';
import '../../../../widgets/custom_image_network.dart';
import '../../../../widgets/custom_text.dart';

class VideoDetail extends StatefulWidget {
  final Video video;

  const VideoDetail({super.key, required this.video});

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  late VideoPlayerController _videoPlayerController;
  late Future<void>_initializeVideoPlayer;

  @override
  void initState() {
    final link = widget.video.videoFiles?[0].link;
    if (link != null) {
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(link),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
      _initializeVideoPlayer = _videoPlayerController.initialize().then((_) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        setState(() {});
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          return Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 200.0,
                      backgroundColor: context
                          .getColorScheme()
                          .onPrimary,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: CustomText(
                            textToDisplay: 'Photo Detail',
                            textStyle: context
                                .getTextTheme()
                                .titleSmall
                                ?.copyWith(
                                color: context
                                    .getColorScheme()
                                    .primary,
                                fontWeight: FontWeight.w600),
                          ),
                          background: CustomImageNetwork(
                            width: double.infinity,
                            height: context.getWidth() * 0.6,
                            imageUrl: widget.video.image ??
                                (widget.video.videoPictures?[0].picture ?? ''),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ];
                },
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    eightPx,
                    snapshot.connectionState == ConnectionState.done
                        ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),)
                        : Container(width: double.infinity,
                      height: context.getWidth() * 0.6,
                      alignment: Alignment.center,
                      child: const CustomLoading(),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomText(
                        textToDisplay: widget.video.user?.name ?? "-",
                        textStyle: context
                            .getTextTheme()
                            .bodyLarge
                            ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context
                                .getColorScheme()
                                .primary),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                )),
          );
        }
    );
  }
}
