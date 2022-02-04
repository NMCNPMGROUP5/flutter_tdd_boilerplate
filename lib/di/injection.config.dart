// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/utils/theme/theme.dart' as _i3;
import '../features/setting/data/setting_local_data_source.dart' as _i4;
import '../features/setting/data/setting_repository_impl.dart' as _i6;
import '../features/setting/domain/setting_repository.dart' as _i5;
import '../features/setting/domain/usecases/get_locale_usecase.dart' as _i7;
import '../features/setting/domain/usecases/get_theme_usecase.dart' as _i8;
import '../features/setting/domain/usecases/set_locale_usecase.dart' as _i9;
import '../features/setting/domain/usecases/set_theme_usecase.dart' as _i10;
import '../features/setting/presentation/bloc/setting_bloc.dart' as _i11;
import '../features/setting/presentation/screen/setting_navigator.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.FontSize>(_i3.FontSize());
  gh.singleton<_i4.SettingLocalDataSource>(_i4.SettingLocalDataSourceImpl());
  gh.singleton<_i5.SettingRepositoty>(
      _i6.SettingRepositotyImpl(get<_i4.SettingLocalDataSource>()));
  gh.factory<_i7.GetLocaleUseCase>(
      () => _i7.GetLocaleUseCase(get<_i5.SettingRepositoty>()));
  gh.factory<_i8.GetThemeUseCase>(
      () => _i8.GetThemeUseCase(get<_i5.SettingRepositoty>()));
  gh.factory<_i9.SetLocaleUsecase>(
      () => _i9.SetLocaleUsecase(get<_i5.SettingRepositoty>()));
  gh.factory<_i10.SetThemeUsecase>(
      () => _i10.SetThemeUsecase(get<_i5.SettingRepositoty>()));
  gh.singleton<_i11.SettingBloc>(_i11.SettingBloc(
      get<_i7.GetLocaleUseCase>(),
      get<_i8.GetThemeUseCase>(),
      get<_i9.SetLocaleUsecase>(),
      get<_i10.SetThemeUsecase>()));
  gh.singleton<_i12.SettingNavigator>(
      _i12.SettingNavigatorImpl(get<_i11.SettingBloc>()));
  return get;
}
