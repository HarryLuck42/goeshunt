import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/core/routing/routes.dart';
import 'package:goes_hunt/model/response/photos_response.dart';
import 'package:goes_hunt/widgets/custom_text.dart';
import '../../../widgets/custom_image_network.dart';
import '../../core/routing/app_routing.dart';
import '../../widgets/custom_gesture.dart';

class PhotoAdapter extends StatelessWidget {
  final Photo photo;
  final AppRouting routing;

  const PhotoAdapter({super.key, required this.photo, required this.routing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: CustomGesture(
        onTap: () {
          routing.move(Routes.detail, argument: photo);
        },
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
                  imageUrl: photo.src?.portrait ?? "",
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
                      textToDisplay: photo.photographer ?? '-',
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
