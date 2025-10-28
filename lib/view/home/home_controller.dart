import 'package:mytravaly_task/model/hotel_model.dart';
import 'package:mytravaly_task/model/search_model.dart';
import 'package:mytravaly_task/utils/import_files.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  TextEditingController txtSearch= TextEditingController();

  List<HotelModel> hotelList = [];
  SearchModel? searchData;
  bool isLoading = false;
  bool hasMore = true;
  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    getHotelList(isInitialLoad: true);

    // Setup scroll listener for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        loadMore();
      }
    });
  }

  Future<void> getHotelList({bool isInitialLoad = false}) async {
    if (isLoading) return; // Prevent duplicate requests

    if (isInitialLoad) {
      isLoading = true;
      hasMore = true;
      hotelList.clear();
      update();
    } else {
      if (!hasMore) return;
      isLoading = true;
      update();
    }

    try {
      var jsonRes = await apiCall(isLoaderShow: false,
        body: {
          "action": ApiUrl.popularStayAction,
          "popularStay": {
            "limit": limit,
            "entityType": "Any",
            "filter": {
              "searchType": "byRandom",
              "searchTypeInfo": {
                "country": "India",
                "state": "Jharkhand",
                "city": "Jamshedpur",
              },
            },
            "currency": "INR",
          },
        },
        isPassVisitorToken: true,
      );

      if (jsonRes['status'] == true) {
        List<dynamic> newList = jsonRes['data'] ?? [];

        // If less than limit, no more data
        if (newList.isEmpty || newList.length < limit) {
          hasMore = false;
        }

        // Append data to list
        hotelList.addAll(newList.map((e) => HotelModel.fromJson(e)).toList());
      } else {
        hasMore = false;
      }
    } catch (e) {
      showMassage(ApiUrl.errorMsg);
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> searchHotel() async {
    try {
      if(txtSearch.text.isNotEmpty)
        {

      var jsonRes = await apiCall(isLoaderShow: true,
        body: {
          "action":ApiUrl.searchAutoCompleteAction,
          "searchAutoComplete":{
            "inputText":txtSearch.text,
            "searchType":[
              "byCity",
              "byState",
              "byCountry",
              "byRandom",
              "byPropertyName" // you can put any searchType from the list
            ],
            "limit": 10
          }
        },
        isPassVisitorToken: true,
      );

      if (jsonRes['status'] == true) {
       searchData=SearchModel.fromJson(jsonRes['data']);
      } else {
       throw '';
      }
        }else
          {
            searchData=null;
          }
    } catch (e) {
      showMassage(ApiUrl.errorMsg);
    } finally {
      update();
    }
  }

  /// Triggered when scroll reaches bottom
  void loadMore() {
    if (!isLoading && hasMore) {
      getHotelList();
    }
  }

  /// Pull-to-refresh
  Future<void> refreshList() async {
    await getHotelList(isInitialLoad: true);
  }

  @override
  void onClose() {
    scrollController.dispose();
    txtSearch.dispose();
    super.onClose();
  }
}
