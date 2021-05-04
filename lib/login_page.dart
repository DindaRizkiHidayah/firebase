import 'package:firebase/Email_screen.dart';
import 'package:firebase/first_screen.dart';
import 'package:firebase/sign_in.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButtonEmail(),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonEmail() {
    return Container(
        margin: EdgeInsets.all(10),
        width: 300,
        child: Column(children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.email),
            ),
            onChanged: (value) {},
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              icon: Icon(Icons.lock),
            ),
            onChanged: (value) {},
          ),
          RaisedButton(
            child: Text("Sign In"),
            onPressed: () {
              String userEmail = emailController.text;
              String userPassword = passwordController.text;
              signInWithEmail(
                userEmail,
                userPassword,
              ).then(
                (result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EmailScreen();
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),
        ]));
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.blue,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
