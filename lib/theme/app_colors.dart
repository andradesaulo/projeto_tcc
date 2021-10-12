import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get primaryOpaque;
  Color get secondary;
  Color get secondaryOpaque;
  Color get tertiary;
  Color get tertiaryOpaque;
  Color get quaternary;
  Color get quaternaryOpaque;
  Color get quinary;
  Color get quinaryOpaque;
  Color get appBarBackground;
  Color get appBarBottomOverlay;
  Color get circularProgressIndicator;
  Color get circularProgressIndicatorBackground;
  Color get deleteBtnBackground;
  Color get deleteBtnIcon;
  Color get dropdownMenuItemText;
  Color get editBtnBackground;
  Color get editBtnIcon;
  Color get elevatedBtnPrimary;
  Color get elevatedBtnSecondary;
  Color get elevatedBtnTextPrimary;
  Color get elevatedBtnTextSecondary;
  Color get error;
  Color get errorText;
  Color get iconWidget;
  Color get indicatorBPM;
  Color get indicatorOX;
  Color get inputBackground;
  Color get inputBorderEnabled;
  Color get inputBorderFocused;
  Color get inputBorderError;
  Color get inputCursor;
  Color get inputHelper;
  Color get inputHint;
  Color get inputLabel;
  Color get linearProgressIndicator;
  Color get linearProgressIndicatorBackground;
  Color get listTileTitle;
  Color get listTileSubtitle;
  Color get listTileArrow;
  Color get probSaudeBackground;
  Color get probSaudeDeleteIcon;
  Color get probSaudeText;
  Color get radioActive;
  Color get radioTileDefault;
  Color get radioTileSelected;
  Color get tabBarIndicator;
}

class AppColorsDefault extends AppColors {
  @override
  Color get primary => Color(0xff1c453f);

  @override
  Color get primaryOpaque => Color(0x331c453f);

  @override
  Color get secondary => Color(0xffededeb);

  @override
  Color get secondaryOpaque => Color(0x33ededeb);

  @override
  Color get tertiary => Color(0xffa48843);

  @override
  Color get tertiaryOpaque => Color(0xffD2C092);

  @override
  Color get quaternary => Color(0xff6d6359);

  @override
  Color get quaternaryOpaque => Color(0xffA69D94);

  @override
  Color get quinary => Color(0xff2b3648);

  @override
  Color get quinaryOpaque => Color(0xff7B8FAF);

  @override
  Color get error => Color(0xffE03D5A);

  @override
  Color get tabBarIndicator => tertiaryOpaque;

  @override
  Color get editBtnBackground => Colors.grey;

  @override
  Color get editBtnIcon => Colors.white;

  @override
  Color get circularProgressIndicatorBackground => Colors.transparent;

  @override
  Color get circularProgressIndicator => error;

  @override
  Color get deleteBtnBackground => error;

  @override
  Color get deleteBtnIcon => Colors.white;

  @override
  Color get appBarBackground => primary;

  @override
  Color get appBarBottomOverlay => Colors.transparent;

  @override
  Color get indicatorBPM => Colors.redAccent.shade400;

  @override
  Color get indicatorOX => Colors.lightBlue.shade300;

  @override
  Color get radioActive => secondary;

  @override
  Color get radioTileDefault => secondary;

  @override
  Color get radioTileSelected => primary;

  @override
  Color get inputBackground => secondary;

  @override
  Color get probSaudeText => Colors.white;

  @override
  Color get probSaudeDeleteIcon => Colors.white;

  @override
  Color get probSaudeBackground => primary;

  @override
  Color get listTileSubtitle => quaternary;

  @override
  Color get listTileTitle => primary;

  @override
  Color get listTileArrow => quaternary;

  @override
  Color get linearProgressIndicator => primary;

  @override
  Color get linearProgressIndicatorBackground => Colors.grey.shade200;

  @override
  Color get iconWidget => tertiary;

  @override
  Color get elevatedBtnPrimary => primary;

  @override
  Color get elevatedBtnSecondary => secondary;

  @override
  Color get elevatedBtnTextPrimary => secondary;

  @override
  Color get elevatedBtnTextSecondary => quaternary;

  @override
  Color get errorText => Colors.white;

  @override
  Color get inputBorderEnabled => quaternary;

  @override
  Color get inputBorderError => error;

  @override
  Color get inputBorderFocused => quaternary;

  @override
  Color get inputCursor => tertiary;

  @override
  Color get inputHelper => quaternary;

  @override
  Color get inputLabel => quaternary;

  @override
  Color get inputHint => quaternary;

  @override
  Color get dropdownMenuItemText => primary;

}