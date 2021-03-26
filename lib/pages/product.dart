import 'package:flutter/material.dart';
import 'cartPage.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Hero(
                    tag: "",
                    child: Image(
                      image: AssetImage("images/apple.jpg"),
                      width: 300,
                      fit: BoxFit.contain,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: 28,
                        width: 32,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 14,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            Container(
                              height: 28,
                              width: 32,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) => CartPage()));
                                },
                                iconSize: 14,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apple",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "200/KG",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                      "An apple is an edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today."),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
