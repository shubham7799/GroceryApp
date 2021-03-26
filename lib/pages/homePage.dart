import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authService.dart';
import '../item.dart';
import 'category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery'),
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.history),
              title: Text("Orders"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                context.read<AuthenticationService>().logout();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black,
              decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Search"),
            ),
            Container(
              height: 120,
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                child: PageView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              image: DecorationImage(
                                  image: AssetImage("images/apple.jpg"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    );
                  },
                  controller: PageController(viewportFraction: .8),
                  itemCount: 3,
                ),
              ),
            ),
            tabMenu(context)
          ],
        ),
      ),
    );
  }

  Widget tabMenu(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Expanded(
          child: Scaffold(
              appBar: TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Categories"),
                  Tab(text: "New Arrival"),
                  Tab(text: "Budget Friendly"),
                ],
              ),
              body: TabBarView(
                children: [
                  tabCategories(context),
                  tabNewArrivals(context),
                  tabNewArrivals(context),
                ],
              )),
        ));
  }

  Widget tabCategories(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemCategory(context, "images/apple.jpg", "Fruits"),
              itemCategory(context, "images/avocado.jpg", "Vegetables"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemCategory(context, "images/avocado.jpg", "Vegetables"),
              itemCategory(context, "images/apple.jpg", "Fruits"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemCategory(context, "images/apple.jpg", "Fruits"),
              itemCategory(context, "images/avocado.jpg", "Vegetables"),
            ],
          )
        ],
      ),
    );
  }

  Widget itemCategory(BuildContext context, String image, String name) {
    return Row(
      children: [
        Container(
          width: 160,
          padding: EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoryPage()));
            },
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image), fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(name),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tabNewArrivals(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemProduct(context, "images/apple.jpg", "Apple", "120/KG"),
              itemProduct(context, "images/avocado.jpg", "Avocado", "120/KG"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemProduct(context, "images/avocado.jpg", "Avocado", "120/KG"),
              itemProduct(context, "images/apple.jpg", "Apple", "120/KG"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              itemProduct(context, "images/apple.jpg", "Apple", "120/KG"),
              itemProduct(context, "images/avocado.jpg", "Avocado", "120/KG"),
            ],
          )
        ],
      ),
    );
  }
}
