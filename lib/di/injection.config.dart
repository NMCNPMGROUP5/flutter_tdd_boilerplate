// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/utils/theme/theme.dart' as _i3;
import '../features/setting/data/setting_local_data_source.dart' as _i4;
import '../features/setting/data/setting_repository.dart' as _i5;
import '../features/setting/domain/usecases/get_locale_usecase.dart' as _i6;
import '../features/setting/domain/usecases/get_theme_usecase.dart' as _i7;
import '../features/setting/domain/usecases/set_locale_usecase.dart' as _i8;
import '../features/setting/domain/usecases/set_theme_usecase.dart' as _i9;
import '../features/setting/presentation/bloc/setting_bloc.dart' as _i10;
import '../features/setting/presentation/screen/setting_navigator.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.FontSize>(_i3.FontSize());
  gh.singleton<_i4.SettingLocalDataSource>(_i4.SettingLocalDataSourceImpl());
  gh.singleton<_i5.SettingRepositoty>(
      _i5.SettingRepositotyImpl(get<_i4.SettingLocalDataSource>()));
  gh.factory<_i6.GetLocaleUseCase>(
      () => _i6.GetLocaleUseCase(get<_i5.SettingRepositoty>()));
  gh.factory<_i7.GetThemeUseCase>(
      () => _i7.GetThemeUseCase(get<_i5.SettingRepositoty>()));
  gh.factory<_i8.SetLocaleUsecase>(
      () => _i8.SetLocaleUsecase(get<_i5.SettingRepositoty>()));
  gh.factory<_i9.SetThemeUsecase>(
      () => _i9.SetThemeUsecase(get<_i5.SettingRepositoty>()));
  gh.singleton<_i10.SettingBloc>(_i10.SettingBloc(
      get<_i6.GetLocaleUseCase>(),
      get<_i7.GetThemeUseCase>(),
      get<_i8.SetLocaleUsecase>(),
      get<_i9.SetThemeUsecase>()));
  gh.singleton<_i11.SettingNavigator>(
      _i11.SettingNavigatorImpl(get<_i10.SettingBloc>()));
  return get;
}
