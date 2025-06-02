import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/const/services/notification/local_notification.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
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
