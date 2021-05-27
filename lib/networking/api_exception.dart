abstract class ApiException implements Exception {}

class EmptyResultException extends ApiException {}

class ConnectionException extends ApiException {}

class ServerErrorException extends ApiException {}

class UnauthenticatedException extends ApiException {}

class ClientErrorException extends ApiException {}

class UnknownException extends ApiException {}