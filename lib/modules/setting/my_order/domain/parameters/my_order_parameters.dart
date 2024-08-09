import 'package:big_bite/core/utils/base_parameters.dart';

class MyOrderParameters extends BaseParameters {
  final int page;

 const MyOrderParameters({required this.page});
 
  @override

  List<Object?> get props => [page];
 
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
