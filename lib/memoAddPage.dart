import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';
import 'memo.dart';

class MemoAddPage extends StatefulWidget {
  // const MemoAddPage({Key? key}) : super(key: key);

  final DatabaseReference reference;

  const MemoAddPage({super.key, required this.reference});

  @override
  State<MemoAddPage> createState() => _MemoAddPageState();
}

class _MemoAddPageState extends State<MemoAddPage> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메모 추가하기')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(),
              Expanded(child: TextField()),
              MaterialButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
