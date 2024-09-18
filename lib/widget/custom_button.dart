import 'package:flutter/material.dart';

import '../fastapi/api.dart';


class ButtonWidget extends StatelessWidget{
  const ButtonWidget({super.key, this.buttonText,  this.color, this.text, this.onResultReceived, });
  final String? buttonText;
  final String? text;
  final Color? color;

  final void Function(List<String> genreTypes)? onResultReceived; // 新增回调函数

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent)
        ),
        onPressed: () async {
          sendTextToServer(text!).then((List<String> genreTypes) {
            // 调用回调函数，并传递结果
            onResultReceived?.call(genreTypes);
          }).catchError((error) {
            // 处理错误
            print("Error: $error");
            // 如果需要，也可以在这里调用回调函数传递错误信息
          });
          },
          child:
         Container(
          padding: EdgeInsets.all(5),
          child: Text(
              buttonText!,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: color!,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );



  }

}