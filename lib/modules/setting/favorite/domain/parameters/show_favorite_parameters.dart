import 'package:big_bite/core/utils/base_parameters.dart';

class ShowFavoriteParameters extends BaseParameters {
  final int page;
  const ShowFavoriteParameters(this.page);

  @override
  List<Object?> get props => [page];

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
