import 'package:flutter/material.dart';
import 'package:grocery_app/item.dart';
import 'package:grocery_app/pages/product.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search"),
              ),
              Row(
                children: [
                  itemProduct(context, "images/apple.jpg", "Apple", "200/KG"),
                  itemProduct(
                      context, "images/avocado.jpg", "Avocado", "300/KG"),
                ],
              ),
              Row(
                children: [
                  itemProduct(
                      context, "images/avocado.jpg", "Avocado", "300/KG"),
                  itemProduct(context, "images/apple.jpg", "Apple", "200KG"),
                ],
              ),
              Row(
                children: [
                  itemProduct(context, "images/apple.jpg", "Apple", "200/KG"),
                  itemProduct(
                      context, "images/avocado.jpg", "Avocado", "300/KG"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(BuildContext context, String image, String name, String price) {
    return Expanded(
      child: Container(
        height: 200,
        width: 170,
        child: Card(
          elevation: 10,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProductPage()));
            },
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain)),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
