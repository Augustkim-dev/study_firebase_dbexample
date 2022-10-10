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
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: '제목', fillColor: Colors.blueAccent),
              ),
              Expanded(
                  child: TextField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 100,
                decoration: InputDecoration(labelText: '내용'),
              )),
              MaterialButton(
                onPressed: () {
                  widget.reference
                      .push()
                      .set(Memo(
                              titleController!.value.text,
                              contentController!.value.text,
                              DateTime.now().toIso8601String())
                          .toJson())
                      .then(
                    (_) {
                      Navigator.of(context).pop();
                    },
                  );
                },
                child: Text('저장하기'),
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
