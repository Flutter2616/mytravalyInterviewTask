import 'import_files.dart';

class AppTheme {
  /// Theme
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: TextTheme(bodyLarge: textStyle(color: AppColors.black)),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.themeColor,
      elevation: 0,
    ),
    disabledColor: AppColors.greyColor,
    hintColor: AppColors.greyColor,
    primaryColor: AppColors.themeColor,
    dataTableTheme: DataTableThemeData(
      dividerThickness: 1,
      columnSpacing: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.white,
      elevation: 1,
      dividerColor: AppColors.black,
      headerBackgroundColor: AppColors.themeColor,
      rangePickerBackgroundColor: AppColors.themeColor,
      todayBackgroundColor: WidgetStateColor.resolveWith(
        (states) => AppColors.themeColor,
      ),
      todayBorder: BorderSide(color: AppColors.themeColor, width: 1),
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => AppColors.white,
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 1,
      backgroundColor: AppColors.black,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    ),
    useMaterial3: false,
  );
}

TextStyle textStyle({
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  return TextStyle(
    color: color ?? AppColors.black,
    backgroundColor: backgroundColor,
    fontSize: fontSize ?? 15,
    fontWeight: fontWeight ?? FontWeight.w400,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  );
}

enum NavigationType { Push, PushReplecement, RemoveAllPush }

void screenNavigation({NavigationType? navigationType, Widget? screen}) {
  if (screen != null) {
    switch (navigationType) {
      case NavigationType.PushReplecement:
        Get.off(screen);
        break;
      case NavigationType.RemoveAllPush:
        Get.offAll(screen);
        break;
      default:
        Get.to(screen);
    }
  } else {
    Get.back();
  }
}
