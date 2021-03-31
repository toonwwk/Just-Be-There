import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension appColor on Color {
  static Color get orange => Color(0xFFF2A154);
  static Color get green => Color(0xFF314E52);
  static Color get yellow => Color(0xFFF7F6E7);
  static Color get lightGray => Color(0xFFE7E6E1);
  static Color get darkGray => Color(0xFFC4C4C4);
}

extension appTextStyle on TextStyle {
  static TextStyle get bold18Gray => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: appColor.lightGray,
      );
  static TextStyle get bold18Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: appColor.green,
      );
  static TextStyle get bold15Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: appColor.green,
      );
  static TextStyle get bold15Yellow => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: appColor.yellow,
      );

  static TextStyle get semiBold15Orange => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: appColor.orange,
      );
  static TextStyle get semiBold15Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: appColor.green,
      );
  static TextStyle get semiBold15White => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.white,
      );
  static TextStyle get semiBold12Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: appColor.green,
      );

  static TextStyle get regular15Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: appColor.green,
      );
  static TextStyle get regular15Gray => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: appColor.darkGray,
      );
  static TextStyle get regular13Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: appColor.green,
      );
  static TextStyle get regular10Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: appColor.green,
      );

  static TextStyle get light9Green => TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w300,
        fontSize: 9,
        color: appColor.green,
      );
}

extension appAsset on Image {
  static AssetImage get selectedMap =>
      AssetImage('assets/icon-selected-map.png');
  static AssetImage get selectedNoti =>
      AssetImage('assets/icon-selected-noti.png');
  static AssetImage get selectedSetting =>
      AssetImage('assets/icon-deselected-setting.png');
  static AssetImage get deselectedMap =>
      AssetImage('assets/icon-deselected-map.png');
  static AssetImage get deselectedNoti =>
      AssetImage('assets/icon-deselected-noti.png');
  static AssetImage get deselectedSetting =>
      AssetImage('assets/icon-deselected-setting.png');
  static AssetImage get username => AssetImage('assets/icon-username.png');
  static AssetImage get username2 => AssetImage('assets/icon-username2.png');
  static AssetImage get password => AssetImage('assets/icon-password.png');
  static AssetImage get icon => AssetImage('assets/icon.png');
  static AssetImage get imagePicker =>
      AssetImage('assets/button-image-picker.png');
}

class UserPref {
  static String get email => "email";
  static String get userId => "uid";
}
