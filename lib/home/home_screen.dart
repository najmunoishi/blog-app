import 'package:flutter/material.dart';
import 'package:flutter_blog/home/add_post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Blogs"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          InkWell
          (
            onTap: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPostScreen()),
                          );
            },
            child: Icon(Icons.add)),
          SizedBox(width: 20.w,)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}