import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/model/response/videos_response.dart';
import 'package:goes_hunt/widgets/custom_text.dart';
import '../../../widgets/custom_image_network.dart';
import '../../core/routing/app_routing.dart';
import '../../widgets/custom_gesture.dart';

class VideoAdapter extends StatelessWidget {
  final Video video;
  final AppRouting routing;

  const VideoAdapter({super.key, required this.video, required this.routing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      width: double.infinity,
      height: context.getHeight() * 0.3,
      child: CustomGesture(
        onTap: () {},
        radius: 12,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 2.6,
                  spreadRadius: 0,
                  offset: Offset(
                    1.95,
                    1.95,
                  ),
                ),
              ],
              color: context.getColorScheme().secondaryContainer),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomImageNetwork(
                  imageUrl: video.image ?? "",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: context.getColorScheme().onPrimary.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: CustomText(
                      maxLines: 2,
                      textToDisplay: video.user?.name ?? '-',
                      textStyle: context
                          .getTextTheme()
                          .labelLarge
                          ?.copyWith(color: context.getColorScheme().primary, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
