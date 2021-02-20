import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  static String tag = 'appintro-page';

  @override
  _IntroScreen createState() => new _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "What are bots?",
        description:
        "Bots are automated trading strategies that can make decisions for you.",
        pathImage: "assets/imgs/bots_logo.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "What do Bots do?",
        description:
        "Our Bots track the market 24/7 and buy and sell your assets to get the best revenue.",
        pathImage: "assets/imgs/bots_logo.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "How do bots work?",
        description:
        "Pick a Bot based on their previous performance and tap 'Start this Bit' Start with as little as 50.",
        pathImage: "assets/imgs/bots_logo.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
