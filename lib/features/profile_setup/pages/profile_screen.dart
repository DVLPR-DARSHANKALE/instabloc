import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/extenstion/number_extension.dart';
import 'package:instagrambloc/core/globels.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_bloc.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_event.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<FormState> _fromkey = GlobalKey();
  TextEditingController namefield = TextEditingController();
  TextEditingController usernamefield = TextEditingController();
  TextEditingController biofield = TextEditingController();
  bool isRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text(
              "Set Up Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _fromkey,
              child: Column(
                children: [
                  30.heighbox,
                  Center(
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return CircularProgressIndicator();
                        } else if (state is LoadedState) {
                          return Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 80.r,
                                backgroundImage: FileImage(state.image),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,

                                child: IconButton(
                                  onPressed: () {
                                    context.read<ProfileBloc>().add(
                                      FetchImage(),
                                    );
                                  },
                                  icon: Icon(Icons.edit, color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        }
                        return Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 100,
                              height: 100,

                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(),
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(70.r),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 70.sp,
                                color: Colors.white70,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blue,

                              child: IconButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(FetchImage());
                                },
                                icon: Icon(Icons.edit, color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  50.heighbox,
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      10.widthbox,
                      Flexible(
                        child: TextFormField(
                          validator:
                              isRequired
                                  ? (value) {
                                    if (value == null || value == "") {
                                      return "This field is required";
                                    }
                                  }
                                  : null,
                          controller: namefield,
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Username ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      10.widthbox,
                      Expanded(
                        child: TextFormField(
                          controller: usernamefield,
                          decoration: InputDecoration(
                            hintText: "username",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Bio ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      10.widthbox,
                      Expanded(
                        child: TextFormField(
                          controller: biofield,
                          decoration: InputDecoration(
                            hintText: "Bio",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  50.heighbox,
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              goRouter.goNamed(Routes.homeScreen.name);
                            }
                          },
                          child: Text("Procced"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
