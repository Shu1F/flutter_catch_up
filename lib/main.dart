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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ホームページ'), backgroundColor: Colors.tealAccent),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextField(),
          ),
          ElevatedButton(onPressed: () {}, child: Text('メモを登録')),
          Flexible(
            child: ListView.builder(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                return Text(memos[index], style: TextStyle(fontSize: 24));
              },
            ),
          ),
        ],
      ),
    );
  }
}
