// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/DataBase/firebase_helper.dart';
import 'package:demo/Home/controller/home_controller.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/shape.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/brandLayout.dart';
import '../widgets/cards.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  List<String> itemList = [
    "Sneakers",
    "Shoes",
    "Appareal",
    "Electronics",
    "Tranding Collectibles",
    "Accessories",
    "Cards"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.070,
                width: MediaQuery.of(context).size.width * 1,
                color: Color(0xFFf4f2f0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Spaces(height: 0, width: 0.0150),
                        Text(
                          itemList[index],
                          style: titleText,
                        ),
                        Spaces(height: 0, width: 0.0150),
                      ],
                    );
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getBanners(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.37,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        child: Center(
                          child: Icon(Icons.image),
                        ),
                      ),
                    );
                  }

                  return Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 1,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: homeController.pageController,
                          onPageChanged: homeController.onPageChnaged,
                          itemCount:
                              snapshot.data!.docChanges[0].doc['Images'].length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            snapshot.data!.docChanges[0]
                                                .doc['Images'][index],
                                          )),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) => Center(
                                      child: Icon(Icons.error),
                                    ),
                                placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                imageUrl: snapshot
                                    .data!.docChanges[0].doc['Images'][index]);
                          },
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.6,
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.030,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: ListView.builder(
                              itemCount: snapshot
                                  .data!.docChanges[0].doc['Images'].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(() => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.010,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.010,
                                        decoration: BoxDecoration(
                                            color: homeController.currentPage ==
                                                    index
                                                ? Colors.grey[600]
                                                : Colors.white),
                                      ),
                                    ));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Recommended For You",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
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
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getBrands(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Popular Brands",
                              style: headline,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Spaces(height: 0.04, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.docChanges[0].doc['images'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: BrandLayout(
                                      image: snapshot.data!.docChanges[0]
                                          .doc['images'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getTrendingSneakers(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Trending Sneakers",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['Trending Sneakers'].length >
                                  4
                              ? 4
                              : snapshot.data!.docChanges[0]
                                  .doc['Trending Sneakers'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                        product: snapshot.data!.docChanges[0]
                                            .doc['Trending Sneakers'][index])),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.023),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://images-cs.stockx.com/v3/assets/blt818b0c67cf450811/blt21ef38e5a3477d1d/6446898a31281610d8ef9e0f/Nike-Dunks-Under-\$100-Evergreen-assetSecondaryB.png?format=jpg&auto=webp&height=438"))),
                ),
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getFootwear(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Popular Footwear Brands",
                              style: headline,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Spaces(height: 0.04, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.docChanges[0].doc['images'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: BrandLayout(
                                      image: snapshot.data!.docChanges[0]
                                          .doc['images'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getApparel(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Featured Appareal",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['appareal'].length >
                                  4
                              ? 4
                              : snapshot
                                  .data!.docChanges[0].doc['appareal'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['appareal'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getAccessories(),
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Featured Accessories",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['accessories'].length >
                                  4
                              ? 4
                              : snapshot.data!.docChanges[0].doc['accessories']
                                  .length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['accessories'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.023),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://images-cs.stockx.com/v3/assets/blt818b0c67cf450811/blt6218173920a5d08f/643437348708a0114b58771e/SecondaryA_(1).png?format=jpg&auto=webp&height=438"))),
                ),
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getElectronics(),
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Electronic Spotlight",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['electronics'].length >
                                  4
                              ? 4
                              : snapshot.data!.docChanges[0].doc['electronics']
                                  .length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['electronics'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getSeasonal(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Seasonal Favorites",
                              style: headline,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Spaces(height: 0.04, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.docChanges[0].doc['images'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: BrandLayout(
                                      image: snapshot.data!.docChanges[0]
                                          .doc['images'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getCollectibles(),
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Collectibles staff Picks",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['collectibles'].length >
                                  4
                              ? 4
                              : snapshot.data!.docChanges[0].doc['collectibles']
                                  .length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['collectibles'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getCards(),
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Featured Trading Cards",
                              style: headline,
                            ),
                            Spaces(height: 0, width: 0.030),
                            CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.0120,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.question_mark,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height *
                                      0.020,
                                )),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0]
                                      .doc['trading cards'].length >
                                  4
                              ? 4
                              : snapshot.data!.docChanges[0]
                                  .doc['trading cards'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['trading cards'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.023),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://images-cs.stockx.com/v3/assets/blt818b0c67cf450811/blt867fac8f53df77e6/64415c159074ca2928c7a7cd/Xbox-Mini-Fridge_SecondaryB.png?format=jpg&auto=webp&height=438"))),
                ),
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getMoreBrands(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Browse More Brands",
                              style: headline,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Spaces(height: 0.04, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              snapshot.data!.docChanges[0].doc['images'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: BrandLayout(
                                      image: snapshot.data!.docChanges[0]
                                          .doc['images'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spaces(height: 0.04, width: 0),
              StreamBuilder<QuerySnapshot>(
                stream: FireBaseQuery.instanace.getBricks(),
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
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Center(
                        child: Icon(Icons.image),
                      ),
                    );
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
                              "Hot Beardbricks",
                              style: headline,
                            ),
                            const Spacer(),
                            Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green[900],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Spaces(height: 0.02, width: 0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docChanges[0].doc['bricks']
                                      .length >
                                  4
                              ? 4
                              : snapshot
                                  .data!.docChanges[0].doc['bricks'].length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Spaces(height: 0, width: 0.020),
                                InkWell(
                                    onTap: () {},
                                    child: ProductDesign(
                                      product: snapshot.data!.docChanges[0]
                                          .doc['bricks'][index],
                                    )),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
