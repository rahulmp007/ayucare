abstract class Failure {
  final String message;

  Failure({required this.message});

  @override
  String toString() => message;
}


class ServerFailure extends Failure{
  ServerFailure({required super.message}); 
}

class NetworkError extends Failure {
  NetworkError({required super.message});
  
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({required super.message});
  
}