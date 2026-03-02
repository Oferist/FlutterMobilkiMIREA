// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pr9_flutter/data/database/antivirus_database.dart' as _i805;
import 'package:pr9_flutter/data/repositories/antivirus_repository.dart'
    as _i530;
import 'package:pr9_flutter/features/home/bloc/home_bloc.dart' as _i397;
import 'package:pr9_flutter/theme/theme_cubit.dart' as _i602;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i602.ThemeCubit>(() => _i602.ThemeCubit());
    gh.lazySingleton<_i805.AppDatabase>(() => _i805.AppDatabase());
    gh.lazySingleton<_i530.AntivirusRepository>(
      () => _i530.AntivirusRepository(gh<_i805.AppDatabase>()),
    );
    gh.factory<_i397.HomeBloc>(
      () => _i397.HomeBloc(gh<_i530.AntivirusRepository>()),
    );
    return this;
  }
}
