// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khusm/features/login/di/dependency_injection.dart';
import 'package:khusm/features/login/presentation/viewmodel/Bloc/cubit.dart';
import 'package:khusm/features/main/cubit/cubit.dart';
import 'package:khusm/features/main/cubit/states.dart';
import 'package:khusm/features/splash/view/splash_screen.dart';
import 'package:khusm/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) => sl<LoginCubit>()..loadCountries()),
        BlocProvider<MainCubit>(create: (context) => MainCubit()),
      ],
      child: BlocBuilder<MainCubit, MainStates>(builder: (context, state) {
        var cubit = MainCubit.get(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale(cubit.lang),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
