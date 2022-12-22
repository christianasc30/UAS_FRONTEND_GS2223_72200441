import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_frontend_gs2223_72200441/comment_get.dart';
import 'package:uas_frontend_gs2223_72200441/photo_get.dart';
import 'package:uas_frontend_gs2223_72200441/post_get.dart';
import 'package:uas_frontend_gs2223_72200441/user_get.dart';

//import 'Post/Post_get.dart';


void main() {
  runApp(const MaterialApp(
    home: homedrawer(),
  ));
}
class homedrawer extends StatefulWidget {
  const homedrawer({Key? key}) : super(key: key);

  @override
  State<homedrawer> createState() => _homedrawerState();
}

class _homedrawerState extends State<homedrawer> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("appbar"),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png"),
                  ),
                  accountName: Text("Christian"),
                  accountEmail: Text("Christianzyegard@gmail.com")),
              ListTile(
                title: const Text('HOME'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homedrawer()));

                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('POSTS'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getPost()));
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('COMMENT'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getComment()));
                  // Update the state of the app.
                  // ...
                },
              ),

              ListTile(
                title: const Text('PHOTOS'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getPhoto()));
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('USERS'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getUser()));
                  // Update the state of the app.
                  // ...
                },
              ),
            ],

          ),
        ),
        body: ListView(
          children: [
            Container(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              padding: EdgeInsets.all(10.0),
            ),
            Container(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              padding: EdgeInsets.all(10.0),
            )
          ],
        ),
      );
  }
}

