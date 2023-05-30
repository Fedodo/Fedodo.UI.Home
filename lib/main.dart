import 'package:fedodo_ui_home/card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FedodoUIHome());
}

class FedodoUIHome extends StatelessWidget {
  const FedodoUIHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          children: [
            AppCard(
              link: "https://micro.dev.fedodo.social",
              image: "https://fedodo.org/images/Fedodo%20Circle.png",
            ),
          ],
        ),
      ),
    );
  }
}
