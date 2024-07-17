import '../../../../core/utils/base_parameters.dart';

class ShowNewsParameters extends BaseParameters {
  final int id;

  const ShowNewsParameters({required this.id});

  @override
  Map<String, dynamic> toJson() => {};
  @override
  List<Object> get props => [id];
}
