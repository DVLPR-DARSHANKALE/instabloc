import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/globels.dart';
import 'package:instagrambloc/core/services/token_service/token_service.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/repository/auth_repository.dart';

void main() {
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(AuthRepository(TokenService()))),
      ],
      child: ScreenUtilInit(
        designSize: Size(428, 926),

        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,

          routerConfig: goRouter,
        ),
      ),
    );
  }
}
