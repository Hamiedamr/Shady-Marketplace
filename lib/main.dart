import "package:flutter/material.dart";
import "API.dart";
import 'dart:async';
import 'dart:convert';

/*
 * SignIn Post Request
 * @params
 * userName:String
 * password:String
 */

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shady Market Place"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              //Welcome
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: Text(
                "Welcome in Shady Market Place!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              //User Name Text Field
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                cursorColor: Colors.red,
                controller: userName,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: "User Name",
                    labelStyle: TextStyle(color: Colors.red)),
              ),
            ),
            Container(
              //Password Text Field
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                controller: userPassword,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                //color: Colors.blue,
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    onPressed: () async {
                      /**
                       * Send the username and password => signIn
                       */

                      setState(() async {
                        String data =
                            await createAlbum(userName.text, userPassword.text);
                        print(data.toString());
                      });
                    },
                    color: Colors.red,
                    splashColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
