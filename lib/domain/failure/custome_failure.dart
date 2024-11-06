import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class GeneralFailure extends Failure {
  const GeneralFailure({String message = 'Something went wrong'}) : super(message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({String message = 'No internet connection'}) : super(message);
}

class DecodeFailedFailure extends Failure {
  const DecodeFailedFailure({String message = 'Failed to decode response'}) : super(message);
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure({String message = 'Reuqest Timeout'}) : super(message);
}

class BadResponseFailure extends Failure {
  const BadResponseFailure({required String message}) : super(message);
}
