


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../routing/route_names.dart';
import '../services/navigation_service.dart';

class top_bar extends StatefulWidget{

  final double opacity;

  top_bar(this.opacity);

  @override
  _top_bar createState() => _top_bar();

}

class _top_bar extends State<top_bar>{

  final List _isHovering = [
    false,
    false,
    false,
  ];

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    double underline = 25;

    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 600),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[0] = true
                            : _isHovering[0] = false;
                      });
                    },
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? Color(0xFF077bd7)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
                          child: Container(
                            height: 2,
                            width: underline,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[1] = true
                            : _isHovering[1] = false;
                      });
                    },
                    onTap: () {
                      locator<NavigationService>().navigateTo(AboutRoute);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'About Us',
                          style: TextStyle(
                              color: _isHovering[1]
                                  ? Color(0xFF077bd7)
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[1],
                          child: Container(
                            height: 2,
                            width: underline,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );


  }

}