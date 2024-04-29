import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blog/components/global_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostState();
}

class _AddPostState extends State<AddPostScreen> {
  
  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.ref().child(
        'Posts',
      );
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? image;
  final picker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  Future getCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  void dialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          content: Container(
            height: 120.h,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    getCameraImage();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.camera,
                    ),
                    title: Text("Camera"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getImageGallery();
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.photo_library,
                    ),
                    title: Text("Gallery"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Blog"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    dialog(context);
                  },
                  child: Center(
                    child: Container(
                      height: 200.h,
                      width: 350.w,
                      child: image != null
                          ? ClipRect(
                              child: Image.file(image!.absolute,
                                  width: 100.w, height: 100.h, fit: BoxFit.fill),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 100.w,
                              height: 100.h,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: "Enter the title name",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 5,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: "Enter the description",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GlobalButton(
                      title: "Uploade",
                      onTap: () {},
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
