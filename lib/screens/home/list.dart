import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myntra/models/myproduct.dart';
import 'package:myntra/models/myuser.dart';
import 'package:myntra/screens/home/categories.dart';
import 'package:myntra/screens/home/products.dart';
import 'package:myntra/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:myntra/services/database.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final AuthService _auth = AuthService();

  FirestoreData _firestoreData = FirestoreData();

   List<int> selectedindex=<int>[];

  bool _inbag = false;

  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Happening Now',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  ),
              ),
              Text('Spaces going on right now',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [Icon(Icons.camera,color: Colors.pink,), Text('Trending',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                )],
              ),
              FutureBuilder<List<MyProduct>>(
                future: _firestoreData.getproducts(),
                  builder: (context,snapshot){
                  if(snapshot.hasError){
                    print(snapshot.error);
                    return Text('error');
                  }
                  else if(snapshot.hasData){
                    return Scrollbar(
                      child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 8.0, childAspectRatio: 2 / 3),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                          child: Column(children: <Widget>[
                            Image.network(snapshot.data![index].img),
                            Text(snapshot.data![index].name,
                                style: TextStyle(
                                  color: Colors.red[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            Text("Rs " + snapshot.data![index].cost,
                                style: TextStyle(
                                  color: Colors.green[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                                 GestureDetector(
                                onTap: () {
                                  if(!selectedindex.contains(index))
                                  {
                                    selectedindex.add(index);
                                  }
                                  else{
                                    selectedindex.remove(index);
                                  }
                                  setState(() {
                                    _inbag = !_inbag;
                                  });
                                },
                                child: Container(
                                  padding:EdgeInsets.only(top:5,bottom:5,left:5,right:5),
                                color: selectedindex.contains(index) ?Colors.brown:Colors.pink,
                                child: Text(selectedindex.contains(index) ? 'Move to bag' : 'Remove from bag',
                                style:TextStyle(color:Colors.white)),
              ),
                                 ),
                                 
                          ]),
                          margin: EdgeInsets.all(2),
                        ),
                        onTap: () {},
                      );
                    }
                    )
                    );
                  }
                  return Text("loading");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
