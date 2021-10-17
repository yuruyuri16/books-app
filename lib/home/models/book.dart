import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_project/home/models/models.dart';

part 'book.g.dart';

@JsonSerializable(createToJson: false)
class Book {
  const Book({required this.id, required this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  final VolumeInfo volumeInfo;
  final String id;
}
