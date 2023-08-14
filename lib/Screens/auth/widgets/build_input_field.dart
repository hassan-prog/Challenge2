import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

Container buildInputField(
  String leadingIcon,
  String hint, {
  String? suffixIcon,
  bool obsecure = false,
  validator,
}) {
  return Container(
    margin: const EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: ListTile(
      leading: SvgPicture.asset(leadingIcon),
      title: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textStyle(
            'assets/fonts/Poppins.ttf',
            15.sp,
            FontWeight.w400,
            0.45.sp,
            const Color(0xFF868889),
          ),
          border: InputBorder.none,
        ),
        validator: validator,
        obscureText: obsecure,
      ),
      trailing: suffixIcon != null ? SvgPicture.asset(suffixIcon) : null,
    ),
  );
}
