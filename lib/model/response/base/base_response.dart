import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "per_page")
  int? perPage;

  @JsonKey(name: "total_results")
  int? totalResults;

  @JsonKey(name: "next_page")
  String? nextPage;

  BaseResponse({
    this.page,
    this.perPage,
    this.totalResults,
    this.nextPage,});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}