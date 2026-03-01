import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ホームページ'), backgroundColor: Colors.tealAccent),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.blue, width: 5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 200, height: 200, color: Colors.black),
              Icon(Icons.beach_access, size: 100, color: Colors.blueAccent),
              // Icon(Icons.beach_access, size: 100, color: Colors.blueAccent),
              // Icon(Icons.balance, size: 100, color: Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
