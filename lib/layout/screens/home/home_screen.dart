import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/core/locale/localizations.dart';
import 'package:goes_hunt/core/routing/app_routing.dart';
import 'package:goes_hunt/layout/screens/photo/photo_controller.dart';
import 'package:goes_hunt/layout/screens/photo/photo_screen.dart';
import 'package:goes_hunt/layout/screens/video/video_controller.dart';
import 'package:goes_hunt/layout/screens/video/video_screen.dart';
import 'package:goes_hunt/widgets/custom_image_network.dart';
import 'package:goes_hunt/widgets/custom_text.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/routing/routes.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/pagination_scroll_controller.dart';
import '../../components/dialog/search_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  PaginationScrollController paginationScrollController =
  PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: (){
          'Log terus trus trs ${tabController.index}'.logger();
          if(tabController.index == 0){
            Get.find<PhotoController>().getPhotos(isReload: false);
          }else if(tabController.index == 1){
            Get.find<VideoController>().getVideos(isReload: false);
          }
        });
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: paginationScrollController.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: context.getColorScheme().onPrimary,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: CustomText(
                    textToDisplay: lang(context).appTitle ?? 'Home',
                    textStyle: context.getTextTheme().titleSmall?.copyWith(
                        color: context.getColorScheme().primary,
                        fontWeight: FontWeight.w600),
                  ),
                  background: CustomImageNetwork(
                    width: double.infinity,
                    height: context.getWidth() * 0.6,
                    imageUrl: context.isLightMode()
                        ? "https://i.pinimg.com/474x/e5/ff/55/e5ff55e088aa20a0ae7feebeadac3cbd.jpg"
                        : "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
              actions: [
                CustomIconButton(
                    iconData: "${AssetPath.vector}settings.svg",
                    height: 30,
                    width: 30,
                    defaultColor: false,
                    color: context.getColorScheme().primary,
                    onPressed: () async {
                      AppRouting().move(Routes.settings);
                    }),
                CustomIconButton(
                  iconData: "${AssetPath.vector}search.svg",
                  height: 30,
                  width: 30,
                  defaultColor: false,
                  color: context.getColorScheme().primary,
                  onPressed: () async {
                    String? keyword = await showDialog(
                        context: context,
                        builder: (context) {
                          return const SearchDialog();
                        });
                    if (keyword != null) {
                      if (keyword.isNotEmpty) {
                        if(tabController.index == 0){
                          Get.find<PhotoController>().searchPhotos(keyword);
                        }else if(tabController.index == 1){
                          Get.find<VideoController>().searchVideos(keyword);
                        }
                      }
                    }
                  },
                )
              ],
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: tabController,
                  labelColor: context.getColorScheme().primary,
                  labelStyle: context
                      .getTextTheme()
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: context.getTextTheme().bodySmall,
                  indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                          width: 5.0,
                          color: context.getColorScheme().primary),
                      insets: const EdgeInsets.symmetric(horizontal: 16.0)),
                  tabs: const [
                    Tab(icon: Icon(Icons.image), text: "Photos"),
                    Tab(
                        icon: Icon(Icons.ondemand_video_outlined),
                        text: "Videos"),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: const [
            PhotoScreen(), VideoScreen()
          ],
        ),
      ),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: context.getColorScheme().onSecondary,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

abstract class OnReloadListener{
  onReLoad();
}
