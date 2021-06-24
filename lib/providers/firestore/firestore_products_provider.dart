import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_dream/config/api.dart' as ApiConfig;

class FirestoreProductsProvider {
  //

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference productsRef = FirebaseFirestore.instance
      .collection(ApiConfig.FIRESTORE_PRODUCTS_COLLECTION);

  Future<List<dynamic>> fetchProducts() async {
    //

    List<dynamic> list = [];

    var querySnapshot = await productsRef.get();

    for (var doc in querySnapshot.docs) {
      var rawData = doc.data();
      list.add(rawData);
    }

    return list;
  }

  //
}
