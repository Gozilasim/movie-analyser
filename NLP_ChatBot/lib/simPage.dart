import 'package:flutter/material.dart';

import 'chatbot/chatbot.dart';

class SIM extends StatefulWidget {
  const SIM({Key? key}) : super(key: key);

  @override
  State<SIM> createState() => _SIMState();
}

class _SIMState extends State<SIM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ehe"),
      ),
      body: Center(
        child: Image(
          image: NetworkImage("https://static.wixstatic.com/media/6fa157_c8a4aaf54fe14c47876c159a77b5882d~mv2.jpg/v1/fill/w_717,h_717,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/background%20photo_edited.jpg"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openChatDialog(context);
          },
        child: Icon(Icons.chat),
      ),
    );
  }
  void _openChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: ChatPage(), // Display ChatPage content in the dialog
        );
      },
    );
  }
}
