import 'package:flutter/cupertino.dart';
import 'package:goes_hunt/core/extention/extention.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';
import '../../../core/locale/localizations.dart';
import '../../../widgets/custom_icon.dart';
import '../../../widgets/custom_text.dart';

class OfflineState extends StatelessWidget {
  const OfflineState({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      height: context.getHeight(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.getHeight() * 0.2,
            ),
            const CustomIcon(
              iconData: "${AssetPath.vector}no_connection.svg",
              width: 200,
              height: 200,
              defaultColor: false,
              fit: BoxFit.fitHeight,
            ),
            eightPx,
            CustomText(
                textToDisplay: lang(context).noInternet ?? "No internet connection",
                textStyle: context.getTextTheme().titleMedium?.copyWith(
                    color: context.getColorScheme().secondary,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}