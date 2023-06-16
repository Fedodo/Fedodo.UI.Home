import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedodo_ui_home/Extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:js' as js;

import 'package:logger/logger.dart';

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
    Logger logger = Logger();

    double width = MediaQuery.of(context).size.width;

    Widget imageWidget;

    if (!image.endsWith(".svg")) {
      imageWidget = Ink.image(
        fit: BoxFit.fill,
        image: CachedNetworkImageProvider(
          image.asProxyString(),
          errorListener: () {
            logger.log(
              Level.error,
              "An error occurred in CachedNetworkImageProvider",
            );
          },
        ),
      );
    } else {
      imageWidget = InkWell(
        // fit: BoxFit.fill,
        child: SvgPicture.network(image.asProxyString()),
      );
    }

    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: Card(
        child: InkWell(
          onTap: () {
            js.context.callMethod('open', [link, "_self"]);
          },
          child: imageWidget,
        ),
      ),
    );
  }
}
