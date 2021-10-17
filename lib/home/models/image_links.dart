import 'package:json_annotation/json_annotation.dart';

part 'image_links.g.dart';

@JsonSerializable(createToJson: false)
class ImageLinks {
  const ImageLinks({required this.smallThumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  final String smallThumbnail;
}
