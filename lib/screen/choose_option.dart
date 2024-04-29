import 'package:flutter/material.dart';
import 'package:flutter_blog/components/global_button.dart';
import 'package:flutter_blog/login/login.dart';
import 'package:flutter_blog/signin/signin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseOption extends StatelessWidget {
  const ChooseOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Option"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalButton(
              title: "Login",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            GlobalButton(
              title: "SignIn",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
