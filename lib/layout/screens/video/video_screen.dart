import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/layout/adapters/video_adapter.dart';
import 'package:goes_hunt/layout/screens/video/video_controller.dart';

import '../../components/state_widgets/empty_state.dart';
import '../../components/state_widgets/loading_list.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  final ref = Get.put(VideoController());

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ref.isLoading.value ? const LoadingList() :RefreshIndicator(
      onRefresh: () async {
        ref.searchVideos("");
      },
      child: CustomScrollView(
        slivers: [
          ref.videos.isEmpty
              ? const SliverToBoxAdapter(
            child: EmptyState(),
          )
              : SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return VideoAdapter(
                  video: ref.videos[index],
                  routing: ref.routing,
                );
              },
              childCount: ref.videos.length,
            ),
          ),
        ],
      ),
    ));
  }
}
