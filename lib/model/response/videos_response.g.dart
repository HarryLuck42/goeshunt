// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosResponse _$VideosResponseFromJson(Map<String, dynamic> json) =>
    VideosResponse(
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
    )
      ..page = (json['page'] as num?)?.toInt()
      ..perPage = (json['per_page'] as num?)?.toInt()
      ..totalResults = (json['total_results'] as num?)?.toInt()
      ..nextPage = json['next_page'] as String?;

Map<String, dynamic> _$VideosResponseToJson(VideosResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'next_page': instance.nextPage,
      'videos': instance.videos,
      'url': instance.url,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      id: (json['id'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      fullRes: json['fullRes'],
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      image: json['image'] as String?,
      avgColor: json['avg_color'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      videoFiles: (json['video_files'] as List<dynamic>?)
          ?.map((e) => VideoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoPictures: (json['video_pictures'] as List<dynamic>?)
          ?.map((e) => VideoPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
      'fullRes': instance.fullRes,
      'tags': instance.tags,
      'url': instance.url,
      'image': instance.image,
      'avg_color': instance.avgColor,
      'user': instance.user,
      'video_files': instance.videoFiles,
      'video_pictures': instance.videoPictures,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };

VideoFile _$VideoFileFromJson(Map<String, dynamic> json) => VideoFile(
      id: (json['id'] as num?)?.toInt(),
      quality: json['quality'] as String?,
      fileType: json['file_type'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      fps: (json['fps'] as num?)?.toDouble(),
      link: json['link'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VideoFileToJson(VideoFile instance) => <String, dynamic>{
      'id': instance.id,
      'quality': instance.quality,
      'file_type': instance.fileType,
      'width': instance.width,
      'height': instance.height,
      'fps': instance.fps,
      'link': instance.link,
      'size': instance.size,
    };

VideoPicture _$VideoPictureFromJson(Map<String, dynamic> json) => VideoPicture(
      id: (json['id'] as num?)?.toInt(),
      nr: (json['nr'] as num?)?.toInt(),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$VideoPictureToJson(VideoPicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nr': instance.nr,
      'picture': instance.picture,
    };
