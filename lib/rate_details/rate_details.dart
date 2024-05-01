import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_beat_app/helpers/constants.dart';
import 'package:heart_beat_app/helpers/functions.dart';

class RateDetails extends StatelessWidget {
  const RateDetails(
      {super.key,
      required this.averageValue,
      required this.highestValue,
      required this.lowestValue,
      required this.date});

  final double averageValue;
  final int highestValue, lowestValue;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
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
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: kPrimaryLight,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Min.',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          lowestValue.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'BPM',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: kPrimaryLight,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Max.',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          highestValue.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'BPM',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Container(
              // height: ,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: kPrimaryLight,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.heart_broken),
                  20.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heart Rate',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        formatDateTime(date),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      text: '${averageValue.round()}',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text: ' BPM',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
