import 'package:flutter/cupertino.dart';
import 'package:goes_hunt/widgets/custom_text.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(textToDisplay: "Photo"),
    );
  }
}
