import 'package:demo/search/controller/search_controller.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.060,
                horizontal: MediaQuery.of(context).size.height * 0.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Buttons(
                  height: 0.070,
                  width: 1,
                  radius: 60,
                  color: Colors.blueGrey.withOpacity(0.2),
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.030),
                      child: TextFormField(
                        controller: searchController.search,
                        decoration: InputDecoration(
                            hintText: 'Search your favourites',
                            border: InputBorder.none,
                            suffixIcon: InkWell(
                                onTap: () {
                                  searchController
                                      .searchItem(searchController.search.text);
                                },
                                child: Icon(Icons.search_outlined))),
                      ),
                    ),
                  ),
                ),
                Spaces(height: 0.030, width: 0),
                Obx(() => Text(
                      'Searched result is : ${searchController.searchResult.value}',
                      style: segmentText,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
