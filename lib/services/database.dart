
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myntra/models/myproduct.dart';

class FirestoreData{

  Future<List<MyProduct>> getproducts()async{
    List<MyProduct> allproducts = [];
      await FirebaseFirestore.instance.collection("product").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        MyProduct res = MyProduct(
            name: result.data()!['name'],
            cost: result.data()!['cost'],
            img: result.data()!['img'],
            id: result.data()!['id'],
        );
        allproducts.add(res);
      });
    });
    print(allproducts);
    return allproducts;
  }
}