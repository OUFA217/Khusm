import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/routes/page_generator.dart';
import 'package:khusm/features/signIn/presentation/view/sign_in_screen.dart';
import 'package:khusm/features/signup/domain/entities/country_entitie.dart';
import 'package:khusm/features/signup/domain/usecases/country_usecase.dart';
import 'package:khusm/features/signup/presentation/viewmodel/Bloc/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(
      {required this.loadCountriesUseCase,
      required this.getCountryWithNameUseCase})
      : super(SignUpInitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final LoadCountries loadCountriesUseCase;
  final GetCountryWithName getCountryWithNameUseCase;
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Country> countries = [];

  bool isShownConfirmPassword = false;

  Country? countryWithName;
  List<String> genderList = <String>[
    'Male',
    'Female',
  ];
  String genderSelection = "Male";
  String genderEmpty = "";
  bool isShownPassword = false;
  void showPassword() {
    isShownPassword = !isShownPassword;
    emit(ChangedPassword());
  }

  void showConfirmPassword() {
    isShownConfirmPassword = !isShownConfirmPassword;
    emit(ChangedConfirmPassword());
  }

  void selectGender(String gender) {
    genderSelection = gender;
    genderEmpty = gender;
    emit(ChangedGender());
  }

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

  void getCountryWithName(String name) async {
    final result = await getCountryWithNameUseCase(name);
    result.fold(
      (error) {
        if (kDebugMode) {
          log(error.toString());
        }
        emit(CountryErrorState(error));
      },
      (country) {
        countryWithName = country;
        log(countryWithName!.flag.toString());
        emit(CountryWithNameState());
      },
    );
  }

  void changeCountry(Country country) {
    countryWithName = country;
    emit(ChangedCountry());
  }

  void navigateToLoginScreen(BuildContext context) {
    navigateTo(context, const SignInScreen());
  }
}
