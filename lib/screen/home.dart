import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httppssss/model/user.dart';
import 'package:httppssss/model/user_name.dart';
import 'package:httppssss/service/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  fetchUsers() async {
    setState(() {
      guncelleme();
    });
  }

  guncelleme() {
    setState(() {
      UserApi().fetchUsers();
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    UserApi().fetchUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE40303),
                Color(0xFFFF8C00),
                Color(0xFFFFED00),
                Color(0xFF008026),
                Color(0xFF004DFF),
                Color(0xFF750787),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text("Toplumsal Cinsiyet Eşitliği "),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchUsers(),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final email = user.email;

              return ListTile(
                title: Text(user.name.first + " " + user.name.last),
                subtitle: Text(user.email),
                tileColor: user.gender == "male"
                    ? Colors.lightBlue
                    : Colors.pinkAccent.shade100,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }
}
