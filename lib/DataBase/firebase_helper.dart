import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseQuery {
  static FireBaseQuery get instanace => FireBaseQuery();
  getBanners() {
    return FirebaseFirestore.instance.collection('Banners').snapshots();
  }

  getRecommended() {
    return FirebaseFirestore.instance.collection('recommended').snapshots();
  }

  getTrendingSneakers() {
    return FirebaseFirestore.instance.collection('sneakers').snapshots();
  }

  getApparel() {
    return FirebaseFirestore.instance.collection('apparel').snapshots();
  }

  getAccessories() {
    return FirebaseFirestore.instance.collection('accessories').snapshots();
  }

  getElectronics() {
    return FirebaseFirestore.instance.collection('electronics').snapshots();
  }

  getCollectibles() {
    return FirebaseFirestore.instance.collection('collectibles').snapshots();
  }

  getCards() {
    return FirebaseFirestore.instance.collection('cards').snapshots();
  }

  getBricks() {
    return FirebaseFirestore.instance.collection('bricks').snapshots();
  }

  getBrands() {
    return FirebaseFirestore.instance.collection('brands').snapshots();
  }

  getFootwear() {
    return FirebaseFirestore.instance.collection('footwear').snapshots();
  }

  getSeasonal() {
    return FirebaseFirestore.instance.collection('seasonal').snapshots();
  }

  getMoreBrands() {
    return FirebaseFirestore.instance.collection('more brands').snapshots();
  }
}
