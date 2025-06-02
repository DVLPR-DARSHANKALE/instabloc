import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagrambloc/core/const/extenstion/number_extension.dart';
import 'package:instagrambloc/core/const/services/notification/local_notification.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/features/authentication/pages/sign_up_screen.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_bloc.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_event.dart';
import 'package:instagrambloc/features/profile_setup/bloc/profile_state.dart';
import 'package:instagrambloc/features/profile_setup/repository/profile_repository.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<FormState> _fromkey = GlobalKey();
  TextEditingController namefield = TextEditingController();
  TextEditingController usernamefield = TextEditingController();
  TextEditingController biofield = TextEditingController();
  bool isRequired = false;

  @override
  Widget build(BuildContext contextt) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepository()),
      child: Builder(
        builder: (context) {
          return BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProccedSuccessState) {
                goRouter.goNamed(Routes.homeScreen.name);
              } else if (state is ProccedErrorState) {
                snapBar(
                  context: context,
                  message: state.error,
                  color: Colors.red,
                );
              }
            },
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
                          buildWhen:
                              (previous, current) => current is ImagepickState,
                          builder: (context, state) {
                            if (state is ImageLoading) {
                              return CircularProgressIndicator();
                            } else if (state is ImageLoaded) {
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
                                          FetchImageEvent(),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
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
                                      context.read<ProfileBloc>().add(
                                        FetchImageEvent(),
                                      );
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
                              validator: (value) {
                                if (value == null || value == "") {
                                  return "This field is required";
                                }
                                return null;
                              },
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
                              validator: (value) {
                                if (value == null || value == "") {
                                  return "this field id required";
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                // print("object");
                                context.read<ProfileBloc>().add(
                                  CheckUsernamEvent(usernamefield.text),
                                );
                              },
                              controller: usernamefield,
                              decoration: InputDecoration(
                                hintText: "username",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        buildWhen:
                            (previous, current) => current is UsernameState,
                        builder: (context, state) {
                          if (state is UserNameAvailable) {
                            return Text(
                              "Username Available",
                              style: TextStyle(color: Colors.green),
                            );
                          } else if (state is UserNameNotAvailable) {
                            return Text(
                              "Username Not Available",
                              style: TextStyle(color: Colors.red),
                            );
                          }
                          return Text("");
                        },
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
                        height: 50.h,
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.blue,
                            ),
                          ),
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              context.read<ProfileBloc>().add(
                                ProccedEvent(
                                  usernamefield.text,
                                  biofield.text,
                                  namefield.text,
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state is ProccedLoadingState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return Text("Procced");
                            },
                          ),
                        ),
                      ),
                      20.heighbox,
                      FilledButton(
                        onPressed: () {
                          NotificationService.showNotification(
                            id: 1,
                            title: "INSTAGRAM",
                            body: "open a instagram",
                          );
                        },
                        child: Text("Display Notification"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
