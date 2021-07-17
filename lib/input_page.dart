import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Card_Content.dart';
import 'NewWidget.dart';
import 'constants.dart';
import 'results_page.dart';
import 'BottomButton.dart';
import 'Round.dart';
import 'calculator_brain.dart';



enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
Gender selectedGender;
int height = 180;
int weight = 60;
int age = 15;
  /*
Color maleCardColor = inactiveColorCode;

Color femaleCardColor = inactiveColorCode;

void updateColour (Gender gender){
  //male card got pressed5
  if (gender == Gender.Male){
    if (maleCardColor == inactiveColorCode){
      maleCardColor = activeColorCode;
      femaleCardColor = inactiveColorCode;
    }
    else{
      maleCardColor = inactiveColorCode;
    }
  }
  //female card got pressed
  if (gender == Gender.Female){
    if (femaleCardColor == inactiveColorCode){
      femaleCardColor = activeColorCode;
      maleCardColor = inactiveColorCode;
    }
    else{
      femaleCardColor = inactiveColorCode;
    }
  }
  } */




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(
           child: Row(
             children: <Widget>[

               Expanded(
                 child: NewWidget(
                   onPress: (){
                     setState(() {
                       selectedGender = Gender.Male;
                     });
                   },
                   colour: selectedGender == Gender.Male ? kActiveColorCode : kInactiveColorCode,
                 cardChild: CardContent(
                   icon: FontAwesomeIcons.mars,
                   label: 'MALE',),
                 ),
               ),
                  Expanded(
                   child: NewWidget(
                     onPress: (){
                       setState(() {
                         selectedGender = Gender.Female;
                       });
                     },
                     colour: selectedGender == Gender.Female ? kActiveColorCode : kInactiveColorCode,
                     cardChild: CardContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                   ),
                  ),
                  ],
                  ),
         ),
          Expanded(
            child: NewWidget(
              colour: kActiveColorCode,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                    height.toString(),
                      style: kBigNoTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayColor: Color(0x29EB1555),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                  }

                  ),
                ),
    ],
              ),),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(  child:
                NewWidget(
                  colour: kActiveColorCode,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kBigNoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                         icon: FontAwesomeIcons.minus,
                          onPressed: (){
                           setState(() {
                             weight--;
                           });
                          },

                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                ),
                ),
                Expanded(  child:
                NewWidget(
                  colour: kActiveColorCode,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBigNoTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },

                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
        BottomButton(buttonTitle: 'CALCULATE',
        onTap: (){
          CalculatorBrain calc = CalculatorBrain(
            height: height,
            weight: weight,
          );
          Navigator.push(context, MaterialPageRoute(builder:
          (context) => ResultsPage(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          ),
          ),
          );
        },
        ),
        ],
      ),

    );
  }
}





