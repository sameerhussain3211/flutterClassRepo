import 'package:flutter/material.dart';
import 'package:flutterappclass1/homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String? dropdownvalue;
  List<String> items = ['Admin', 'User'];

  var emailAddress = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    child: Image.asset('assects/images/download.png'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'SHRINE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      labelText: 'Email',
                      hintText: 'Enter Email'),
                ),
              ),
              Container(
                height: 12,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      filled: true,
                      hintText: 'Enter Password'),
                ),
              ),
              Container(
                height: 50,
              ),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text("CANCEL"),
                    onPressed: () {
                      print("hello");
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return (HomePage());
                        }));
                      },
                      child: Text("Next"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
