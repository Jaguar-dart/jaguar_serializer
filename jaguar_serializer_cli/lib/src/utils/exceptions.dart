class JCException implements Exception {
  final String message;

  JCException([this.message]);

  String toString() {
    if (message == null) return "JaguarCliException";
    return "JaguarCliException: $message";
  }
}
