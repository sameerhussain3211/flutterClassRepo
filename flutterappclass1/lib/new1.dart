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
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(child: Text("Flutter Demo")),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:100.0, // Adjust the width and height according to your needs
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // shape: BoxShape.circle,
                // color: Colors.blue, // You can set any color you want here
              ),
              child: Image.asset('assects/images/pic1.jpg'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
          ),
          // Container(width: 50,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: _reset,
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
