import 'package:flutter/material.dart';
import 'package:myntra/models/myproduct.dart';
import 'package:provider/provider.dart';
class Products extends StatefulWidget {
  @override

  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  
  List<int> selectedindex=<int>[];
  bool _inbag = false;
  List<String> images = [
    "https://assets.ajio.com/medias/sys_master/root/20210404/14AH/606b156e7cdb8c1f14a1c8a4/kbz-navy-straight-block-print-straight-kurti.jpg",
    "https://assets.ajio.com/medias/sys_master/root/20210312/AjNV/604b8dc57cdb8c1f146069b0/-473Wx593H-462130893-blue-MODEL.jpg",
    "https://assets.ajio.com/medias/sys_master/root/20210403/Zire/6068c875aeb269a9e338b92b/-1117Wx1400H-461924744-black-MODEL.jpg",
    "https://assets.ajio.com/medias/sys_master/root/20210312/QXOT/604b8dbe7cdb8c1f146068b4/-473Wx593H-462130903-black-MODEL.jpg"
  ];

  List names = [
    {
      'name': 'Navy Blue Kurta',
      'price': '300'
    },
    {
      'name': 'Long kurta',
      'price': '250'
    },
    {
      'name': 'Printed Kurta',
      'price': '600'
    },
    {
      'name': 'Black kurta',
      'price': '450'
    },
    {
      'name': 'Chocolate chip',
      'price': '400'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 8.0, childAspectRatio: 2 / 3),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                          child: Column(children: <Widget>[
                            Image.network(images[index]),
                            Text(names[index]['name'],
                                style: TextStyle(
                                  color: Colors.red[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            Text("Rs " + names[index]['price'],
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
                    }))));
  }
}
