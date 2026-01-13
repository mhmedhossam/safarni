class Failure {
  final String message;
  final int? statusCode;

  Failure({required this.message, this.statusCode});

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';
}

class ServerFailure extends Failure {
  ServerFailure(String message, {super.statusCode}) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(message: 'No internet connection');
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super(message: 'Request timeout, please try again');
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({super.message = 'Unauthorized'})
    : super(statusCode: 401);
}

class ValidationFailure extends Failure {
  final Map<String, dynamic>? errors;
  ValidationFailure(String message, {this.errors}) : super(message: message);
}

class UnknownFailure extends Failure {
  UnknownFailure() : super(message: 'Something went wrong, please try again');
}
