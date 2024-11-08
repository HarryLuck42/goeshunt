import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/model/response/photos_response.dart';

import '../../../../core/constraint/spacer.dart';
import '../../../../core/locale/localizations.dart';
import '../../../../widgets/custom_image_network.dart';
import '../../../../widgets/custom_text.dart';

class PhotoDetail extends StatelessWidget {
  final Photo photo;

  const PhotoDetail({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
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
                      textToDisplay: lang(context).photoDetail ?? 'Photo Detail',
                      textStyle: context.getTextTheme().titleSmall?.copyWith(
                          color: context.getColorScheme().primary,
                          fontWeight: FontWeight.w600),
                    ),
                    background: CustomImageNetwork(
                      width: double.infinity,
                      height: context.getWidth() * 0.6,
                      imageUrl: photo.src?.original ?? (photo.src?.large ?? ''),
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eightPx,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomText(
                    textToDisplay: photo.photographer ?? "-",
                    textStyle: context.getTextTheme().bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.getColorScheme().primary),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
                sixPx,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomText(
                    textToDisplay: photo.alt ?? "-",
                    textStyle: context.getTextTheme().bodySmall,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
                tenPx,
                StaggeredGrid.count(
                  crossAxisCount: 12,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 8,
                        child: CustomImageNetwork(
                            imageUrl: photo.src?.large2x ?? '',
                            width: double.infinity,
                            height: double.infinity, fit: BoxFit.cover,), ),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 8,
                        child: CustomImageNetwork(
                            imageUrl: photo.src?.large ?? '',
                            width: double.infinity,
                            height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 6,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.medium ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.small ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.small ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 6,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.medium ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.tiny ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.tiny ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 12,
                      mainAxisCellCount: 6,
                      child: CustomImageNetwork(
                          imageUrl: photo.src?.landscape ?? '',
                          width: double.infinity,
                          height: double.infinity, fit: BoxFit.cover),),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
