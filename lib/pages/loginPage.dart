import 'package:flutter/material.dart';
import 'package:grocery_app/pages/HomeScreen.dart';
import 'package:grocery_app/pages/signupPage.dart';
import 'package:provider/provider.dart';

import 'package:grocery_app/authService.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email;
  TextEditingController pass;
  BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    email = TextEditingController();
    pass = TextEditingController();
    buildContext = context;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                onPressed: () async {
                  final scaffold = Scaffold.of(context);
                  if (pass.text == '' || email.text == '') {
                    scaffold.showSnackBar(
                      SnackBar(
                        content: const Text('Enter Email and Password'),
                      ),
                    );
                  } else {
                    await context.read<AuthenticationService>().login(
                          email: email.text.trim(),
                          password: pass.text.trim(),
                        );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Log In"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text("Don't have account? Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
