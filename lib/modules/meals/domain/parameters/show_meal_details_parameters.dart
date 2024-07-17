import 'package:big_bite/core/utils/base_parameters.dart';

class ShowMealDetailsParameters extends BaseParameters {
  final int id;
  const ShowMealDetailsParameters(this.id);

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
