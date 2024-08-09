import 'package:big_bite/core/utils/base_parameters.dart';

class OrderParameters extends BaseParameters {
  final String type;
  final List<Map<String, dynamic>> order;
  const OrderParameters({required this.order, required this.type});

  @override
  List<Object?> get props => [type, order];

  @override
  Map<String, dynamic> toJson() {
    return {
      "meals": order,
      "type": type,
    };
  }
}
