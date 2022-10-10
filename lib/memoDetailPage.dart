import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'memo.dart';
import 'package:firebase_database/firebase_database.dart';

class MemoDetailPage extends StatefulWidget {
  //const MemoDetailPage({Key? key}) : super(key: key);

  final DatabaseReference reference;
  final Memo memo;

  const MemoDetailPage(
      {super.key, required this.reference, required this.memo});

  @override
  State<MemoDetailPage> createState() => _MemoDetailPageState();
}

class _MemoDetailPageState extends State<MemoDetailPage> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.memo.title);
    contentController = TextEditingController(text: widget.memo.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.memo.title)),
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
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Memo memo = Memo(titleController!.value.text,
                      contentController!.value.text, widget.memo.createTime);
                  widget.reference
                      .child(widget.memo.key!)
                      .set(memo.toJson())
                      .then((_) {
                    Navigator.of(context).pop(memo);
                  });
                },
                child: Text('수정하기'),
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
