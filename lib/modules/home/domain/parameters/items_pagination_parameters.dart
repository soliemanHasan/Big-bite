
import '../../../../core/utils/base_pagination_bloc/pagination_parameters.dart';

class ItemsPaginationParameters extends PaginationParameters {
  const ItemsPaginationParameters(
      {required super.skipCount, required super.maxResultCount});

  @override
  Map<String, dynamic> toJson() => {
    'SkipCount': skipCount,
    'MaxResultCount': maxResultCount
  };

  @override
  List<Object> get props => [skipCount, maxResultCount];

}
