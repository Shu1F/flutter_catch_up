import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'memo_detail_page.dart';

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
  List<String> memos = [];
  final controller = TextEditingController();

  Future<void> initMemos() async {
    final prefs = await SharedPreferences.getInstance();
    final storedMemos = prefs.getStringList('memos');
    memos = storedMemos ?? [];
    setState(() {});
  }

  Future<void> addMemo() async {
    memos.add(controller.text);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('memos', memos);
    controller.clear();
    setState(() {});
  }

  Future<void> deleteMemo(int index) async {
    memos.removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('memos', memos);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initMemos();
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
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemoDetailPage(memos[index]),
                      ),
                    );
                  },
                  child: Row(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
