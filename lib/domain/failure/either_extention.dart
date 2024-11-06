import 'package:dartz/dartz.dart';
import 'package:project_template/domain/failure/custome_failure.dart';

extension EitherExtension<L, R> on Either<L, R> {
  B handleError<B>({
    required B Function(L l) onFailure,
    required B Function(R r) onSuccess,
    required B Function(DecodeFailedFailure failure) onDecodeFailed,
    required B Function(NoInternetFailure failure) onNoInternet,
    required B Function(RequestTimeoutFailure failure) onRequestTimeout,
    required B Function(BadResponseFailure failure) onBadResponseFailure,
  }) {
    return fold(
      (error) {
        if (error is NoInternetFailure) {
          return onNoInternet(error);
        } if(error is DecodeFailedFailure) {
          return onDecodeFailed(error);
        } else if (error is RequestTimeoutFailure) {
          return onRequestTimeout(error);
        } else if (error is BadResponseFailure) {
          return onBadResponseFailure(error);
        } else {
          return onFailure(error);
        }
      },
      (result) {
        return onSuccess(result);
      }
    );
  }
}