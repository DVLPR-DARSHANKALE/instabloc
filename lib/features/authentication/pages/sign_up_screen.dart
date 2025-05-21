import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/extenstion/number_extension.dart';
import 'package:instagrambloc/core/globels.dart';
import 'package:instagrambloc/core/widgets/customeTextField.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';

displaySnakbar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: color ?? Colors.green),
  );
}

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController passfield = TextEditingController();

  TextEditingController emailField = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          displaySnakbar(context, state.message, Colors.red);
        } else if (state is SignUpSuccess) {
          displaySnakbar(context, "Sign up successfully", Colors.green);
          goRouter.goNamed(Routes.profileScreen.name);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _fromkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      50.heighbox,
                      Image.network(
                        "https://fontmeme.com/images/instagram-new-logo.png",
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Sign up to see photos and videos \nfrom your friends.",
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                      20.heighbox,

                      customTextfield(
                        isRequired: true,
                        controller: emailField,

                        hintText: "Mobile Number Or Email",
                      ),
                      20.heighbox,
                      customTextfield(
                        isRequired: true,
                        controller: passfield,
                        hintText: "Password",
                      ),

                      50.heighbox,

                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                SignUpEvent(
                                  email: emailField.text,
                                  password: passfield.text,
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is SignUpLoading) {
                                return CircularProgressIndicator();
                              }
                              return Text("Sign Up");
                            },
                          ),
                        ),
                      ),
                      5.heighbox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have a account"),
                          5.widthbox,
                          InkWell(
                            onTap: () {
                              goRouter.goNamed(Routes.signInScreen.name);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
