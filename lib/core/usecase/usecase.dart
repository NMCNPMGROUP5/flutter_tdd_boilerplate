import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UseCase<Type, IParams extends Params> {
  Future<Result> call(IParams params);
}

abstract class Params {}

class ContextParams extends Params {
  final BuildContext context;

  ContextParams(this.context);
}

class NoParams extends Params {}
