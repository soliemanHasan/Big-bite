import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String photoUrl;

  const NewsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [id, name, description, photoUrl];
}
