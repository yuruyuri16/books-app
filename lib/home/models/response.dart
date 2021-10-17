import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_project/home/models/models.dart';

part 'response.g.dart';

@JsonSerializable(createToJson: false)
class Response {
  const Response({required this.items});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  final List<Book> items;
}
