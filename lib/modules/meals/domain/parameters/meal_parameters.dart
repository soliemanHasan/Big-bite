import 'package:big_bite/core/utils/base_parameters.dart';

class MealParameters extends BaseParameters {
  final int categoryId;
  final int page;
  const MealParameters({required this.categoryId, required this.page});

  @override
  List<Object?> get props => [categoryId, page];

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
