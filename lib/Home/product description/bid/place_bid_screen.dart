import 'package:demo/Home/product%20description/bid/controller/place_bid_controller.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/buttons.dart';

class PlaceBid extends StatelessWidget {
  PlaceBid({super.key});

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
                "Place Bid",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.020,
              horizontal: MediaQuery.of(context).size.width * 0.020),
          child: Form(
            key: placeBidController.bidKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place Your Bid : ",
                    style: titleText,
                  ),
                  Spaces(height: 0.040, width: 0),
                  TextFormField(
                    controller: placeBidController.name,
                    validator: placeBidController.nameValidator,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      labelStyle: titleText,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.primaryColor)),
                      border: const OutlineInputBorder(),
                      errorStyle: TextStyle(color: appTheme.primaryColor),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Spaces(height: 0.040, width: 0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ask Bid: ",
                      style: titleText,
                    ),
                  ),
                  Spaces(height: 0.020, width: 0),
                  Buttons(
                      height: 0.085,
                      width: 0.45,
                      radius: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Obx(
                            () => Text(
                              placeBidController.askBid.value.toString(),
                              style: titleText,
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  placeBidController.increaseAsk();
                                },
                                child: Icon(
                                  Icons.arrow_drop_up_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.040,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  placeBidController.decreaseAsk();
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: MediaQuery.of(context).size.height *
                                      0.040,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      color: Colors.transparent,
                      borderColor: appTheme.buttonColor,
                      borderWidth: 0.003),
                  Spaces(height: 0.040, width: 0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Your Bid: ",
                      style: titleText,
                    ),
                  ),
                  Spaces(height: 0.020, width: 0),
                  Buttons(
                      height: 0.085,
                      width: 0.45,
                      radius: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Obx(
                            () => Text(
                              placeBidController.yourBid.value.toString(),
                              style: titleText,
                            ),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  placeBidController.increaseYourBid();
                                },
                                child: Icon(
                                  Icons.arrow_drop_up_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.040,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  placeBidController.decreaseYourBid();
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: MediaQuery.of(context).size.height *
                                      0.040,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                      color: Colors.transparent,
                      borderColor: appTheme.buttonColor,
                      borderWidth: 0.003),
                  Spaces(height: 0.040, width: 0),
                  InkWell(
                    onTap: () {
                      placeBidController.checkBid();
                    },
                    child: Buttons(
                        height: 0.060,
                        width: 0.5,
                        radius: 12,
                        child: Center(
                          child: Text(
                            "Place Bid",
                            style: categoryText,
                          ),
                        ),
                        color: appTheme.primaryColor.withOpacity(0.9),
                        borderColor: Colors.transparent,
                        borderWidth: 0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
