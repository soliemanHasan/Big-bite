import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required super.id,
      required super.name,
      required super.photoUrl,
      required super.description});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      description: json['description'],
      name: json['files']["name"],
      photoUrl: json['files']['path'],
    );
  }

  //TODO: tell backend to edit files to file or oppsite
  factory NewsModel.fromJson1(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      description: json['description'],
      name: json['file']["name"],
      photoUrl: json['file']['path'],
    );
  }
}
