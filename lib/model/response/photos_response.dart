import 'package:goes_hunt/model/response/base/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photos_response.g.dart';

@JsonSerializable()
class PhotosResponse extends BaseResponse {

  @JsonKey(name: "photos")
  List<Photo>? photos;

  PhotosResponse({
      this.photos,});

  factory PhotosResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosResponseToJson(this);

}

@JsonSerializable()
class Photo {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "width")
  int? width;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "url")
  String? url;

  @JsonKey(name: "photographer")
  String? photographer;

  @JsonKey(name: "photographer_url")
  String? photographerUrl;

  @JsonKey(name: "photographer_id")
  int? photographerId;

  @JsonKey(name: "avg_color")
  String? avgColor;

  @JsonKey(name: "src")
  Src? src;

  @JsonKey(name: "liked")
  bool? liked;

  @JsonKey(name: "alt")
  String? alt;

  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,});

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

}


@JsonSerializable()
class Src {
  @JsonKey(name: "original")
  String? original;

  @JsonKey(name: "large2x")
  String? large2x;

  @JsonKey(name: "large")
  String? large;

  @JsonKey(name: "medium")
  String? medium;

  @JsonKey(name: "small")
  String? small;

  @JsonKey(name: "portrait")
  String? portrait;

  @JsonKey(name: "landscape")
  String? landscape;

  @JsonKey(name: "tiny")
  String? tiny;

  Src({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,});

  factory Src.fromJson(Map<String, dynamic> json) =>
      _$SrcFromJson(json);

  Map<String, dynamic> toJson() => _$SrcToJson(this);
}