// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:khusm/features/signIn/presentation/viewmodel/cubit.dart';
import 'package:khusm/features/signup/data/repositories/get_country_with_name.dart';
import 'package:khusm/features/signup/data/repositories/load_country.dart';
import 'package:khusm/features/signup/domain/usecases/country_usecase.dart';
import 'package:khusm/features/signup/presentation/viewmodel/Bloc/cubit.dart';

final sl = GetIt.instance;

class DependencyInjection {
  void init() {
    // Data
    sl.registerLazySingleton<LoadCountries>(() => CountryRepositoryImpl());
    sl.registerLazySingleton<GetCountryWithName>(
        () => GetCountryWithNameImpl());

    // Cubit
    sl.registerFactory(() => SignUpCubit(
          loadCountriesUseCase: sl(),
          getCountryWithNameUseCase: sl(),
        ));
    sl.registerFactory(() => SignInCubit());
  }
}
