import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SettingServiceRow({required icon, required text, required onTap}){
  return Padding(
    padding: const EdgeInsets.only(right: 11.0, left: 20.0, bottom: 16.0),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon ,
            height: 24,
            width: 24,
            color: Colors.black,
          ),
          SizedBox(width: 8,),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/RightArrowIcon.svg',
            height: 17,
            width: 11,
            color: Colors.black,)
        ],
      ),
    ),
  );
}