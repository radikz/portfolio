import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _github = "https://github.com/radikz";
  final _linkedin = "https://www.linkedin.com/in/rangga-dikarinata";
  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.sourceSansPro(
      fontSize: 34,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.25,
      color: Colors.black,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Welcome to my portofolio...\nMy Name is Rangga Dikarinata',
                textStyle: style,
                speed: Duration(milliseconds: 100),
                textAlign: TextAlign.center,
              ),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 30,
                hoverColor: Colors.deepOrangeAccent,
                onPressed: () => _launchUrl(_github),
                icon: Image.network('https://i.ibb.co/99NLRTx/github.png', width: 55,),
              ),
              SizedBox(width: 10,),
              IconButton(
                iconSize: 30,
                hoverColor: Colors.deepOrangeAccent,
                onPressed: () => _launchUrl(_linkedin),
                icon: Image.network('https://i.ibb.co/HCMQVfV/linkedin.png', width: 55,),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _launchUrl(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

}
