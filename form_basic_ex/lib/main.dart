import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // dependency add kala uthui

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login form",
            textAlign: TextAlign.center,
          ),
        ),
        body: FormPage(),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 100),
        //color: Colors.red,
        child: Form(
          key: form_key,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username :",
                  prefixIcon: Icon(
                    FontAwesomeIcons.userShield,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  suffixText: "*",
                  suffixStyle: TextStyle(color: Colors.red),
                  //errorText: "Error"
                ),
                validator: (name) {
                  return checkNameValidation(name);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                smartDashesType: SmartDashesType.enabled,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password :",
                  prefixIcon: Icon(
                    FontAwesomeIcons.unlock,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  suffixText: "*",
                  suffixStyle: TextStyle(color: Colors.red),
                  //errorText: "Error"
                ),
                validator: (password) {
                  return checkPaswordValidation(password);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.greenAccent,
                //colorBrightness: Brightness.light,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  if (form_key.currentState.validate()) {
                    form_key.currentState.save();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You are Loging"),
                        backgroundColor: Colors.greenAccent,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(left :20,right:20,bottom: 30),
                        elevation: 20.0,
                      ),
                    );
                    form_key.currentState.reset();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String checkNameValidation(String name) {
    if (name.isEmpty) {
      return "Cant be empty";
    }
    if (name.length > 15) {
      return "its to long";
    }
    if(name != "admin"){
      return "invalied username";
    }
    return null;
  }

  String checkPaswordValidation(String password) {
    if (password.isEmpty) {
      return "Fill the password field";
    }
    if (password.length < 8) {
      return "password to short";
    }
    if (password != "password") {
      return "incorrect password";
    }
    return null;
  }
}
