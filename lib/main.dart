import 'package:fedodo_ui_home/card.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

void main() {
  String config = const String.fromEnvironment('CONFIG');

  runApp(
    FedodoUIHome(
      config: config,
    ),
  );
}

class FedodoUIHome extends StatelessWidget {
  const FedodoUIHome({
    super.key,
    required this.config,
  });

  final String config;

  @override
  Widget build(BuildContext context) {
    var yaml = loadYaml(config);

    List<AppCard> appCards = [];

    for (var element in yaml["appCards"]) {
      appCards.add(
        AppCard(
          link: element["link"],
          image: element["image"],
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
