import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(textToDisplay: "Video"),
    );
  }
}
