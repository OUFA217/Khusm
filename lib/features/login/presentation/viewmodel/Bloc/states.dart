abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {}

class CountryWithNameState extends LoginStates {}

class CountriesLoadedState extends LoginStates {}

class CountriesErrorState extends LoginStates {
  final Exception error;

  CountriesErrorState(this.error);
}

class CountryErrorState extends LoginStates {
  final Exception error;

  CountryErrorState(this.error);
}
