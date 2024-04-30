import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_beat_app/helpers/constants.dart';

class RateDetails extends StatelessWidget {
  const RateDetails({super.key, required this.averageValue});

  final double averageValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            Center(
              child: CircleAvatar(
                radius: 150,
                backgroundColor: kPrimary,
                child: CircleAvatar(
                  backgroundColor: kWhite,
                  radius: 146,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '❤️',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        averageValue.round().toString(),
                        style: TextStyle(
                          fontSize: 70.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'BPM',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: kPrimary.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
