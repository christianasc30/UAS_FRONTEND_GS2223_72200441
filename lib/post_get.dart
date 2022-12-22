import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getPost extends StatefulWidget {
  const getPost({Key? key}) : super(key: key);

  @override
  State<getPost> createState() => _getPostState();
}


class _getPostState extends State<getPost> {
  List _get = [];

  Future _getDataPost() async{
    try{
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts'
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
    _getDataPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baca Posts"),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataPost,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context,index){
              return Padding(padding: const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['userId'].toString()+ "-" + _get[index]['id'].toString() +' '+ _get[index]['title']) ,
                  subtitle: Text(_get[index]['body']),
                ),
              );
            }),),
    );
  }
}
