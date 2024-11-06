import 'package:dartz/dartz.dart';
import 'package:project_template/data/exception/custome_exception.dart';
import 'package:project_template/domain/failure/custome_failure.dart';

class RepositoryHandler {
  Future<Either<Failure, T>> handleOperation<T>(
    Future<T?> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Right(result as T);
    } on RequestTimeoutException catch (_) {
      return const Left(RequestTimeoutFailure());
    } on DecodeFailedException catch (_) {
      return const Left(DecodeFailedFailure());
    } on NoInternetException catch (_){
      return const Left(NoInternetFailure());
    } on BadResponseException catch (e) {
      return Left(BadResponseFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}