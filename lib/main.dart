import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/screen/choose_option.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDyXGICsdHoU32zF8QPNEDYIGrKEEmxGTE",
          appId: "1:476770145009:android:8ca7156799f36deb698f50",
          messagingSenderId: "476770145009",
          projectId: "flutter-blog-app-e5a8c",));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (ctx, child) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: ChooseOption());
        });
  }
}
