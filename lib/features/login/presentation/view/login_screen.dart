import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/features/login/presentation/viewmodel/Bloc/cubit.dart';
import 'package:khusm/features/login/presentation/viewmodel/Bloc/states.dart';
import 'package:khusm/features/login/presentation/widgets/appbar/login_appbar.dart';
import 'package:khusm/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return Scaffold(
        appBar: loginAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Login,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xFF202020),
                      fontFamily: 'Ubuntu'),
                ),
                const SizedBox(height: 25),
                Text(
                  S.of(context).WeWillSendYouVerificationCode,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(78, 32, 32, 32),
                      fontFamily: 'Ubuntu'),
                ),
                const SizedBox(height: 25),
                const TextField(
                  decoration: InputDecoration(
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
                        color: Color(0xFF2caca3),
                        fontFamily: 'Ubuntu',
                        fontSize: 13,
                      )),
                ),
                const SizedBox(height: 15),
                // Row(
                //   children: [
                //     Container(
                //       height: 40,
                //       width: 27,
                //       decoration: BoxDecoration(
                //         color: const Color.fromARGB(78, 44, 172, 164),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: const Row(
                //         children: [
                //           SizedBox(width: 5),
                //           Text(
                //             "",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 color: Color(0xFF2caca3),
                //                 fontFamily: 'Ubuntu'),
                //           ),
                //           SizedBox(width: 5),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(width: 20),
                //     const TextField(
                //       decoration: InputDecoration(
                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Color(0xFF2caca3),
                //             ),
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(10),
                //             ),
                //           ),
                //           errorBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(10),
                //             ),
                //             borderSide: BorderSide(
                //               color: Colors.red,
                //             ),
                //           ),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(10),
                //             ),
                //           ),
                //           labelText: 'Phone Number',
                //           labelStyle: TextStyle(
                //             color: Color(0xFF2caca3),
                //             fontFamily: 'Ubuntu',
                //             fontSize: 13,
                //           )),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
