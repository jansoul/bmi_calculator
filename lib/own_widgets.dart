import 'package:flutter/material.dart';
import 'constants.dart';

int activeColour;
int inactiveColour;

class maleFem extends StatelessWidget {
  maleFem(this.male_fem, this.picture);
  final String male_fem;
  final IconData picture;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          picture,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          male_fem,
          style: kText,
        )
      ],
    );
  }
}

class reusableCard extends StatelessWidget {
  reusableCard(
    this.onPress,
    this.colour,
    this.cardChild,
  );
  final Function onPress;
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
