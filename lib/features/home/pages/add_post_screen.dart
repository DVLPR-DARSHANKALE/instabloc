import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 800),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: () {}, child: Text("Library")),
                TextButton(onPressed: () {}, child: Text("Photo")),
                TextButton(onPressed: () {}, child: Text("Video")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
