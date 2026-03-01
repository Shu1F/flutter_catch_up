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
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('ホームページ'), backgroundColor: Colors.tealAccent),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TextField(controller: controller),
          ),
          ElevatedButton(
            onPressed: () {
              // 登録処理
              print(controller.text);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.check), Text('登録')],
            ),
          ),
        ],
      ),
    );
  }
}
