
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:myntra/models/myproduct.dart';


// class DatabaseService {

//   final String uid;
//   DatabaseService({ required this.uid });
  
  

//   // collection reference
//   final CollectionReference productCollection = FirebaseFirestore.instance.collection('product');

  

//   // brew list from snapshot
//   List<MyProduct> _productListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc){
//       return MyProduct(
//         name: doc['name'] ?? '',
//         cost: doc['cost'] ?? '',
//         // img: doc['img'] ?? '',
//         id: doc['id'] ?? '',
//       );
//     }).toList();
//   }

 

//   // get brews stream
//   Stream<List<MyProduct>> get product {
//     return productCollection.snapshots()
//       .map(_productListFromSnapshot);
//   }
 
 

// }