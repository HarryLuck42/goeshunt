import 'package:flutter/material.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import '../../../core/constraint/spacer.dart';
import '../../../core/locale/localizations.dart';
import '../../../widgets/custom_loading.dart';
import '../../../widgets/custom_text.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomLoading(
            size: 20,
          ),
          eightPx,
          CustomText(
              textToDisplay: lang(context).loading ?? "Loading",
              textStyle: context.getTextTheme().bodyMedium)
        ],
      ),
    );
  }
}
