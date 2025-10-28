import 'package:mytravaly_task/utils/import_files.dart';
import 'package:mytravaly_task/view/home/home_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          appBar: AppBar(
            backgroundColor: AppColors.themeColor,
            elevation: 0,
            title: Text(
              "Search Hotels",
              style: textStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.txtSearch,
                          onChanged: (value) {
                            if(value.isEmpty)
                              {
                                controller.searchData=null;
                                controller.update();
                              }
                          },
                          decoration: InputDecoration(
                            hintText: "Search by city, hotel or country...",
                            hintStyle: textStyle(
                              color: AppColors.greyColor,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: AppColors.greyColor.withOpacity(0.1),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (_) => controller.searchHotel(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.searchHotel();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    "Search Results",
                    style: textStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Expanded(
                    child: controller.searchData == null
                        ? Center(
                      child: Text(
                        "Start typing to search hotels...",
                        style: textStyle(
                            color: AppColors.greyColor, fontSize: 14),
                      ),
                    )
                        : controller.searchData!.present == false
                        ? Center(
                      child: Text(
                        "No results found.",
                        style: textStyle(
                            color: AppColors.greyColor, fontSize: 14),
                      ),
                    )
                        : ListView(
                      padding:
                      const EdgeInsets.symmetric(vertical: 6),
                      children: [
                        _buildSection(
                          title: "By Property Name",
                          list: controller
                              .searchData!
                              .autoCompleteList
                              .byPropertyName
                              .listOfResult
                              .map((e) => e.valueToDisplay)
                              .toList(),
                        ),
                        _buildSection(
                          title: "By Street",
                          list: controller
                              .searchData!
                              .autoCompleteList
                              .byStreet
                              .listOfResult
                              .map((e) => e.valueToDisplay)
                              .toList(),
                        ),
                        _buildSection(
                          title: "By City",
                          list: controller
                              .searchData!
                              .autoCompleteList
                              .byCity
                              .listOfResult
                              .map((e) => e.valueToDisplay)
                              .toList(),
                        ),
                        _buildSection(
                          title: "By Country",
                          list: controller
                              .searchData!
                              .autoCompleteList
                              .byCountry
                              .listOfResult
                              .map((e) => e.valueToDisplay)
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> list,
  }) {
    if (list.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: textStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColors.themeColor,
          ),
        ),
        const SizedBox(height: 6),
        ...list.map(
              (item) => Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              leading: Icon(Icons.location_on_rounded,
                  color: AppColors.themeColor),
              title: Text(
                item,
                style: textStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              onTap: () {
                // Optional: Navigate or update filter
                showMassage("You selected: $item");
              },
            ),
          ),
        ),
      ],
    );
  }
}
