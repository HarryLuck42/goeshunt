import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/core/locale/localizations.dart';
import 'package:goes_hunt/core/routing/app_routing.dart';
import 'package:goes_hunt/layout/screens/photo/photo_screen.dart';
import 'package:goes_hunt/layout/screens/video/video_screen.dart';
import 'package:goes_hunt/widgets/custom_image_network.dart';
import 'package:goes_hunt/widgets/custom_text.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/routing/routes.dart';
import '../../../widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                backgroundColor: context.getColorScheme().onPrimary,
                floating: false,
                pinned: true,
                actions: [
                  CustomIconButton(
                      iconData: "${AssetPath.vector}settings.svg",
                      height: 30,
                      width: 30,
                      defaultColor: false,
                      color: context.getColorScheme().primary,
                      onPressed: () async {
                        AppRouting().move(Routes.settings);
                      })
                ],
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: CustomText(
                      textToDisplay: lang(context).appTitle ?? 'Home',
                      textStyle: context.getTextTheme().titleSmall?.copyWith(
                          color: context.getColorScheme().primary, fontWeight: FontWeight.w600),
                    ),
                    background: CustomImageNetwork(
                      width: double.infinity,
                      height: context.getWidth() * 0.6,
                      imageUrl:
                          context.isLightMode() ? "https://i.pinimg.com/474x/e5/ff/55/e5ff55e088aa20a0ae7feebeadac3cbd.jpg" : "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    onTap: (index) => {},
                    controller: tabController,
                    labelColor: context.getColorScheme().primary,
                    labelStyle: context.getTextTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w500),
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
              children: const [PhotoScreen(), VideoScreen()]),
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
