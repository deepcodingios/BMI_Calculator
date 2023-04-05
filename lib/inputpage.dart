import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const cardBackgroundColor = Color(0xFF1E1F32);

const activeCardBackgroundColor = Color(0xFF1D1E33);
const inActiveCardBackgroundColor = Color(0xFF111328);
// const cardBackgroundColor = Colors.redAccent;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardBackgroundColor;
  Color femaleCardColor = inActiveCardBackgroundColor;

  //1=male, 2=female
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardBackgroundColor) {
        maleCardColor = activeCardBackgroundColor;
        femaleCardColor = inActiveCardBackgroundColor;
        print('Male Activated');
      } else {
        maleCardColor = inActiveCardBackgroundColor;
        print('Male In Activated');
      }
    }

    if (gender == 2) {
      if (femaleCardColor == inActiveCardBackgroundColor) {
        femaleCardColor = activeCardBackgroundColor;
        maleCardColor = inActiveCardBackgroundColor;
        print('Female Activated');
      } else {
        femaleCardColor = activeCardBackgroundColor;
        print('Female In Activated');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                        print('Male Button tapped');
                      },
                      child: ReusableCard(
                        colour: inActiveCardBackgroundColor,
                        cardChild: CardWidget(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: inActiveCardBackgroundColor,
                        cardChild: CardWidget(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: inActiveCardBackgroundColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardBackgroundColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              color: Color(0xFFEB1555),
              height: 80.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  CardWidget({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
