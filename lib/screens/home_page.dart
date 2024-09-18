import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../about_us/app_text_styles.dart';
import '../widget/text_widget.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  final Color color = Colors.yellowAccent;
  final double font_size = 100;


  final VideoPlayerController videoPlayerController = VideoPlayerController.asset("images/1.mp4");

  ChewieController? chewieController;



  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16/9,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    
    super.initState();
  }

  void dispose(){
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {



    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    double dynamicAspectRatio = screenSize.width / (screenSize.height * 0.65);

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Chewie(
                    controller: chewieController!,
                  )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 200,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Check Movie's Genre",
                          style: AppTextStyles.home(
                              color: Colors.white,
                            fontSize: 120,
                              ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AnimatedTextKit(
                              animatedTexts: [

                                TyperAnimatedText('Drama',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Comedy',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Action',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Thriller',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Romance',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Crime',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Musical',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Animation',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Children',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Fantasy',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Mystery',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Biography',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Black',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('History',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Short',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Documentary',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Sports',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Series',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Adult',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Political',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Tokusatsu',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Masala',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Supernatural',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Psycho',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Epic',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),
                                TyperAnimatedText('Satire',
                                  textStyle: AppTextStyles.home(
                                      color: color,
                                      fontSize: font_size),
                                ),


                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                            Text(
                              "\tContent",
                              style: AppTextStyles.home(
                                  color: Colors.white,
                                  fontSize: 100),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),
                  Container(
                    child: FloatingQuickAccessBar(screenSize: screenSize),
                  ),
                  SizedBox(height: 120,),

                ],
              )

            ],
          ),

        ],
      ),
    );

  }
}
