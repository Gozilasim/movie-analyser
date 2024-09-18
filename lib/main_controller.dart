


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/routing/route_names.dart';
import 'package:movie/routing/router.dart';
import 'package:movie/screens/chat_page.dart';
import 'package:movie/services/navigation_service.dart';
import 'package:movie/widget/top_bar.dart';

import 'locator.dart';

class main_controller extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _main_controller();

}

class _main_controller extends State<main_controller>{

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
            screenSize.width, 70
        ),
        child: top_bar(_opacity),
      ),

      body: Expanded(
          child: Navigator(
            key: locator<NavigationService>().navigatorKey,
            onGenerateRoute: generateRoute,
            initialRoute: HomeRoute,
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.lightBlueAccent,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text(
                      "Chat with FashionBot"
                  ),
                  content: Container(
                    width: 500,
                    height: 700,
                    child: ChatPage(),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              }
          );
        },
        child: Icon(
          Icons.help_outline ,
          color: Colors.white,
          size: 40,
        ),

      ),

    );
  }



}