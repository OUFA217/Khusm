import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/widgets/sign_up_appbar.dart';
import 'package:khusm/features/signup/presentation/viewmodel/Bloc/cubit.dart';
import 'package:khusm/features/signup/presentation/viewmodel/Bloc/states.dart';
import 'package:khusm/generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(builder: (context, state) {
      var cubit = SignUpCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: signUpAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).SignUp,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xFF202020),
                      fontFamily: 'Ubuntu'),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).WeWillSendYouVerificationCode,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(78, 32, 32, 32),
                      fontFamily: 'Ubuntu'),
                ),
                const SizedBox(height: 10),
                const TextField(
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
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(92, 32, 32, 32),
                        fontFamily: 'Ubuntu',
                        fontSize: 13,
                      )),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return BlocBuilder<SignUpCubit, SignUpStates>(
                                  builder: (context, state) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.2,
                                  child: ListView.builder(
                                    itemCount: cubit.countries.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          cubit.changeCountry(
                                              cubit.countries[index]);
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
                                                  cubit.countries[index].flag!,
                                                  width: 30,
                                                  height: 30,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  cubit.countries[index]
                                                      .dialCode,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF2caca3),
                                                      fontFamily: 'Ubuntu'),
                                                ),
                                                const SizedBox(width: 5),
                                                Expanded(
                                                  child: Text(
                                                      cubit.countries[index]
                                                          .name,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFF2caca3),
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
                                    "assets/images/Khusm.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                cubit.countryWithName?.dialCode ?? "+20",
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
                const SizedBox(height: 10),
                TextField(
                  readOnly: true,
                  controller:
                      TextEditingController(text: cubit.genderSelection),
                  decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: DropdownButton(
                        style: const TextStyle(
                          color: Color.fromARGB(92, 32, 32, 32),
                          fontFamily: 'Ubuntu',
                          fontSize: 13,
                        ),
                        underline: Container(),
                        value: cubit.genderSelection,
                        items: const [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                        ],
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromARGB(92, 32, 32, 32),
                        ),
                        elevation: 16,
                        onChanged: (value) {
                          cubit.selectGender(value.toString());
                        },
                      ),
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
                      labelText: cubit.genderEmpty,
                      labelStyle: const TextStyle(
                        color: Color(0xFF2caca3),
                        fontFamily: 'Ubuntu',
                        fontSize: 13,
                      )),
                ),
                const SizedBox(height: 10),
                const TextField(
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
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(92, 32, 32, 32),
                          fontFamily: 'Ubuntu',
                          fontSize: 13,
                        )),
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                const TextField(
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
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(92, 32, 32, 32),
                          fontFamily: 'Ubuntu',
                          fontSize: 13,
                        )),
                    keyboardType: TextInputType.datetime),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                TextField(
                  obscureText: !cubit.isShownConfirmPassword,
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
                      suffixIcon: cubit.isShownConfirmPassword
                          ? IconButton(
                              onPressed: () {
                                cubit.showConfirmPassword();
                              },
                              icon: const Icon(Icons.visibility_off))
                          : IconButton(
                              onPressed: () {
                                cubit.showConfirmPassword();
                              },
                              icon: const Icon(Icons.visibility)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelText: 'Re-Enter Password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(92, 32, 32, 32),
                        fontFamily: 'Ubuntu',
                        fontSize: 13,
                      )),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'By Continuing, you agree to our ',
                    style: const TextStyle(
                      height: 1.5,
                      fontFamily: 'Ubuntu',
                      fontSize: 12,
                      color: Color.fromARGB(92, 32, 32, 32),
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: const TextStyle(
                          color: Color(0xFF2caca3),
                        ),
                        // Add a GestureRecognizer if you want to make it clickable
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: Color.fromARGB(92, 32, 32, 32),
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Color(0xFF2caca3),
                        ),
                        // Add a GestureRecognizer if you want to make it clickable
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Center(
                    child: RichText(
                        text: TextSpan(
                  text: 'Already have an account? ',
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
                          cubit.navigateToLoginScreen(context);
                        },
                    ),
                  ],
                )))
              ],
            ),
          ),
        ),
      );
    });
  }
}
