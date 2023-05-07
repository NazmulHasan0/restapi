import 'package:allapi/Helper/comment_helper.dart';
import 'package:allapi/Model/comment.dart';
import 'package:flutter/material.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List<Comment>? comment;
  bool isloded = false;
  getData() async {
    comment = await CommentHelper().getComment();
    setState(() {
      isloded = true;
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API"), centerTitle: true),
      body: Visibility(
        visible: isloded,
        child: ListView.builder(
          itemCount: comment?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(comment![index].name),
                subtitle: Text(comment![index].email),
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


/*
  1. http: ^0.13.6
     import 'package:http/http.dart' as http;
  2. একটা Model Class Cerate করা
  3. একটা Helper Class Cerate করা
    https://jsonplaceholder.typicode.com/
    https://quicktype.io/
*/