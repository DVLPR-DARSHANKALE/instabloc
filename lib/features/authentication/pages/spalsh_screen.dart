import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      context.read<AuthBloc>().add(TokenEvent());
    });
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is TokenSuccessState) {
          goRouter.goNamed(Routes.homeScreen.name);
        } else if (state is TokenErrorState) {
          goRouter.goNamed(Routes.signInScreen.name);
        }
      },
      child: Scaffold(
        body: Center(
          child: AnimatedScale(
            duration: Duration(microseconds: 600),
            scale: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                "https://cdn.abicart.com/shop/images/191459821-origpic-61f31d/ws89/120689/art89/h9821/instagram-logo.png",
                fit: BoxFit.scaleDown,
                height: 200.h,
                width: 200.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
