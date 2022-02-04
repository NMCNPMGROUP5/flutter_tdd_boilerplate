import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import '../setting_repository.dart';

@injectable
class GetLocaleUseCase implements UseCase<Locale, ContextParams> {
  final SettingRepositoty repository;

  GetLocaleUseCase(this.repository);

  @override
  Future<Result<Failure, Locale>> call(ContextParams params) async {
    return repository.getLocale(params.context);
  }
}
