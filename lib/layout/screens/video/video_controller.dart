import 'package:get/get.dart';
import 'package:goes_hunt/core/base/base_controller.dart';
import 'package:goes_hunt/model/response/videos_response.dart';

import '../../../core/service/api_handling.dart';

class VideoController extends BaseController{
  final videos = <Video>[].obs;

  final total = 0.obs;

  final keyword = "".obs;

  @override
  Future onInit() async {
    super.onInit();
    getVideos();
  }

  searchVideos(String value){
    keyword(value);
    total(0);
    getVideos();
  }

  Future getVideos({bool isReload = true}) async{
    if(await helper.checkConnections()){
      connect(true);
      if (videos.length < total.value || total.value == 0) {
        if (isReload) {
          isLoading(true);
        }

        try {
          await ApiHandling.hitApi<VideosResponse>(
              keyword.isNotEmpty
                  ? apiRep.apiService.searchVideos(keyword.value,
                  isReload ? 1 : (videos.length / 10).ceil() + 1, 10)
                  : apiRep.apiService.getVideos(
                  isReload ? 1 : (videos.length / 10).ceil() + 1, 10),
                  (response) {
                if (isReload) {
                  if (response.totalResults != null) {
                    total(response.totalResults);
                  }
                  videos.clear();
                  videos.addAll(response.videos ?? []);
                } else {
                  videos.addAll(response.videos ?? []);
                }
                isLoading(false);
              }, (failed) {
            routing.showSnackBar(
                snackBar: GetSnackBar(
                  message: failed.messageError,
                ));
            isLoading(false);
          });
        } catch (e) {
          routing.showSnackBar(
              snackBar: GetSnackBar(
                message: e.toString(),
              ));
          isLoading(false);
        }
      }
    }else{
      connect(false);
    }

  }
}