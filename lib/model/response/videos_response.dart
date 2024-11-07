import 'package:goes_hunt/model/response/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'videos_response.g.dart';

@JsonSerializable()
class VideosResponse extends BaseResponse {
  @JsonKey(name: "videos")
  List<Video>? videos;

  @JsonKey(name: "url")
  String? url;

  VideosResponse({
      this.videos,
      this.url,});

  factory VideosResponse.fromJson(Map<String, dynamic> json) =>
      _$VideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideosResponseToJson(this);
}

@JsonSerializable()
class Video {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "width")
  int? width;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "duration")
  int? duration;

  @JsonKey(name: "fullRes")
  dynamic fullRes;

  @JsonKey(name: "tags")
  List<String>? tags;

  @JsonKey(name: "url")
  String? url;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "avg_color")
  String? avgColor;

  @JsonKey(name: "user")
  User? user;

  @JsonKey(name: "video_files")
  List<VideoFile>? videoFiles;

  @JsonKey(name: "video_pictures")
  List<VideoPicture>? videoPictures;

  Video({
    this.id,
    this.width,
    this.height,
    this.duration,
    this.fullRes,
    this.tags,
    this.url,
    this.image,
    this.avgColor,
    this.user,
    this.videoFiles,
    this.videoPictures,});


  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "url")
  String? url;

  User({
    this.id,
    this.name,
    this.url,});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class VideoFile {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "quality")
  String? quality;

  @JsonKey(name: "file_type")
  String? fileType;

  @JsonKey(name: "width")
  int? width;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "fps")
  double? fps;

  @JsonKey(name: "link")
  String? link;

  @JsonKey(name: "size")
  int? size;

  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.fps,
    this.link,
    this.size,});

  factory VideoFile.fromJson(Map<String, dynamic> json) =>
      _$VideoFileFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFileToJson(this);
}

@JsonSerializable()
class VideoPicture {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "nr")
  int? nr;

  @JsonKey(name: "picture")
  String? picture;

  VideoPicture({
    this.id,
    this.nr,
    this.picture,});

  factory VideoPicture.fromJson(Map<String, dynamic> json) =>
      _$VideoPictureFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPictureToJson(this);
}

