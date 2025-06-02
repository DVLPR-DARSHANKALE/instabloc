import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagrambloc/core/const/utility/globels.dart';
import 'package:instagrambloc/features/bottom_navi/bloc/bottomnavi_bloc.dart';
import 'package:instagrambloc/features/bottom_navi/bloc/bottomnavi_event.dart';
import 'package:instagrambloc/features/bottom_navi/bloc/bottomnavi_state.dart';

class NaviBar extends StatelessWidget {
  NaviBar({super.key, required this.child});
  Widget child;
  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.person_4_outlined,
  ];
  List<String> screens = ["/homeScreen", "/search", "/addPost", "/profile"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnaviBloc(),
      child: BlocBuilder<BottomnaviBloc, BottomnaviState>(
        builder: (context, state) {
          return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              height: 50,
              width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(icons.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      goRouter.go(screens[index]);
                      context.read<BottomnaviBloc>().add(ChangeTab(index));
                    },
                    child: Icon(
                      icons[index],
                      color:
                          index == state.selectTabIndex
                              ? Colors.black
                              : Colors.black12,
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
