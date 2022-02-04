import 'package:flutter/material.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message) {
    debugPrint(message);
  }
}

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNEXPECTED_ERROR = 'Unexpected error';
