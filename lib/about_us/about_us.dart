import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie/about_us/url/user_url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_text_styles.dart';

class aboutUs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _aboutUs();

}

class _aboutUs extends State<aboutUs>{

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  final SizedBox spaceBetween = const SizedBox(height: 2.0,);

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

    return  SingleChildScrollView(
      padding: EdgeInsets.only(
        top: screenSize.height/50,
        bottom: screenSize.height/50,
      ) ,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                bottomLeft:Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              color: Color(0xFF185a9d),
            ),
            //eight: 800,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chief Executive Officer (CEO) ",
                  style: AppTextStyles.headerTextStyle(
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .fade(duration: 700.ms)
                    .slide(duration: 700.ms)
                ,
                SizedBox(height: 50,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SIM WENG JIN",
                          style: AppTextStyles.headingStyles(
                              color: Colors.white
                          ),
                        ),
                        spaceBetween,
                        Row(
                          children: <Widget>[
                            Text(
                              "I\'m a ",
                              style: AppTextStyles.monteseratStyle(
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText('IT Project Managers',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Data Scientist',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Web Developer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Software Developer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),
                                ),
                                TyperAnimatedText('Software Engineer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),
                                ),
                                TyperAnimatedText('User experience designer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Database administrators and architects',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 30),

                                ),
                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                          ],
                        ),
                        Text(
                          "Success is not final, failure is not fatal: It is the courage to continue that counts.",
                          style: AppTextStyles.normalStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(sim_url().facebook_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.facebook_f),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async {
                                    final url = Uri.parse(sim_url().twiiter_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.twitter),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async{
                                    final url = Uri.parse(sim_url().instagram_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.instagram),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(sim_url().linked_in_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.linkedin),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(sim_url().github_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.github),
                                ),
                              ),
                            )
                          ],

                        )
                      ],
                    ),
                    SizedBox(width: 200),
                    CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(
                          'images/sim.jpg',
                        )
                    )
                        .animate()
                        .slideX(duration: 700.ms)
                    ,
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(
                  bottomLeft:Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                color: Colors.white
            ),
            //eight: 800,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chief Technology Officer (CTO) ",
                  style: AppTextStyles.headerTextStyle(
                    color: Colors.black,
                  ),
                )
                    .animate()
                    .fade(duration: 700.ms)
                    .slide(duration: 700.ms)
                ,
                SizedBox(height: 50,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: <Widget>[
                    CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(
                          'images/kee.jpg',
                        )
                    )
                        .animate()
                        .slideX(duration: 700.ms)
                    ,
                    SizedBox(width: 420),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[


                        Text(
                          "KEE CHIN YEW",
                          style: AppTextStyles.headingStyles(
                            color: Colors.black,
                          ),
                        ),
                        spaceBetween,
                        Row(
                          children: <Widget>[
                            Text(
                              "I\'m a ",
                              style: AppTextStyles.monteseratStyle(
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [

                                TyperAnimatedText(' IT Technician',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.indigo,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('IT Security Specialist',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.indigo,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Computer network architects',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.indigo,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Network administrators',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.indigo,
                                      fontSize: 30),

                                ),


                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                          ],
                        ),
                        Text(
                          "The only way to do great work is to love what you do.",
                          style: AppTextStyles.normalStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(kee_url().facebook_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.facebook_f),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async {
                                    final url = Uri.parse(kee_url().twiiter_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.twitter),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async{
                                    final url = Uri.parse(kee_url().instagram_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.instagram),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(kee_url().linked_in_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.linkedin),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(kee_url().github_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.github),
                                ),
                              ),
                            )
                          ],

                        )
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.only(
                bottomLeft:Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              color: Color(0xFF185a9d),
            ),
            //eight: 800,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chief Financial Officer (CFO) ",
                  style: AppTextStyles.headerTextStyle(
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .fade(duration: 700.ms)
                    .slide(duration: 700.ms)
                ,
                SizedBox(height: 50,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "LUM FU YUAN",
                          style: AppTextStyles.headingStyles(
                              color: Colors.white
                          ),
                        ),
                        spaceBetween,
                        Row(
                          children: <Widget>[
                            Text(
                              "I\'m a ",
                              style: AppTextStyles.monteseratStyle(
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText('Production Technologist',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.orange,
                                      fontSize: 30),
                                ),
                                TyperAnimatedText('Process Engineer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.orange,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('Quality Assurance Engineer',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.orange,
                                      fontSize: 30),

                                ),

                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                          ],
                        ),
                        Text(
                          "Destination isn't everything. Observe the world with your eyes before you reach the end\nI love Yee Xuan",
                          style: AppTextStyles.normalStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(long_url().facebook_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.facebook_f),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async {
                                    final url = Uri.parse(long_url().twiiter_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.twitter),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async{
                                    final url = Uri.parse(long_url().instagram_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.instagram),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(long_url().linked_in_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.linkedin),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(long_url().github_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.github),
                                ),
                              ),
                            )
                          ],

                        )
                      ],
                    ),
                    SizedBox(width: 150),
                    CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(
                          'images/long.jpg',
                        )
                    )
                        .animate()
                        .slideX(duration: 700.ms)
                    ,
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(
                  bottomLeft:Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                color: Colors.white
            ),
            //eight: 800,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Chief Information Officer (CIO) ",
                  style: AppTextStyles.headerTextStyle(
                    color: Colors.black,
                  ),
                )
                    .animate()
                    .fade(duration: 700.ms)
                    .slide(duration: 700.ms)
                ,
                SizedBox(height: 50,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: <Widget>[
                    CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(
                          'images/kang.jpg',
                        )
                    )
                        .animate()
                        .slideX(duration: 700.ms)
                    ,
                    SizedBox(width: 370),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[


                        Text(
                          "ANG WEI KANG",
                          style: AppTextStyles.headingStyles(
                            color: Colors.black,
                          ),
                        ),
                        spaceBetween,
                        Row(
                          children: <Widget>[
                            Text(
                              "I\'m a ",
                              style: AppTextStyles.monteseratStyle(
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [

                                TyperAnimatedText('Systems analyst',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('IT Security Specialist',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 30),

                                ),
                                TyperAnimatedText('IT director',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 30),
                                ),
                                TyperAnimatedText('Systems Administrator',
                                  textStyle: AppTextStyles.monteseratStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 30),

                                ),


                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                          ],
                        ),
                        Text(
                          "The future belongs to those who believe in the beauty of their dreams.",
                          style: AppTextStyles.normalStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(kang_url().facebook_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.facebook_f),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async {
                                    final url = Uri.parse(kang_url().twiiter_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }

                                  },
                                  child:Brand(Brands.twitter),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: () async{
                                    final url = Uri.parse(kang_url().instagram_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.instagram),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(kang_url().linked_in_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.linkedin),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            CircleAvatar(
                              maxRadius: 22,
                              backgroundColor:Color(0xFF00223E),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Color(0xFF185a9d),
                                child: GestureDetector(
                                  onTap: ()async{
                                    final url = Uri.parse(kang_url().github_url);
                                    print(url);
                                    if ( await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }
                                  },
                                  child:Brand(Brands.github),
                                ),
                              ),
                            )
                          ],

                        )
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),


          SizedBox(height: 5.0,),

        ],
      ),
    );

  }

}