import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/screens/home/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_card.dart';

class Content extends StatelessWidget {
  final int _selectedIndex;

  Content(this._selectedIndex);

  final List<String> images = [
    "https://i.ibb.co/990S8RX/novelblog.png",
    "https://i.ibb.co/M5mWCLx/shopapp.png",
    "https://i.ibb.co/5nwJ2c4/nyuws-news.png",
  ];

  final List<String> link = [
    "https://novel-blog.000webhostapp.com/",
    "https://shopapp-radikz.netlify.app/",
    "https://drive.google.com/drive/folders/1tLxeuuhc4sGHILnlulPe1zX7aEtzGa-5?usp=sharing",
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.sourceSansPro(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.25,
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: (_selectedIndex == 0)
              ? WelcomeScreen()
              : (_selectedIndex == 1)
                  ? ListView(
                      children: <Widget>[
                        for (var i = 0; i < images.length; i++)
                          ImageCard(images[i], link[i]),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 24, 24),
                          child: MaterialButton(
                            hoverColor: Colors.deepOrangeAccent,
                            child: Text(
                              'See More',
                              style: style,
                            ),
                            onPressed: () =>
                                _launchUrl('https://github.com/radikz?tab=repositories'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : WelcomeScreen(),
        ),
      ),
    );
  }

  void _launchUrl(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
