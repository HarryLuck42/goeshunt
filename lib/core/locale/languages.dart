class Languages{
  String? appTitle;
  String? loading;
  String? noInternet;
  String? settings;
  String? dark;
  String? light;
  String? language;
  String? noDataFound;
  String? search;
  String? photos;
  String? videos;
  String? photoDetail;
  String? videoDetail;

  Languages.fromJson(Map<String, String> json){
    appTitle = json['app_title'];
    loading = json['loading'];
    noInternet = json['no_internet'];
    settings = json['settings'];
    dark = json['dark'];
    light = json['light'];
    language = json['language'];
    noDataFound = json['no_data_found'];
    search = json['search'];
    photos = json['photos'];
    videos = json['videos'];
    photoDetail = json['photo_detail'];
    videoDetail = json['video_detail'];
  }
}