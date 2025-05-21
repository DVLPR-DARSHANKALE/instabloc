import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/features/globels.dart';

void main() {
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: goRouter,
      ),
    );
  }
}
