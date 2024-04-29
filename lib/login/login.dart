import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/global_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  bool showSpinner = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Account"),
          backgroundColor: Colors.amber,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.w),
                    ),
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return "The email field is required.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1.w),
                    ),
                  ),
                  controller: passwordControler,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return "The password field is required.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                GlobalButton(
                  title: "Log In",
                  onTap: () async {
                    // Navigator.push(
                    //   //context,
                    //   //MaterialPageRoute(
                    //     //builder: (context) => SignInScreen(),
                    //   //),
                    // );
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        showSpinner = true;
                      });

                      try {
                        final user = await auth.signInWithEmailAndPassword(
                            email: email.toString().trim(),
                            password: password.toString().trim());

                        if (user != null) {
                          print("Sucsses");
                          toastMessage("User successfully login");
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                      } catch (e) {
                        print(e.toString());
                        toastMessage(e.toString());
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
