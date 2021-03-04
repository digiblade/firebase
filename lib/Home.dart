import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'component/InputForm.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final TextEditingController msgCtrl = TextEditingController();
  @override
  String text = "";
  @override
  void initState() {
    super.initState();
    getEmail();
  }

  getEmail() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        setState(() {
          text = user.uid;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => MyApp(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: InputField(
                obscure: false,
                ctrl: msgCtrl,
              ),
            ),
            IconButton(icon: Icon(Icons.send), onPressed: null)
          ],
        ),
      ),
    );
  }
}
