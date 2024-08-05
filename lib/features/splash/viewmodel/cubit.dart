import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/routes/page_generator.dart';
import 'package:khusm/features/home/presentation/view/home_screen.dart';
import 'package:khusm/features/splash/viewmodel/states.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  static SplashCubit get(context) => BlocProvider.of(context);

  void navigateToHome(context) {
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(context, const HomeScreen());
    });
  }
}
