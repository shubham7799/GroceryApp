import 'package:flutter/material.dart';
import 'package:grocery_app/pages/homePage.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
                    Text("Select your payment method",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    method("Credit Card", Icons.credit_card),
                    method("UPI", Icons.card_membership),
                    method("PayTM", Icons.credit_card),
                    method("Google Pay", Icons.monetization_on),
                    method("Cash on Delivery", Icons.attach_money),
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
                      child: Text("Pay: ₹480",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: Container(
                          margin: const EdgeInsets.all(12.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              border: Border.all(color: Colors.white)),
                          child: Text("Pay Now",
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

  Widget method(String type, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: Colors.green,
              ),
              SizedBox(
                width: 20,
              ),
              Text(type,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
