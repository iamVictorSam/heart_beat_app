import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heart_beat_app/helpers/constants.dart';

class DefaultBtn extends StatelessWidget {
  const DefaultBtn(
      {super.key,
      this.isEnabled = true,
      required this.press,
      this.label = 'label',
      this.height = 42,
      this.isRed = false});

  final bool isEnabled;
  final GestureTapCallback press;
  final String label;
  final double height;
  final bool isRed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: isEnabled ? press : () {},
        child: Container(
          width: Get.width,
          height: height,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isRed && isEnabled
                ? redR400
                : isEnabled
                    ? kPrimary
                    : kGrey,
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: isEnabled ? textWhite : textDarkAsh,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
