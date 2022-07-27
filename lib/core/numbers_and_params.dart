import 'package:universal_platform/universal_platform.dart';

bool isMobile = UniversalPlatform.isAndroid || UniversalPlatform.isIOS;

double appBarHeight = 120;
double appBarMainLogoHeight = 34.67;
double appBarMainLogoWidth = 64;
double appBarMainLogoHorizontalPadding = 8;
double appBarVerticalPadding = 36;
double appBarHorizontalPadding = 16;
double outlinedButtonHorizontalPadding = 10;
double outlinedButtonFixedHeight = 48;
double languageButtonFlagHeight = 20;
double languageButtonFlagWidth = 28;
double pageSidePadding = isMobile ? 16 : 360;

// font sizes
double outlinedButtonFontSize = 14;
