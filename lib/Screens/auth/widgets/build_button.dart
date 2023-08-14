import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

Container buildButton(String text, {String? iconPath, onPressed}) {
  return Container(
    margin: const EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFAEDC81), Color(0xFF6CC51D)],
      ),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 26,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          iconPath != null ? SvgPicture.asset(iconPath) : Container(),
          const Spacer(),
          Text(
            text,
            style: textStyle('assets/fonts/Poppins-Medium.ttf', 15.sp,
                FontWeight.w500, 0, Colors.white),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
