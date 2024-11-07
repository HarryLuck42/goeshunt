import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/layout/adapters/photo_adapter.dart';
import 'package:goes_hunt/layout/components/state_widgets/loading_list.dart';
import 'package:goes_hunt/layout/components/state_widgets/offline_state.dart';
import 'package:goes_hunt/layout/screens/photo/photo_controller.dart';

import '../../../widgets/pagination_scroll_controller.dart';
import '../../components/state_widgets/empty_state.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final ref = Get.put(PhotoController());

  PaginationScrollController paginationScrollController =
  PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: () => ref.getPhotos(isReload: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ref.isLoading.value ? const LoadingList() : RefreshIndicator(
      onRefresh: () async {
        ref.getPhotos();
      },
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: paginationScrollController.scrollController,
        slivers: [
          !ref.connect.value ? const SliverToBoxAdapter(child: OfflineState()) : ref.photos.isEmpty
              ? const SliverToBoxAdapter(
            child: EmptyState(),
          )
              : SliverGrid(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (context.getWidth() / 4) /
                    ((context.getHeight() - 150) / 4)),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return PhotoAdapter(
                  photo: ref.photos[index],
                  routing: ref.routing,
                );
              },
              childCount: ref.photos.length,
            ),
          ),
        ],
      ),
    ));
  }
}
