import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_bloc.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_event.dart';
import 'package:instagrambloc/features/authentication/bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 60.h,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX0nmJMLL5Emjx9lek2nC9QFzjjGS0qhb6Cd_FvBIp3l4K9g7J-1pJqcEUWb-_zgM4Z0g&usqp=CAU",
              // height: 200.h,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 20),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              goRouter.pushNamed(Routes.message.name);
            },
            icon: Icon(Icons.send_outlined, color: Colors.black),
          ),
          SizedBox(width: 12),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignOutSuccessfulState) {
                goRouter.goNamed(Routes.signInScreen.name);
              }
            },
            child: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              icon: Icon(Icons.login_rounded, color: Colors.black),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(3, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLxEP9J28mttDQ8oSZVQXlwUO5jFYvkiMIAA&s",
                    ),
                  ),
                  title: Text(
                    'user',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.more_vert),
                ),

                Image.network(
                  "https://static.sociofyme.com/thumb/102340615/102340615.jpg?imgsize=25004&width=420&height=746&resizemode=76",
                  height: 350,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 16),
                      Icon(Icons.comment_outlined),
                      SizedBox(width: 16),
                      Icon(Icons.send),
                      Spacer(),
                      Icon(Icons.bookmark_border),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ],
            );
          }),
        ],
      ),
    );
  }
}
