import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/globels.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  bool isScale = false;

  final tokenService = TokenService();

  changeScreen() async {
    Future.delayed(Duration(milliseconds: 600), () {
      isScale = true;
      setState(() {});
    });
    if (await tokenService.refreshToken != null) {
      goRouter.goNamed(Routes.homeScreen.name);
    } else {
      goRouter.goNamed(Routes.signInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    changeScreen();
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          duration: Duration(microseconds: 600),
          scale: isScale ? 1 : 0,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://cdn.abicart.com/shop/images/191459821-origpic-61f31d/ws89/120689/art89/h9821/instagram-logo.png",
              fit: BoxFit.scaleDown,
              height: 300.h,
              width: 300.w,
            ),
          ),
        ),
      ),
    );
  }
}
