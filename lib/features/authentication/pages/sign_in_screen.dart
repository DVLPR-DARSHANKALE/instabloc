import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/const/extenstion/number_extension.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/core/const/widgets/customeTextField.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';
import 'package:instagrambloc/features/authentication/pages/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController mobilefield = TextEditingController();
  TextEditingController passfield = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInfailureState) {
          return snapBar(
            context: context,
            color: Colors.red,
            message: state.error,
          );
        } else if (state is SignInSuccessState) {
          snapBar(
            context: context,
            color: Colors.green,
            message: "Sign In Succefully",
          );
          goRouter.goNamed(Routes.homeScreen.name);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          child: Form(
            key: _fromkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    "https://fontmeme.com/images/instagram-new-logo.png",
                    height: 300.h,
                    width: 300.w,
                  ),
                  customTextfield(
                    isRequired: true,
                    controller: mobilefield,
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
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            SignInEvent(
                              email: mobilefield.text,
                              password: passfield.text,
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is SignInLoadingState) {
                            return CircularProgressIndicator();
                          }
                          return Text("Sign In");
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      5.widthbox,
                      InkWell(
                        onTap: () {
                          goRouter.goNamed(Routes.signUpScreen.name);
                        },
                        child: Text(
                          " Sign up",
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
          ),
        ),
      ),
    );
  }
}
