import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      })),
              Expanded(
                  child: ReusableCard(
                color: selectedGender == Gender.female
                    ? activeCardColor
                    : inactiveCardColor,
                cardChild: const IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: "Female",
                ),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              )),
            ],
          )),
          const Expanded(child: ReusableCard(color: activeCardColor)),
          const Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableCard(color: activeCardColor)),
              Expanded(child: ReusableCard(color: activeCardColor)),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
