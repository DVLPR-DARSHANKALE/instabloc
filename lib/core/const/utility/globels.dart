import 'package:go_router/go_router.dart';
import 'package:instagrambloc/core/const/services/token_services.dart';
import 'package:instagrambloc/features/home/pages/add_post_screen.dart';
import 'package:instagrambloc/features/home/pages/home_screen.dart';
import 'package:instagrambloc/features/authentication/pages/sign_in_screen.dart';
import 'package:instagrambloc/features/authentication/pages/sign_up_screen.dart';
import 'package:instagrambloc/features/authentication/pages/spalsh_screen.dart';
import 'package:instagrambloc/features/home/pages/insta_profile.dart';
import 'package:instagrambloc/features/bottom_navi/pages/navi_bar.dart';
import 'package:instagrambloc/features/home/pages/search_screen.dart';
import 'package:instagrambloc/features/message/pages/chattingScreen.dart';
import 'package:instagrambloc/features/message/pages/message_screen.dart';
import 'package:instagrambloc/features/profile_setup/pages/profile_setup.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
TokenServices token = TokenServices();

enum Routes {
  spalshScreen,
  signUpScreen,
  homeScreen,
  signInScreen,
  profileScreen,
  profile,
  addPost,
  search,
  message,
  chatScreen,
}

GoRouter goRouter = GoRouter(
  initialLocation: "/homeScreen",
  routes: [
    ShellRoute(
      builder: (context, state, child) => NaviBar(child: child),
      routes: [
        GoRoute(
          path: "/homeScreen",
          name: Routes.homeScreen.name,
          builder: (context, state) => HomeScreen(),
          routes: [],
        ),

        GoRoute(
          path: "/search",
          name: Routes.search.name,
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: "/addPost",
          name: Routes.addPost.name,
          builder: (context, state) => AddPostScreen(),
        ),
        GoRoute(
          path: "/profile",
          name: Routes.profile.name,
          builder: (context, state) => InstaProfile(),
        ),
      ],
    ),
    GoRoute(
      path: "/message",
      name: Routes.message.name,
      builder: (context, state) => MessageScreen(),
      routes: [
        GoRoute(
          path: "/chatScreen",
          name: Routes.chatScreen.name,
          builder: (context, state) => Chattingscreens(),
        ),
      ],
    ),
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
      path: "/profileScreen",
      name: Routes.profileScreen.name,
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);
