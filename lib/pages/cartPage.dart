import 'package:flutter/material.dart';
import 'package:grocery_app/pages/checkout.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Clear",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            item("images/avocado.jpg", "Apple", "₹120"),
            Icon(Icons.add),
            item("images/avocado.jpg", "Apple", "₹120"),
            Icon(Icons.add),
            item("images/avocado.jpg", "Apple", "₹120"),
            Icon(Icons.add),
            item("images/avocado.jpg", "Apple", "₹120"),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => CheckoutPage()));
                  },
                  child: Text(
                    "Total ₹480 >>",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget item(String image, String name, String price) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 200,
            child: Card(
              elevation: 8,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain)),
                  ),
                  Text(name)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(price),
        )
      ],
    );
  }
}
