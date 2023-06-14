import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedodo_ui_home/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.link,
    required this.image,
  }) : super(key: key);

  final String link;
  final String image;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: Card(
        child: InkWell(
          onTap: () {
            js.context.callMethod('open', [link, "_self"]);
          },
          child: Ink.image(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(
              image.asProxyString(),
            ),
          ),
        ),
      ),
    );
  }
}
