import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool passwordVisible = false;
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
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
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
            const  SizedBox(
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
                    onPressed: (){
                    print("hello");
                  },
                  ),
                  const SizedBox(width: 50,),
                  ElevatedButton(onPressed: (){print("hello");}, child: Text("Next"))
        
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
