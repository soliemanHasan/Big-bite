import 'package:big_bite/core/utils/base_parameters.dart';

class FavoriteParameters extends BaseParameters {
  final int id;
  const FavoriteParameters(this.id);
  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() {
    return {
      "order_id": id,
    };
  }
}
