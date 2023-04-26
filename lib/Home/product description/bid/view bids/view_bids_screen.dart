import 'package:demo/Home/product%20description/bid/controller/place_bid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/theme.dart';
import '../../../../widgets/spaces.dart';

class ViewBidScreen extends StatelessWidget {
  ViewBidScreen({super.key});

  PlaceBidController placeBidController = Get.put(PlaceBidController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Row(
            children: [
              Spaces(height: 0, width: 0.2),
              Text(
                "View Bid",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.020,
                horizontal: MediaQuery.of(context).size.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spaces(height: 0.040, width: 0),
                Row(
                  children: [
                    Text(
                      "S. No.",
                      style: titleText,
                    ),
                    Spaces(height: 0, width: 0.25),
                    Text(
                      "Name",
                      style: titleText,
                    ),
                    Spacer(),
                    Text(
                      "Price",
                      style: titleText,
                    ),
                  ],
                ),
                Spaces(height: 0.040, width: 0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: placeBidController.yourBidList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.010),
                          height: MediaQuery.of(context).size.height * 0.060,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: MediaQuery.of(context).size.width *
                                      0.003)),
                          child: Row(
                            children: [
                              Text(
                                "${index + 1}",
                                style: titleText,
                              ),
                              Spacer(),
                              Text(
                                "${placeBidController.nameList[index]}",
                                style: titleText,
                              ),
                              Spacer(),
                              Text(
                                "\$${placeBidController.yourBidList[index]}",
                                style: titleText,
                              ),
                            ],
                          ),
                        ),
                        Spaces(height: 0.010, width: 0),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
