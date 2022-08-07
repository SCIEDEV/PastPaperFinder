import 'package:flutter/material.dart';

class MColors {
  MColors(this.isDark);
  bool isDark = false;
  Color get primary => isDark ? Colors.white : Colors.black;
  Color get secondary => isDark ? Colors.grey.shade400 : Colors.grey.shade600;
  Color get pageBackground =>
      isDark ? Colors.grey.shade900 : Colors.grey.shade50;
  Color get buttonBackground => isDark ? Colors.grey[850]! : Colors.white;
  Color get buttonBorder =>
      isDark ? Colors.grey.shade800 : Colors.grey.shade300;
  Color get disabledButtonBackground =>
      isDark ? Colors.grey.shade800 : Colors.grey.shade300;
  Color get disabledButtonBorder =>
      isDark ? Colors.grey.shade700 : Colors.grey.shade400;
  Color get disabledButtonText =>
      isDark ? Colors.grey.shade700 : Colors.grey.shade500;
  Color get sliderThumb => isDark ? Colors.grey.shade800 : Colors.white;
  Color get sliderTrack => isDark ? Colors.grey[850]! : Colors.grey.shade200;
  Color get sliderTrackTickMark =>
      isDark ? Colors.grey.shade700 : Colors.grey.shade400;
  Color get errorBadgeBackground =>
      isDark ? Colors.red.shade300.withAlpha(32) : Colors.red.shade50;
  Color get errorBadgeText => isDark ? Colors.red.shade50 : Colors.red.shade900;
  Color get badgeBackground =>
      isDark ? Colors.orange.shade300.withAlpha(32) : Colors.orange.shade50;
  Color get badgeText =>
      isDark ? Colors.orange.shade50 : Colors.orange.shade900;
  Color get sideBarIcon => isDark ? Colors.grey.shade600 : Colors.grey.shade500;
  Color get accentText =>
      isDark ? Colors.orange.shade200 : Colors.orange.shade900;
  Color get tableHeadingBackground =>
      isDark ? Colors.grey.shade800 : Colors.grey.shade100;
  Color get secondaryIcon =>
      isDark ? Colors.grey.shade600 : Colors.grey.shade400;
  Color get destructive => isDark ? Colors.red.shade400 : Colors.red;
  Color get errorBannerBackground =>
      isDark ? Colors.red.shade300.withAlpha(32) : Colors.red.shade50;
  Color get errorBannerBorder =>
      isDark ? Colors.red.shade300.withAlpha(32) : Colors.red.shade100;
}
