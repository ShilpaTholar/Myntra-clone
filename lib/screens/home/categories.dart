import 'package:flutter/material.dart';
 
class Categories extends StatefulWidget {
  const Categories({ Key? key }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categories = [
    {
      'name': 'Women',
      'subtitle': 'Western Wear,Kurtas and Suits...',
      'color': Colors.yellow[200]
    },
    {
      'name': 'Men',
      'subtitle': 'T-shirt,Shirt,Jeans...',
      'color': Colors.pink[100]
    },
    {
      'name': 'Kids',
      'subtitle': 'Brands,Clothing,Winterwear...',
      'color': Colors.lightBlue[100]
    },
    {
      'name': 'Accessories',
      'subtitle': 'Beauty products,footwear...',
      'color': Colors.purple[100]
    },
  ];
  List<String> images = [
    "https://www.designfreelogoonline.com/wp-content/uploads/2017/06/000845-woman-fashion-logo-creator-Free-woman-shopping-Logo-design-01.png",
    "https://i.pinimg.com/originals/e1/ea/58/e1ea58f865d810a9d4c9baabd516f081.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbKama7nuQdymrtBWy_ALt-GRhJfUz68QAdw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmcrfLZ7JxmqZdgc-keXgGDixqQ7bohtYAgUdXy6ycFhjngK0Y-n9kxViOXbwmYjnk9yM&usqp=CAU"
  ];
 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Myntra"), backgroundColor: Colors.red[300]),
      body: ListView.builder(
          shrinkWrap: false,
          itemCount: categories.length,
          itemExtent: 150,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              tileColor: categories[index]['color'],
              title: Text(categories[index]['name'], style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(categories[index]['subtitle']),
              // trailing: Image.network(images[index], height: 300, width: 100, fit: BoxFit.fill),
              onTap:(){
                   print("Clicked on "+ categories[index]['name'] +"category");
              }
            );
          }),
    );
  }
} 
