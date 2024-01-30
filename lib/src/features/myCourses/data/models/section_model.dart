import '../../domain/entities/section_entity.dart';

class SectionModel extends SectionEntity {
  SectionModel({
    required super.description,
    required super.title,
    required super.url,
    required super.isWatched,
    required super.number,
    required super.id,
  });
  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      description: json['description'],
      title: json['title'],
      url: json['url'],
      isWatched: json['isWatched'],
      number: json['number'],
      id: json['id'],
    );
  }
}
