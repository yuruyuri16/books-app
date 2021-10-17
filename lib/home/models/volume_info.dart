import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_project/home/models/models.dart';

part 'volume_info.g.dart';

@JsonSerializable(createToJson: false)
class VolumeInfo {
  const VolumeInfo(
      {required this.title,
      required this.authors,
      required this.averageRating,
      required this.categories,
      required this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  final String title;
  final List<String> authors;
  final double? averageRating;
  final List<String>? categories;
  final ImageLinks imageLinks;
}
