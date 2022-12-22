import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getComment extends StatefulWidget {
  const getComment({Key? key}) : super(key: key);

  @override
  State<getComment> createState() => _getCommentState();
}


class _getCommentState extends State<getComment> {
  List _get = [];

  Future _getDataComment() async{
    try{
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/comments'
      ));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState((){
          _get.clear();
          _get = data;
        });
      }
    }catch(e){}
  }


  @override
  void initState() {
    super.initState();
    _getDataComment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baca Comments"),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataComment,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context,index){
              return Padding(padding: const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['id'].toString()+'-'+_get[index]['name']+ "- " + _get[index]['email']) ,
                  subtitle: Text(_get[index]['body'].toString()),
                  // trailing: Text(_get[index]['body']),
                ),
              );
            }),),
    );
  }
}
