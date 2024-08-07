import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/features/login/domain/entities/country_entitie.dart';
import 'package:khusm/features/login/domain/usecases/country_usecase.dart';
import 'package:khusm/features/login/presentation/viewmodel/Bloc/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(
      {required this.loadCountriesUseCase,
      required this.getCountryWithNameUseCase})
      : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  final LoadCountries loadCountriesUseCase;
  final GetCountryWithName getCountryWithNameUseCase;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Country> countries = [];
  Country? countryWithName;

  Future<void> loadCountries() async {
    final result = await loadCountriesUseCase();
    result.fold(
      (error) {
        if (kDebugMode) {
          log(error.toString());
        }
        emit(CountriesErrorState(error));
      },
      (data) {
        countries = data;
        emit(CountriesLoadedState());
      },
    );
  }

  void getCountryWithName(String name) {
    final result = getCountryWithNameUseCase(name);
    result.fold(
      (error) => emit(CountryErrorState(error)),
      (country) {
        countryWithName = country;
        emit(CountryWithNameState());
      },
    );
  }
}
