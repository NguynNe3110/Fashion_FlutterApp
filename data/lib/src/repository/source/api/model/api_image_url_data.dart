import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_image_url_data.freezed.dart';
part 'api_image_url_data.g.dart';

@freezed
sealed class ApiImageUrlData with _$ApiImageUrlData {
  const ApiImageUrlData._();
  const factory ApiImageUrlData({
    @JsonKey(name: 'origin') String? origin,
    @JsonKey(name: 'sm') String? sm,
    @JsonKey(name: 'md') String? md,
    @JsonKey(name: 'lg') String? lg,
  }) = _ApiImageUrlData;

  factory ApiImageUrlData.fromJson(Map<String, dynamic> json) =>
      _$ApiImageUrlDataFromJson(json);
}
