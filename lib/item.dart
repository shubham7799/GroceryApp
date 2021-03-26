import 'package:flutter/material.dart';
import 'pages/product.dart';

Widget itemProduct(
    BuildContext context, String image, String name, String price) {
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
