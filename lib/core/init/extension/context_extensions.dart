import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get hlowValue => height * 0.01;
  double get hmediumValue => height * 0.02;
  double get hmediumxValue => height * 0.03;
  double get hhighValue5 => height * 0.05;
  double get hhighValue => height * 0.06;
  double get hveryHighValue => height * 0.1;
  double get hveryHighdValue => height * 0.15;
  double get hveryHighdxValue => height * 0.17;
  double get hveryHighValue2x => height * 0.2;
  double get hveryHighValue3x => height * 0.3;
  double get hveryHighValue4x => height * 0.4;
  double get hveryHighValue5x => height * 0.5;

  double get wlowValue => width * 0.01;
  double get wmediumValue => width * 0.02;
  double get whighValue4 => width * 0.04;
  double get whighValue5 => width * 0.05;
  double get whighValue => width * 0.06;
  double get wveryHighValue => width * 0.1;
  double get wveryHighValuedx => width * 0.15;
  double get wveryHighValue2x => width * 0.2;
  double get wveryHighValue3x => width * 0.3;
  double get wveryHighValue4x => width * 0.4;
  double get wveryHighValue5x => width * 0.5;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

// extension PaddingExtension on BuildContext {
//   EdgeInsets get paddingAllLow => EdgeInsets.all(hlowValue);
//   EdgeInsets get paddingAllDefault => EdgeInsets.all(hmediumValue);
//   EdgeInsets get paddingAllHigh => EdgeInsets.all(hhighValue);
//   EdgeInsets get paddingAllVeryHigh => EdgeInsets.all(hveryHighValue);

//   EdgeInsets get paddingHorizontalLow => EdgeInsets.symmetric(horizontal: hlowValue);
//   EdgeInsets get paddingHorizontalDefault => EdgeInsets.symmetric(horizontal: hmediumValue);
//   EdgeInsets get paddingHorizontalHigh => EdgeInsets.symmetric(horizontal: hhighValue);
//   EdgeInsets get paddingHorizontaVeryHigh => EdgeInsets.symmetric(horizontal: hveryHighValue);

//   EdgeInsets get paddingVerticalLow => EdgeInsets.symmetric(vertical: hlowValue);
//   EdgeInsets get paddingVerticalDefault => EdgeInsets.symmetric(vertical: hmediumValue);
//   EdgeInsets get paddingVerticalHigh => EdgeInsets.symmetric(vertical: hhighValue);
//   EdgeInsets get paddingVerticalVeryHigh => EdgeInsets.symmetric(vertical: hveryHighValue);

//   EdgeInsets get paddingRightLow => EdgeInsets.only(right: hlowValue);
//   EdgeInsets get paddingRightDefault => EdgeInsets.only(right: hmediumValue);
//   EdgeInsets get paddingRightHigh => EdgeInsets.only(right: hhighValue);
//   EdgeInsets get paddingRightVeryHigh => EdgeInsets.only(right: hveryHighValue);

//   EdgeInsets get paddingLeftLow => EdgeInsets.only(left: hlowValue);
//   EdgeInsets get paddingLeftDefault => EdgeInsets.only(left: hmediumValue);
//   EdgeInsets get paddingLeftHigh => EdgeInsets.only(left: hhighValue);
//   EdgeInsets get paddingLeftVeryHigh => EdgeInsets.only(left: hveryHighValue);

//   EdgeInsets get paddingTopLow => EdgeInsets.only(top: hlowValue);
//   EdgeInsets get paddingTopDefault => EdgeInsets.only(top: hmediumValue);
//   EdgeInsets get paddingTopHigh => EdgeInsets.only(top: hhighValue);
//   EdgeInsets get paddingTopVeryHigh => EdgeInsets.only(top: hveryHighValue);

//   EdgeInsets get paddingBottomLow => EdgeInsets.only(bottom: hlowValue);
//   EdgeInsets get paddingBottomDefault => EdgeInsets.only(bottom:hmediumValue);
//   EdgeInsets get paddingBottomHigh => EdgeInsets.only(bottom: hhighValue);
//   EdgeInsets get paddingBottomVeryHigh => EdgeInsets.only(bottom: hveryHighValue);
// }

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 250);
  Duration get durationDefault => const Duration(milliseconds: 500);
  Duration get durationHigh => const Duration(milliseconds: 1000);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
