import 'package:flutter/material.dart';
import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/usecase/usecase.dart';
import 'package:flutter_tdd_boilerplate/features/setting/data/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class SetLocaleUsecase implements UseCase<Locale, SetLanguageParams> {
  final SettingRepositoty repository;

  SetLocaleUsecase(this.repository);
  @override
  Future<Result<Failure, Locale>> call(params) async {
    return repository.setLocale(params.locale);
  }
}

class SetLanguageParams extends Params {
  final Locale locale;

  SetLanguageParams(this.locale);
}
