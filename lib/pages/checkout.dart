import 'package:flutter/material.dart';
import 'payment.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Address",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 10,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  "Lorem Ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                              Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Order Summary",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        )),
                    item("images/avocado.jpg", "Avocado", "₹120"),
                    item("images/apple.jpg", "Apple", "₹120"),
                    item("images/avocado.jpg", "Avocado", "₹120"),
                    item("images/apple.jpg", "Apple", "₹120"),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(color: Colors.green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text("Total Cost: ₹480",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentPage()));
                      },
                      child: Container(
                          margin: const EdgeInsets.all(12.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              border: Border.all(color: Colors.white)),
                          child: Text("Confirm Order",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ))),
                    )
                  ],
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
            padding: EdgeInsets.only(top: 8),
            width: 200,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.contain)),
                          ),
                          Text(name),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("QTY:1"),
                        SizedBox(
                          width: 20,
                        ),
                        Text(price),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
