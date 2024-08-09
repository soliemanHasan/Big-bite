
import 'package:big_bite/core/enums/request_status.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/utils/base_state.dart';

class PaginationState<T> extends BaseState<T> {
  final int page;
  final int maxResultCount;
  final bool hasReachMax;
  const PaginationState(
      {required this.maxResultCount,
      this.hasReachMax = false,
      this.page = 1,
      super.data,
      super.failure,
      super.requestStatus});

  @override
  PaginationState<T> copyWith(
          {RequestStatus? requestStatus,
          Failure? failure,
          bool? hasReachMax,
          T? data,
          int? page}) =>
      PaginationState<T>(
        data: data ?? this.data,
        failure: failure ?? this.failure,
        requestStatus: requestStatus ?? this.requestStatus,
        page: page ?? this.page,
        maxResultCount: maxResultCount,
        hasReachMax: hasReachMax ?? this.hasReachMax,
      );

  @override
  PaginationState<T> loading() {
    return copyWith(requestStatus: RequestStatus.loading);
  }

  @override
  PaginationState<T> success(T newData, [int? page, bool? hasReachMax]) {
    return copyWith(
        requestStatus: RequestStatus.success,
        data: newData,
        page: page,
        hasReachMax: hasReachMax);
  }

  @override
  PaginationState<T> error(Failure newFailure) {
    return copyWith(requestStatus: RequestStatus.error, failure: newFailure);
  }

  @override
  PaginationState<T> defaultError() {
    return copyWith(
      requestStatus: RequestStatus.error,
      failure: UnknownFailure(),
    );
  }

  @override
  PaginationState<T> reset() =>
      PaginationState<T>(maxResultCount: maxResultCount);

  PaginationState<T> refresh() {
    return PaginationState<T>(
      data: null,
      maxResultCount: maxResultCount,
      page: 1,
      hasReachMax: false,
      failure: failure,
      requestStatus: requestStatus,
    );
  }
}
