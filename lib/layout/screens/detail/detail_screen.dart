import 'package:flutter/material.dart';
import 'package:goes_hunt/core/constraint/spacer.dart';
import 'package:goes_hunt/core/extention/extention.dart';
import 'package:goes_hunt/layout/screens/detail/components/photo_detail.dart';
import 'package:goes_hunt/layout/screens/detail/components/video_detail.dart';
import 'package:goes_hunt/model/response/photos_response.dart';
import 'package:goes_hunt/model/response/videos_response.dart';

import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';

class DetailScreen extends StatelessWidget {
  final dynamic data;
  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if(data is Video){
      final value = data as Video;
      return VideoDetail(video: value);
    }else if(data is Photo){
      final value = data as Photo;
      return PhotoDetail(photo: value,);
    }

    return const SizedBox.shrink();

  }
}
