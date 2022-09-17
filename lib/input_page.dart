import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'own_widgets.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int age = 18;
  int height = 180;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusableCard(
                    () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [maleFem('MALE', FontAwesomeIcons.mars)],
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    maleFem('FEMALE', FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              null,
              kActiveCardColour,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text('cm', style: kText),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                    min: 140,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: reusableCard(
                  null,
                  kActiveCardColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kText,
                      ),
                      Text(weight.toString(), style: kNumberStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildRawMaterialButton1(FontAwesomeIcons.minus),
                          SizedBox(
                            width: 10.0,
                          ),
                          buildRawMaterialButton1(FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: reusableCard(
                    null,
                    kActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kText,
                        ),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildRawMaterialButton2(FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            buildRawMaterialButton2(FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultsPage()));
          }, 'CALCULATE')
        ],
      ),
    );
  }

  RawMaterialButton buildRawMaterialButton1(IconData icon) {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          icon == FontAwesomeIcons.plus ? weight++ : weight--;
        });
      },
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Colors.white,
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }

  RawMaterialButton buildRawMaterialButton2(IconData icon) {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          icon == FontAwesomeIcons.plus ? age++ : age--;
        });
      },
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Colors.white,
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton(this.onTap, this.bottomTitle);
  final Function onTap;
  final String bottomTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFEB1555),
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            bottomTitle,
            style: kText.copyWith(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
