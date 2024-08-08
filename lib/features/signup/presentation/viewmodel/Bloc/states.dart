abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}

class CountryWithNameState extends SignUpStates {}

class CountriesLoadedState extends SignUpStates {}

class CountriesErrorState extends SignUpStates {
  final Exception error;

  CountriesErrorState(this.error);
}

class CountryErrorState extends SignUpStates {
  final Exception error;

  CountryErrorState(this.error);
}

class ChangedCountry extends SignUpStates {}

class ChangedGender extends SignUpStates {}

class ChangedPassword extends SignUpStates {}

class ChangedConfirmPassword extends SignUpStates {}
