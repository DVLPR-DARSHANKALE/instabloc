import 'package:go_router/go_router.dart';
import 'package:instagrambloc/features/authentication/pages/home_screen.dart';
import 'package:instagrambloc/features/authentication/pages/sign_in_screen.dart';
import 'package:instagrambloc/features/authentication/pages/sign_up_screen.dart';
import 'package:instagrambloc/features/authentication/pages/spalsh_screen.dart';
import 'package:instagrambloc/features/profile_setup/pages/profile_screen.dart';

enum Routes {
  spalshScreen,
  signUpScreen,
  homeScreen,
  signInScreen,
  profileScreen,
}

GoRouter goRouter = GoRouter(
  initialLocation: "/profileScreen",
  routes: [
    GoRoute(
      path: "/",
      name: Routes.spalshScreen.name,
      builder: (context, state) => SpalshScreen(),
    ),
    GoRoute(
      path: "/signUpScreen",
      name: Routes.signUpScreen.name,
      builder: (context, state) => SignUpScreen(),
      routes: [
        GoRoute(
          path: "signInScreen",
          name: Routes.signInScreen.name,
          builder: (context, state) => SignInScreen(),
        ),
      ],
    ),
    GoRoute(
      path: "/homeScreen",
      name: Routes.homeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: "/profileScreen",
      name: Routes.profileScreen.name,
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);
