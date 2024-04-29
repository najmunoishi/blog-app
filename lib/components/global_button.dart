import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key,
  required this.title,
  required this.onTap,
  }) : super(key: key);
final String title;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 62.h,
                width: 300.w,
                color: Colors.amber,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
  }
}