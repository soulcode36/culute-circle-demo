import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Home/product%20description/bid/place_bid_screen.dart';
import 'package:demo/Home/product%20description/bid/view%20ask/view_ask_screen.dart';
import 'package:demo/Home/product%20description/bid/view%20bids/view_bids_screen.dart';
import 'package:demo/Home/product%20description/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../DataBase/firebase_helper.dart';
import '../../theme/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/shape.dart';
import '../../widgets/spaces.dart';

class ProductDescriptionScreen extends StatelessWidget {
  ProductDescriptionScreen({super.key, required this.product});

  ProductController productController = Get.put(ProductController());
  dynamic product;
  @override
  Widget build(BuildContext context) {
    print(product);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Row(
            children: [
              Spacer(),
              Image.asset(
                "assets/images/stockx.png",
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: appTheme.buttonColor,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.020,
                horizontal: MediaQuery.of(context).size.width * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => PlaceBid());
                      },
                      child: Buttons(
                          height: 0.060,
                          width: 0.45,
                          radius: 2,
                          child: Center(
                            child: Text(
                              "Place Bid",
                              style: titleText,
                            ),
                          ),
                          color: Colors.white,
                          borderColor: appTheme.buttonColor,
                          borderWidth: 0.003),
                    ),
                    Spacer(),
                    Buttons(
                        height: 0.060,
                        width: 0.45,
                        radius: 2,
                        child: Center(
                          child: Text(
                            "Buys for  ${product['price']}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.5),
                          ),
                        ),
                        color: appTheme.primaryColor,
                        borderColor: Colors.white,
                        borderWidth: 0.003),
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                Center(
                  child: Text(
                    "Sell for ${product['price']} or Ask More",
                    style: GoogleFonts.montserrat(
                        color: appTheme.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Spaces(height: 0.020, width: 0),
                Divider(
                  thickness: MediaQuery.of(context).size.width * 0.003,
                  color: appTheme.buttonColor,
                ),
                Spaces(height: 0.020, width: 0),
                Center(
                  child: Text(
                    "${product['title']}",
                    maxLines: 2,
                    style: headline,
                  ),
                ),
                Spaces(height: 0.020, width: 0),
                Obx(
                  () => CachedNetworkImage(
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(product['images']
                                  [productController.selectedimg.value]),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.add_circle_outline_outlined),
                              Spaces(height: 0, width: 0.020),
                              Icon(Icons.favorite_border),
                              Spaces(height: 0, width: 0.020),
                              Icon(Icons.share)
                            ],
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error),
                          ),
                      placeholder: (context, url) => Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration:
                                  BoxDecoration(color: Colors.grey[100]),
                              child: Center(
                                child: Icon(Icons.image),
                              ),
                            ),
                          ),
                      imageUrl: product['images']
                          [productController.selectedimg.value]),
                ),
                Spaces(height: 0.040, width: 0),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.090,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView.builder(
                    itemCount: product['images'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Spaces(height: 0, width: 0.020),
                          InkWell(
                            onTap: () {
                              productController.selectedimg.value = index;
                            },
                            child: CachedNetworkImage(
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.090,
                                    width: MediaQuery.of(context).size.width *
                                        0.250,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.002),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                product['images'][index]))),
                                  );
                                },
                                errorWidget: (context, url, error) => Center(
                                      child: Icon(Icons.error),
                                    ),
                                placeholder: (context, url) => Center(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.17,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100]),
                                        child: Center(
                                          child: Icon(Icons.image),
                                        ),
                                      ),
                                    ),
                                imageUrl: product['images'][index]),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Spaces(height: 0.020, width: 0),
                Buttons(
                    height: 0.070,
                    width: 1,
                    radius: 2,
                    child: Row(
                      children: [
                        Spaces(height: 0, width: 0.030),
                        ImageIcon(
                          AssetImage(
                            "assets/images/thunder.png",
                          ),
                          color: Colors.yellow,
                        ),
                        Spaces(height: 0, width: 0.030),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "This product is selling fast",
                              style: titleText,
                            )
                          ],
                        )
                      ],
                    ),
                    color: Color.fromARGB(255, 253, 248, 248),
                    borderColor: Colors.yellow,
                    borderWidth: 0.002),
                Spaces(height: 0.020, width: 0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Last Sale :\n", style: segmentText),
                      TextSpan(
                          text: "${product['last sale']}", style: titleText)
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.red[900],
                      size: MediaQuery.of(context).size.height * 0.046,
                    ),
                    Text(
                      "\$47(20%)",
                      style: GoogleFonts.montserrat(
                          color: Colors.red[900],
                          fontWeight: FontWeight.w700,
                          fontSize: 14.5),
                    )
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ViewAskScreen());
                      },
                      child: Buttons(
                          height: 0.060,
                          width: 0.30,
                          radius: 2,
                          child: Center(
                            child: Text(
                              "View Asks",
                              style: segmentText,
                            ),
                          ),
                          color: Colors.white,
                          borderColor: appTheme.buttonColor,
                          borderWidth: 0.003),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => ViewBidScreen());
                      },
                      child: Buttons(
                          height: 0.060,
                          width: 0.30,
                          radius: 2,
                          child: Center(
                            child: Text(
                              "View Bids",
                              style: segmentText,
                            ),
                          ),
                          color: Colors.white,
                          borderColor: appTheme.buttonColor,
                          borderWidth: 0.003),
                    ),
                    Spacer(),
                    Buttons(
                        height: 0.060,
                        width: 0.3,
                        radius: 2,
                        child: Center(
                          child: Text(
                            "Views Sales",
                            style: segmentText,
                          ),
                        ),
                        color: Colors.white,
                        borderColor: appTheme.buttonColor,
                        borderWidth: 0.003),
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  title: Row(
                    children: [
                      ImageIcon(
                        AssetImage(
                          "assets/images/checked.png",
                        ),
                        color: Colors.black,
                      ),
                      Spaces(height: 0, width: 0.010),
                      Text(
                        "StockX Verified",
                        style: titleText,
                      ),
                      Spaces(height: 0, width: 0.2),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Condition :  ", style: caption),
                        TextSpan(
                            text: "New",
                            style: GoogleFonts.montserrat(
                                fontSize: 11.4,
                                color: appTheme.primaryColor.withOpacity(0.9),
                                fontWeight: FontWeight.w600))
                      ]))
                    ],
                  ),
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              "StockX Verified is our own designation and means that we inspect every item, every time.",
                          style: caption),
                      TextSpan(
                          text: ' Learn More',
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              fontSize: 11.4,
                              color: appTheme.primaryColor.withOpacity(0.9),
                              fontWeight: FontWeight.w600))
                    ])),
                    Spaces(height: 0.020, width: 0)
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  title: Row(
                    children: [
                      ImageIcon(
                        AssetImage(
                          "assets/images/shield.png",
                        ),
                        color: Colors.black,
                      ),
                      Spaces(height: 0, width: 0.010),
                      Text(
                        "Our Promise",
                        style: titleText,
                      ),
                    ],
                  ),
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              "StockX Verified is our own designation and means that we inspect every item, every time.",
                          style: caption),
                      TextSpan(
                          text: ' Learn More',
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              fontSize: 11.4,
                              color: appTheme.primaryColor.withOpacity(0.9),
                              fontWeight: FontWeight.w600))
                    ])),
                    Spaces(height: 0.020, width: 0)
                  ],
                ),
                Spaces(height: 0.04, width: 0),
                StreamBuilder<QuerySnapshot>(
                  stream: FireBaseQuery.instanace.getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.020),
                          child: Row(
                            children: [
                              Text(
                                "Related Products",
                                style: headline,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        Spaces(height: 0.02, width: 0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot
                                .data!.docChanges[0].doc['Recommended'].length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Spaces(height: 0, width: 0.020),
                                  InkWell(
                                      onTap: () {},
                                      child: ProductDesign(
                                          product: snapshot.data!.docChanges[0]
                                              .doc['Recommended'][index])),
                                ],
                              );
                            },
                          ),
                        ),
                        Spaces(height: 0.020, width: 0),
                        Divider(
                          thickness: MediaQuery.of(context).size.width * 0.002,
                          color: Colors.black,
                        ),
                      ],
                    );
                  },
                ),
                Spaces(height: 0.020, width: 0),
                Text(
                  "Product Deatils",
                  style: titleText,
                ),
                Spaces(height: 0.040, width: 0),
                Row(
                  children: [
                    Text(
                      "Style",
                      style: descriptionText,
                    ),
                    Spacer(),
                    Text(
                      "FD2596-600",
                      style: titleText,
                    )
                  ],
                ),
                Spaces(height: 0.040, width: 0),
                Row(
                  children: [
                    Text(
                      "Colorway",
                      style: descriptionText,
                    ),
                    Spacer(),
                    Text(
                      "ATMOSPHERE/WHITE/MUSLIN/SAIL",
                      style: titleText,
                    )
                  ],
                ),
                Spaces(height: 0.040, width: 0),
                Row(
                  children: [
                    Text(
                      "Retail Price",
                      style: descriptionText,
                    ),
                    Spacer(),
                    Text(
                      "\$180",
                      style: titleText,
                    )
                  ],
                ),
                Spaces(height: 0.040, width: 0),
                Row(
                  children: [
                    Text(
                      "Release Date",
                      style: descriptionText,
                    ),
                    Spacer(),
                    Text(
                      "04/22/2023",
                      style: titleText,
                    )
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                Divider(
                  thickness: MediaQuery.of(context).size.width * 0.002,
                  color: Colors.black,
                ),
                Text(
                  "Product Description : ",
                  style: titleText,
                ),
                Spaces(height: 0.020, width: 0),
                Text(
                  """${product['description']}""",
                  style: segmentText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
