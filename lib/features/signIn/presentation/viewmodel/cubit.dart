import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/routes/page_generator.dart';
import 'package:khusm/features/signIn/presentation/viewmodel/states.dart';
import 'package:khusm/features/signup/domain/entities/country_entitie.dart';
import 'package:khusm/features/signup/presentation/view/sign_up.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  bool isShownPassword = false;
  Country? countryWithName;

  void showPassword() {
    isShownPassword = !isShownPassword;
    emit(ChangedPassword());
  }

  void navigateToSignUp(context) {
    navigateTo(context, const SignUpScreen());
  }

  void changeCountry(Country country) {
    countryWithName = country;
    emit(ChangedCountry());
  }
}
