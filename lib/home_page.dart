import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets.dart';

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender = Gender.male;
  int height = 180;

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
                          ? kActiveCardColor
                          : kInactiveCardColor,
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
                    ? kActiveCardColor
                    : kInactiveCardColor,
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
          Expanded(
              child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Height",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: const Color(0xFFEB1555),
                  inactiveColor: const Color(0xFF8D8E98),
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          )),
          const Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableCard(color: kActiveCardColor)),
              Expanded(child: ReusableCard(color: kActiveCardColor)),
            ],
          )),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
