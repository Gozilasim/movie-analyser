
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:movie/widget/responsive.dart';

import 'custom_button.dart';


class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {

  final _formSignInKey = GlobalKey<FormState>();
  bool isSwitchOn = true;
  late String text;
  final TextEditingController _textController = TextEditingController();
  late  String result = "";
  final String noresult = "no result";

  @override
  void initState() {
    super.initState();
    text = isSwitchOn ? "PRO" : "FREE";
  }
  final SizedBox spaceBetween = const SizedBox(height: 15,);
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.60,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: this.widget.screenSize.height/50,
              bottom: this.widget.screenSize.height/2.5,
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              key: _formSignInKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LiteRollingSwitch(
                        value: isSwitchOn,
                          textOn: "Pro",
                          textOff: "Free",
                          colorOn: Colors.green,
                          colorOff: Colors.redAccent,
                          iconOn: Icons.done,
                          iconOff: Icons.lock,
                          textSize: 30,
                          onChanged: (bool value){
                            setState(() {
                              isSwitchOn = value;
                              text = isSwitchOn ? "PRO" : "FREE";
                            });
                          },
                        onTap: (){},
                        onDoubleTap: (){},
                        onSwipe: (){},
              
                      ),


                      Row(
                        children: <Widget>[
                          Text(
                            text,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                          Text(
                            "Plan",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "select your plan",
                      ),
                    ],
                  ),
                  spaceBetween,
                  TextFormField(
                    controller: _textController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please Enter Username";
                      }
                      return null;
                    },
                    minLines: 1,
                    maxLines: 15, // Set the number of visible lines
                    decoration: InputDecoration(
                      label: const Text(
                          "Brief introduction"
                      ),
                      hintText: "Paste Brief introduction",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      isCollapsed: true, // Align the text to the top
                      contentPadding: EdgeInsets.only(
                          top: 12.0,
                          bottom: 100,
                          left: 16.0,
                          right: 16.0),
                    ),

                  ),
                  spaceBetween,
                  spaceBetween,
                  Row(
                    children: <Widget>[
                      ButtonWidget(
                        text: TextCleaner.cleanText(_textController.text),
                        buttonText: "Check",
                        color: Colors.white,
                        onResultReceived: handleResult,
                      ),
                      SizedBox(width: 50,),
                      Row(
                        children: <Widget>[
                          Text(
                            "Genre Type: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            result == ""
                                ? noresult // Text to display if result is null
                                : result, // Text to display if result is not null
                            style: result == null
                                ? TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                                : TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),


                ],
              
              ),
            ),
          ),

        ),
      ),
    );
  }

  void handleResult(List<String> genreTypes) {

    setState(() {
      result = "${genreTypes.join(', ')}";
    });
  }
}

class TextCleaner {
  static String cleanText(String text) {
    text = text.toLowerCase();
    text = text.replaceAll(RegExp(r"what's"), "what is ");
    text = text.replaceAll(RegExp(r"\'s"), " ");
    text = text.replaceAll(RegExp(r"\'ve"), " have ");
    text = text.replaceAll(RegExp(r"can't"), "can not ");
    text = text.replaceAll(RegExp(r"n't"), " not ");
    text = text.replaceAll(RegExp(r"i'm"), "i am ");
    text = text.replaceAll(RegExp(r"\'re"), " are ");
    text = text.replaceAll(RegExp(r"\'d"), " would ");
    text = text.replaceAll(RegExp(r"\'ll"), " will ");
    text = text.replaceAll(RegExp(r"\'scuse"), " excuse ");
    text = text.trim();
    return text;
  }
}