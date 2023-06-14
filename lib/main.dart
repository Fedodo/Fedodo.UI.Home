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

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.01),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: const [
            AppCard(
              link: "https://micro.dev.fedodo.social",
              image: "https://fedodo.org/images/Fedodo%20Circle.png",
            ),
            AppCard(
              link: "https://micro.dev.fedodo.social",
              image: "https://fedodo.org/images/Fedodo%20Circle.png",
            ),
            AppCard(
              link: "https://micro.dev.fedodo.social",
              image: "https://fedodo.org/images/Fedodo%20Circle.png",
            ),
            AppCard(
              link: "https://micro.dev.fedodo.social",
              image: "https://fedodo.org/images/Fedodo%20Circle.png",
            ),
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
