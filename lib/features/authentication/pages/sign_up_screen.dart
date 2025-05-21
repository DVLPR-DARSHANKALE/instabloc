import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/features/extenstion/number_extension.dart';
import 'package:instagrambloc/features/globels.dart';
import 'package:instagrambloc/features/utility/customeTextField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController namefield = TextEditingController();
  TextEditingController passfield = TextEditingController();
  TextEditingController userfield = TextEditingController();
  TextEditingController mobilefield = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: mobilefield,

                      hintText: "Mobile Number Or Email",
                    ),
                    20.heighbox,
                    customTextfield(
                      isRequired: true,
                      controller: passfield,
                      hintText: "Password",
                    ),
                    20.heighbox,
                    customTextfield(
                      isRequired: true,
                      controller: namefield,
                      hintText: "Fullname",
                    ),
                    20.heighbox,
                    customTextfield(
                      isRequired: true,
                      controller: userfield,
                      hintText: "Username",
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
                            goRouter.goNamed(Routes.profileScreen.name);
                          }
                        },
                        child: Text("Sign Up"),
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
    );
  }
}
