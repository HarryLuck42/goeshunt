import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            return Container(
              height: context.getHeight() * 0.4,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text('Test'),
            );
          }),
        ),
      ),
    );;
  }
}
