import 'package:flutter/material.dart';
import 'package:grocery_app/pages/loginPage.dart';
import 'package:provider/provider.dart';

import 'package:grocery_app/authService.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController name = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Signup"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email Address'),
                ),
                TextField(
                  controller: mobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Mobile No.'),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  onPressed: () async {
                    final scaffold = Scaffold.of(context);
                    if (password.text == '' ||
                        email.text == '' ||
                        name.text == '' ||
                        mobile.text == '') {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('Please Enter all details'),
                        ),
                      );
                    } else {
                      final text = await context
                          .read<AuthenticationService>()
                          .signup(
                              email: email.text.trim(),
                              password: password.text.trim(),
                              name: name.text.trim(),
                              number: mobile.text);
                      showSignUpDetails(context, text);
                    }
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("Sign Up"),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("Already have an account? Log In"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSignUpDetails(context, message) {
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 150,
        width: 200,
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(color: Colors.red, fontSize: 18.0),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.red, fontSize: 16.0),
                    )),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
