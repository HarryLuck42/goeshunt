import 'package:get/get.dart';

import '../helper/helper.dart';
import '../memory/shared/share_preference.dart';
import '../routing/app_routing.dart';
import '../service/api_repository.dart';

class BaseController extends GetxController{

  final isLoading = true.obs;

  final connect = true.obs;

  final sharedPre = SharedPreference();

  final helper = Helper();

  final routing = AppRouting();

  final apiRep = ApiRepository();
}