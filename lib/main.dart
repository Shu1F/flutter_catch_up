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
  List<String> memos = ['memo1', 'memo2', 'memo3'];
  final controller = TextEditingController();

  void addMemo() {
    memos.add(controller.text);
    // 入力されている情報のリセット
    controller.clear();
    setState(() {});
  }

  void deleteMemo(int index) {
    memos.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ホームページ'), backgroundColor: Colors.tealAccent),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextField(controller: controller),
          ),
          ElevatedButton(
            onPressed: () {
              addMemo();
            },
            child: Text('メモを登録'),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: memos.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(memos[index], style: TextStyle(fontSize: 24)),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('メモを削除'),
                              content: Text('本当に削除しますか？この作業は取り消しできません。'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('キャンセル'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    deleteMemo(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('削除'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
