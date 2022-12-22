import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getPhoto extends StatefulWidget {
  const getPhoto({Key? key}) : super(key: key);

  @override
  State<getPhoto> createState() => _getPhotoState();
}


class _getPhotoState extends State<getPhoto> {
  List _get = [];

  Future _getDataPhoto() async{
    try{
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/photos'
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
    _getDataPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baca Photo"),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataPhoto,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['albumId'].toString()+ "-" + _get[index]['id'].toString() ) ,
                  subtitle: Text(_get[index]['title']),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_get[index]['url']),
                  ),
                ),
              );
            }),),
    );
  }
}
