import 'package:mytravaly_task/model/hotel_model.dart';
import 'package:mytravaly_task/utils/import_files.dart';

class HotelDetailScreen extends StatelessWidget {
  final HotelModel hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.themeColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                hotel.propertyName,
                style: textStyle(color: AppColors.white, fontSize: 16),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    hotel.propertyImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.greyColor.withOpacity(0.2),
                      child: const Icon(Icons.image_not_supported,
                          size: 60, color: Colors.grey),
                    ),
                  ),
                  Container(
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + Rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotel.propertyName,
                          style: textStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: List.generate(
                          hotel.propertyStar,
                              (index) => const Icon(Icons.star,
                              color: Colors.amber, size: 20),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${hotel.propertyAddress.street}, ${hotel.propertyAddress.city}, ${hotel.propertyAddress.state}',
                          style: textStyle(color: AppColors.greyColor, fontSize: 13),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Price & Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${hotel.staticPrice.currencySymbol}${hotel.staticPrice.amount.toStringAsFixed(0)} / night',
                        style: textStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (hotel.googleReview.reviewPresent)
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '${hotel.googleReview.data.overallRating} (${hotel.googleReview.data.totalUserRating})',
                              style: textStyle(color: AppColors.black, fontSize: 13),
                            ),
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Divider(color: AppColors.greyColor.withOpacity(0.4)),
                  const SizedBox(height: 10),

                  // Amenities
                  Text(
                    'Amenities',
                    style: textStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _buildAmenities(),
                  ),

                  const SizedBox(height: 20),
                  Divider(color: AppColors.greyColor.withOpacity(0.4)),

                  Text(
                    'Policies',
                    style: textStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPolicy(
                      'Cancellation Policy',
                      hotel.propertyPoliciesAndAmmenities.data.cancelPolicy),
                  _buildPolicy(
                      'Refund Policy',
                      hotel.propertyPoliciesAndAmmenities.data.refundPolicy),
                  _buildPolicy(
                      'Damage Policy',
                      hotel.propertyPoliciesAndAmmenities.data.damagePolicy),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(0, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Book Now',
            style: textStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAmenities() {
    final data = hotel.propertyPoliciesAndAmmenities.data;
    final List<Map<String, dynamic>> amenities = [
      {'title': 'Free Wifi', 'icon': Icons.wifi, 'val': data.freeWifi},
      {'title': 'Free Cancellation', 'icon': Icons.cancel_outlined, 'val': data.freeCancellation},
      {'title': 'Pay at Hotel', 'icon': Icons.payments, 'val': data.payAtHotel},
      {'title': 'Couple Friendly', 'icon': Icons.favorite, 'val': data.coupleFriendly},
      {'title': 'Pets Allowed', 'icon': Icons.pets, 'val': data.petsAllowed},
      {'title': 'Child Friendly', 'icon': Icons.child_care, 'val': data.suitableForChildren},
    ];

    return amenities
        .where((a) => a['val'] == true)
        .map(
          (a) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(a['icon'], size: 16, color: AppColors.themeColor),
            const SizedBox(width: 6),
            Text(a['title'],
                style: textStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13)),
          ],
        ),
      ),
    )
        .toList();
  }

  Widget _buildPolicy(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15)),
          const SizedBox(height: 4),
          Text(
            value.isNotEmpty ? value : 'No details available',
            style: textStyle(color: AppColors.greyColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}