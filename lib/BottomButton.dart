import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,


      child: Container(
        child: Center(
          child: Text(
            buttonTitle,

            style: kLargeButtonStyleText,
          ),
        ),
        color: kActiveBottomContainerColor,
        // margin: EdgeInsets.only(top: 8.0),
        width: double.infinity,
        // padding: EdgeInsets.only(bottom: 17.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}