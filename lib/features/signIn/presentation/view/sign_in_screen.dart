import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/widgets/sign_up_appbar.dart';
import 'package:khusm/features/signIn/presentation/viewmodel/cubit.dart';
import 'package:khusm/features/signIn/presentation/viewmodel/states.dart';
import 'package:khusm/features/signup/presentation/viewmodel/Bloc/cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInStates>(builder: (context, state) {
      final cubit = SignInCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: signUpAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF202020),
                    fontFamily: 'Ubuntu'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              const Text(
                "We will send you an SMS for verification",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(78, 32, 32, 32),
                    fontFamily: 'Ubuntu'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return BlocBuilder<SignInCubit, SignInStates>(
                                builder: (context, state) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.2,
                                child: ListView.builder(
                                  itemCount: context
                                      .read<SignUpCubit>()
                                      .countries
                                      .length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        cubit.changeCountry(context
                                            .read<SignUpCubit>()
                                            .countries[index]);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                context
                                                    .read<SignUpCubit>()
                                                    .countries[index]
                                                    .flag!,
                                                width: 40,
                                                height: 40,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                context
                                                    .read<SignUpCubit>()
                                                    .countries[index]
                                                    .dialCode,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF2caca3),
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                    context
                                                        .read<SignUpCubit>()
                                                        .countries[index]
                                                        .name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF2caca3),
                                                      fontFamily: 'Ubuntu',
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF202020),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              cubit.countryWithName?.flag ??
                                  context
                                      .watch<SignUpCubit>()
                                      .countryWithName!
                                      .flag!,
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              cubit.countryWithName?.dialCode ??
                                  context
                                      .watch<SignUpCubit>()
                                      .countryWithName!
                                      .dialCode,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(92, 32, 32, 32),
                                  fontFamily: 'Ubuntu'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF2caca3),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(92, 32, 32, 32),
                          fontFamily: 'Ubuntu',
                          fontSize: 13,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              TextField(
                decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2caca3),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    suffixIcon: cubit.isShownPassword
                        ? IconButton(
                            onPressed: () {
                              cubit.showPassword();
                            },
                            icon: const Icon(Icons.visibility_off))
                        : IconButton(
                            onPressed: () {
                              cubit.showPassword();
                            },
                            icon: const Icon(Icons.visibility)),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(92, 32, 32, 32),
                      fontFamily: 'Ubuntu',
                      fontSize: 13,
                    )),
                obscureText: !cubit.isShownPassword,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(360, 50),
                  backgroundColor: const Color(0xFF2caca3),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Center(
                  child: RichText(
                      text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                  color: Color.fromARGB(92, 32, 32, 32),
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: const TextStyle(
                      color: Color(0xFF2caca3),
                    ),
                    // Add a GestureRecognizer if you want to make it clickable
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        cubit.navigateToSignUp(context);
                      },
                  ),
                ],
              )))
            ],
          ),
        ),
      );
    });
  }
}
