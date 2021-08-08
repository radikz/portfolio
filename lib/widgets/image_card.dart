import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCard extends StatelessWidget {
  final img;
  final uri;

  const ImageCard(this.img, this.uri);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: InkWell(
        onTap: () => _launchUrl(uri),
        child: Image.network(img),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  void _launchUrl(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}