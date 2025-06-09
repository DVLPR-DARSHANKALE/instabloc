import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagrambloc/features/add_post/bloc/add_post_bloc.dart';
import 'package:instagrambloc/features/add_post/bloc/add_post_event.dart';
import 'package:instagrambloc/features/add_post/bloc/add_post_state.dart';
import 'package:instagrambloc/features/add_post/repository/add_post_repository.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostBloc(AddPostRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Post'),
          actions: [
            TextButton(
              onPressed: () {
                // context.read<AddPostBloc>().add(UploadImageEvent());
              },
              child: const Text('Share', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<AddPostBloc, AddPostState>(
                builder: (context, state) {
                  if (state is PickSuccessState) {
                    final image = state.images.first;
                    return SizedBox(
                      height: 300,

                      child: Image.file(File(image.path)),
                    );
                  } else if (state is PickfailureState) {
                    return Text(
                      "Image not add",
                      style: TextStyle(color: Colors.red),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      context.read<AddPostBloc>().add(PickImageevent());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Image Preview")),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Write a caption...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Tag People'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Add Location'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
