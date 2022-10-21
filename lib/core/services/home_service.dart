import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryColectionRef =
      FirebaseFirestore.instance.collection("Categories");
  final CollectionReference _productColectionRef =
      FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryColectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProduct() async {
    var value = await _productColectionRef.get();
    return value.docs;
  }
}
