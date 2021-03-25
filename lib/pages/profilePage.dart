import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/authService.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8.0, bottom: 22),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text("Brianna Henson"),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text("(+91) 11111 11111"),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text("bhansen@gmail.com"),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 80),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.edit),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Text("Address",
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
        ]),
      ),
    );
  }
}
