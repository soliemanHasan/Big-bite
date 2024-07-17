import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String id;
  final String name;

  const ItemEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
