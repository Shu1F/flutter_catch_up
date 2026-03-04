import 'package:flutter/material.dart';

class MemoDetailPage extends StatelessWidget {
  const MemoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('メモ詳細')),
      body: Center(child: Text('ここにメモの詳細が表示されます')),
    );
  }
}
