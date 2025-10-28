import 'package:mytravaly_task/model/hotel_model.dart';
import 'package:mytravaly_task/utils/import_files.dart';
import 'package:mytravaly_task/utils/spacers.dart';
import 'package:mytravaly_task/view/home/home_controller.dart';
import 'package:mytravaly_task/view/home/hotel_detail_screen.dart';
import 'package:mytravaly_task/view/home/search_screen.dart';
import 'package:mytravaly_task/view/login/login_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.themeColor,
        onPressed: () {
          screenNavigation(screen: SearchScreen());
        },
        child: Icon(Icons.search, color: AppColors.white, size: 28.sp),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        global: true,
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.themeColor,
                          radius: 20,
                          backgroundImage:
                              Storage.storage.userPhoto.isNotEmpty
                                  ? NetworkImage(Storage.storage.userPhoto)
                                  : null,child: !Storage.storage.userPhoto.isNotEmpty
                            ? Icon(Icons.person,size: 18,color: AppColors.white)
                            : null,
                        ),
                        Space.w8,
                        Expanded(
                          child: Text(
                            "Hi\n${Storage.storage.userName}",
                            style: textStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          (Get.isRegistered<AuthController>()
                              ? Get.find<AuthController>()
                              : Get.put(AuthController()))
                              .logout();
                        },child: Icon(Icons.logout, color: AppColors.themeColor, size: 25.sp)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (controller.isLoading &&
                            controller.hotelList.isEmpty) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return RefreshIndicator(
                          onRefresh: controller.refreshList,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount:
                                controller.hotelList.length +
                                (controller.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index >= controller.hotelList.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
            
                              final HotelModel hotel =
                                  controller.hotelList[index];
            
                              return HotelCard(
                                hotel: hotel,
                                onTap: () {
                                  screenNavigation(
                                    screen: HotelDetailScreen(hotel: hotel),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final HotelModel hotel;
  final VoidCallback onTap;

  const HotelCard({super.key, required this.hotel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        shadowColor: AppColors.themeColor.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Stack(
                children: [
                  Image.network(
                    hotel.propertyImage,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => Container(
                          height: 180,
                          color: AppColors.greyColor.withOpacity(0.2),
                          child: const Icon(Icons.image_not_supported_outlined),
                        ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            hotel.googleReview.data.overallRating
                                .toStringAsFixed(1),
                            style: textStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel name
                  Text(
                    hotel.propertyName,
                    style: textStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: AppColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.themeColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${hotel.propertyAddress.city}, ${hotel.propertyAddress.state}",
                          style: textStyle(
                            fontSize: 13,
                            color: AppColors.greyColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Wrap(
                    spacing: 6,
                    children: [
                      if (hotel.propertyPoliciesAndAmmenities.data.freeWifi)
                        _buildChip("Free WiFi"),
                      if (hotel.propertyPoliciesAndAmmenities.data.payAtHotel)
                        _buildChip("Pay at Hotel"),
                      if (hotel
                          .propertyPoliciesAndAmmenities
                          .data
                          .freeCancellation)
                        _buildChip("Free Cancellation"),
                      if (hotel
                          .propertyPoliciesAndAmmenities
                          .data
                          .coupleFriendly)
                        _buildChip("Couple Friendly"),
                    ],
                  ),

                  const SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${hotel.staticPrice.currencySymbol}${hotel.staticPrice.amount.toStringAsFixed(0)} / night",
                        style: textStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                          fontSize: 16,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                        label: Text(
                          "View Details",
                          style: textStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: textStyle(
          fontSize: 12,
          color: AppColors.themeColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
