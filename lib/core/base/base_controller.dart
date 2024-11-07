import 'package:get/get.dart';

import '../helper/helper.dart';
import '../memory/shared/share_preference.dart';

class BaseController extends GetxController{

  final isLoading = true.obs;

  final sharedPre = SharedPreference();

  final helper = Helper();
}