import 'package:fedodo_ui_home/card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

void main() {
  String config = const String.fromEnvironment("CONFIG");
  bool microDisabled = const String.fromEnvironment("MICRO_DISABLED") == "true";

  runApp(
    FedodoUIHome(
      config: config,
      microDisabled: microDisabled,
    ),
  );
}

class FedodoUIHome extends StatelessWidget {
  const FedodoUIHome({
    super.key,
    required this.config,
    required this.microDisabled,
  });

  final String config;
  final bool microDisabled;

  @override
  Widget build(BuildContext context) {
    List<AppCard> appCards = [];

    if (config.isNotEmpty) {
      var yaml = loadYaml(config);

      for (var element in yaml["appCards"]) {
        appCards.add(
          AppCard(
            link: element["link"],
            image: element["image"],
          ),
        );
      }
    }

    if (!microDisabled) {
      var url = Uri.base;

      if (kDebugMode) {
        url = Uri.parse("https://home.dev.fedodo.social");
      }

      var domainName = url.authority.replaceAll("home.", "");

      appCards.add(
        AppCard(
          link: "https://micro.$domainName",
          image: "https://home.$domainName/Logos/Fedodo-Micro-Logo.svg",
        ),
      );
    }

    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            children: appCards,
          ),
        ),
      ),
    );
  }
}
