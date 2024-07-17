import 'package:equatable/equatable.dart';

class CategoryMenuEntity extends Equatable {
  final int id;
  final String name;
  final String? file;
  const CategoryMenuEntity({required this.id, required this.name, this.file});

  @override
  List<Object?> get props => [id, name, file];
}
