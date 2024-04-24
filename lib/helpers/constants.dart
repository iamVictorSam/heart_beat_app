import 'package:flutter/material.dart';

// const kPrimary = Color(0xff302782);
// const kPrimary = Color(0xff4CBB17);
const kPrimary = Color(0xff2E8B57);
// const kPrimary = Color(0xff4169E1);

const kPrimaryLight = Color.fromARGB(133, 66, 166, 109);
const kBlack = Color(0xFF02010B);
const kGrey = Color(0xFFE6E6E7);
const textDarkAsh = Color(0xFF605656);
const textWhite = Color(0xffFFFFFF);
const textDark = Color(0xFF0D0D0D);
const greenG300 = Color(0xff4CAF50);
const neutralsVariant75 = Color(0xff98979E);
const neutralN60 = Color(0xffB3B9C4);
const neutralsVariantN300 = Color(0xff040212);
const neutralsN20 = Color(0xFFF5F6F7);
const neutralsN40 = Color(0xffDFE2E6);
const neutralsN10 = Color(0xFFFAFBFB);
const brand1 = Color(0xff302782);
const bKGLightAsh = Color(0xffF6F6F6);
const textLink = Color(0xFF3F83E9);
const textLightAsh = Color(0xFF666362);
const neutralVariantN100 = Color(0xff6D6C76);
const neutralsN200 = Color(0xFF6B788E);
const primaryP75 = Color(0xFFAAA6CC);
const neutralN30 = Color(0xffEBEDF0);
const yellowY300 = Color(0xffF1C735);
const yellowY400 = Color(0xffA98B25);
const yellow2 = Color(0xffc4af5f);
const greenG500 = Color(0xFF2E6B31);
const kWhite = Colors.white;
const transactionalBankIconColor = Color(0xff695919);
const textError = Color(0xffB50000);
const redR300 = Color(0xffcb4343);
const redR400 = Color(0xffb32922);
const neutralsN70 = Color(0xffA6AEBB);

OutlineInputBorder otpOutlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide.none,
  );
}

OutlineInputBorder otpFocusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: kPrimary),
  );
}
