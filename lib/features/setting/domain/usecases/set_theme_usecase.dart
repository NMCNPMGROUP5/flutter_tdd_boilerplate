import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/usecase/usecase.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/features/setting/domain/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class SetThemeUsecase implements UseCase<AppTheme, SetThemeParams> {
  final SettingRepositoty repository;

  SetThemeUsecase(this.repository);
  @override
  Future<Result<Failure, AppTheme>> call(params) async {
    return repository.setTheme(params.appTheme);
  }
}

class SetThemeParams extends Params {
  final AppTheme appTheme;

  SetThemeParams(this.appTheme);
}
