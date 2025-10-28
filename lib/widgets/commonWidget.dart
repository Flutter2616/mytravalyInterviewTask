import 'package:intl/intl.dart';

import '../utils/import_files.dart';

class Loader {
  static Future showLoading() {
    return Get.dialog(
      Container(
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.themeColor),
        ),
      ),
    );
  }

  static CircularProgressIndicator loadingWidget() {
    return CircularProgressIndicator(color: AppColors.themeColor);
  }
}

Widget click({void Function()? onTap, required Widget child}) {
  return InkWell(onTap: onTap, child: child);
}

Widget ratingView(int activeIndex, {void Function()? onTap, double? starSize}) {
  return Row(
    children:
        [1, 2, 3, 4, 5]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Icon(
                  Icons.star,
                  size: starSize ?? 16,
                  color: e <= activeIndex ? Colors.amber : AppColors.greyColor,
                ),
              ),
            )
            .toList(),
  );
}

void showMassage(String msg) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: textStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.black,
        ),
      ),
      backgroundColor: AppColors.greyColor,
    ),
  );
}

Widget titleWithSeeAll({
  required String title,
  required void Function()? onTap,
  final double titleSize = 20,
  final double seeAllSize = 14,
}) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: textStyle(fontSize: titleSize, fontWeight: FontWeight.w600),
      ),
      Spacer(),
      GestureDetector(
        onTap: onTap,
        child: Text(
          "see_all".tr,
          style: textStyle(
            fontSize: seeAllSize,
            fontWeight: FontWeight.w500,
            color: AppColors.themeColor,
          ),
        ),
      ),
    ],
  );
}
