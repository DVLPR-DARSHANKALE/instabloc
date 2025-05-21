import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/features/extenstion/number_extension.dart';
import 'package:instagrambloc/features/globels.dart';
import 'package:instagrambloc/features/utility/customeTextField.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController mobilefield = TextEditingController();
  TextEditingController passfield = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        child: Form(
          key: _fromkey,
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
                      goRouter.goNamed(Routes.homeScreen.name);
                    }
                  },
                  child: Text("Sign In"),
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
    );
  }
}
