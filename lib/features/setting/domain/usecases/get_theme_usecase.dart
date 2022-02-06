import 'package:flutter_tdd_boilerplate/core/error/failure.dart';
import 'package:flutter_tdd_boilerplate/core/usecase/usecase.dart';
import 'package:flutter_tdd_boilerplate/core/utils/theme/theme.dart';
import 'package:flutter_tdd_boilerplate/features/setting/data/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class GetThemeUseCase implements UseCase<AppTheme, ContextParams> {
  final SettingRepositoty repository;

  GetThemeUseCase(this.repository);

  @override
  Future<Result<Failure, AppTheme>> call(ContextParams params) async {
    return repository.getAppTheme(params.context);
  }
}
