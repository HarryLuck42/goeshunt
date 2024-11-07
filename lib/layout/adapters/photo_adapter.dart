import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/model/response/photos_response.dart';
import '../../../widgets/custom_image_network.dart';
import '../../core/routing/app_routing.dart';
import '../../widgets/custom_gesture.dart';

class PhotoAdapter extends StatelessWidget {
  final Photo photo;
  final AppRouting routing;

  const PhotoAdapter(
      {super.key,
        required this.photo,
        required this.routing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: CustomGesture(
        onTap: () {

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
            child: CustomImageNetwork(
              imageUrl: photo.src?.portrait ?? "",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
