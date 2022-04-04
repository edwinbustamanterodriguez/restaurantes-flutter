import 'package:flutter/material.dart';

Color kBackgroundColor = const Color(0xffe7e7e7);
Color kTextColor = const Color(0xffbecde3);
Color kWhiteColor = const Color(0xffffffff);
Color kPrimaryColor = const Color(0xff24385b);
Color kSecondaryColor = const Color(0xff121f3d);
Color kAccentColor = const Color(0xff98ca3f);
Color kShadeColor = const Color(0xff969696);
Color kSoftShadeColor = const Color(0xffc4c4c4);
Color kBoxColor = const Color(0xffc4c4c4);
MaterialColor kAppBar  = MaterialColor(0xff121f3d,color);
MaterialColor kAppBarBack  = MaterialColor(0xff98ca3f,colorAppBack);

Map<int, Color> color =
{
  50:const Color.fromRGBO(18,31,61, .1),
  100:const Color.fromRGBO(18,31,61, .2),
  200:const Color.fromRGBO(18,31,61, .3),
  300:const Color.fromRGBO(18,31,61, .4),
  400:const Color.fromRGBO(18,31,61, .5),
  500:const Color.fromRGBO(18,31,61, .6),
  600:const Color.fromRGBO(18,31,61, .7),
  700:const Color.fromRGBO(18,31,61, .8),
  800:const Color.fromRGBO(18,31,61, .9),
  900:const Color.fromRGBO(18,31,61, 1),
};

Map<int, Color> colorAppBack =
{
  50:const Color.fromRGBO(152, 202, 63, .1),
  100:const Color.fromRGBO(152, 202, 63, .2),
  200:const Color.fromRGBO(152, 202, 63, .3),
  300:const Color.fromRGBO(152, 202, 63, .4),
  400:const Color.fromRGBO(152, 202, 63, .5),
  500:const Color.fromRGBO(152, 202, 63, .6),
  600:const Color.fromRGBO(152, 202, 63, .7),
  700:const Color.fromRGBO(152, 202, 63, .8),
  800:const Color.fromRGBO(152, 202, 63, .9),
  900:const Color.fromRGBO(152, 202, 63, 1),
};




TextStyle kRestaurantTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nexa',
    color: kSecondaryColor);

TextStyle kRestaurantTitleDetail = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nexa',
    color: kAccentColor);

TextStyle kRestaurantSubtitle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kShadeColor,
);

TextStyle kRestaurantSubtitleAccent = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kAccentColor,
);

TextStyle kRestaurantSubtitleDetail = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kWhiteColor,
);

TextStyle kRestaurantComment = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Nexa',
  color: kSecondaryColor,
);

TextStyle kRestaurantTags = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
  color: kTextColor,
);


TextStyle kRestaurantRating = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nexa',
    color: kWhiteColor);



TextStyle kHeaderTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nexa',
    color: kSecondaryColor);

TextStyle kHeaderSubtitle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kShadeColor,
);
TextStyle kSearchHint = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kShadeColor,
);

TextStyle kSectionTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
  color: kTextColor,
);
// special for you
TextStyle kCategoryTitle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  color: kTextColor,
);



TextStyle kSpecial = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
  color: kTextColor,
);
TextStyle kSectionRestaurantTitle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Nexa',
  color: kTextColor,
);


TextStyle kErrorText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Nexa',
  color: kPrimaryColor,
);

TextStyle kButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nexa',
    color: kSecondaryColor);
