import 'package:get/get.dart';
import 'package:goes_hunt/core/base/base_controller.dart';
import 'package:goes_hunt/model/response/photos_response.dart';

import '../../../core/service/api_handling.dart';

class PhotoController extends BaseController{
  final photos = <Photo>[].obs;

  final total = 0.obs;

  final keyword = "".obs;

  @override
  Future onInit() async {
    super.onInit();
    getPhotos();
  }

  searchPhotos(String value){
    keyword(value);
    total(0);
    getPhotos();
  }

  Future getPhotos({bool isReload = true}) async{
    if(await helper.checkConnections()){
      connect(true);
      if (photos.length < total.value || total.value == 0) {
        if (isReload) {
          isLoading(true);
        }

        try {
          await ApiHandling.hitApi<PhotosResponse>(
              keyword.isNotEmpty
                  ? apiRep.apiService.searchPhotos(keyword.value,
                  isReload ? 1 : (photos.length / 18).ceil() + 1, 18)
                  : apiRep.apiService.getPhotos(
                  isReload ? 1 : (photos.length / 18).ceil() + 1, 18),
                  (response) {
                if (isReload) {
                  if (response.totalResults != null) {
                    total(response.totalResults);
                  }
                  photos.clear();
                  photos.addAll(response.photos ?? []);
                } else {
                  photos.addAll(response.photos ?? []);
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