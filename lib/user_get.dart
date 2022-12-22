import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getUser extends StatefulWidget {
  const getUser({Key? key}) : super(key: key);

  @override
  State<getUser> createState() => _getUserState();
}


class _getUserState extends State<getUser> {
  List _get = [];

  Future _getDataUser() async{
    try{
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/users'
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
    _getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baca User"),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataUser,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['id'].toString()+ "-" + _get[index]['name'] ) ,
                  subtitle: Text(_get[index]['username']+ "||" +_get[index]['email'] ),

                ),
              );
            }),),
    );
  }
}
