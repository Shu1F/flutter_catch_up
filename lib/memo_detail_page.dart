import 'package:flutter/material.dart';

class MemoDetailPage extends StatelessWidget {
  const MemoDetailPage(this.memo, {super.key});
  final String memo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('メモ詳細')),
      body: Center(child: Text(memo)),
    );
  }
}
