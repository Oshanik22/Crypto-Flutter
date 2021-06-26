import 'package:flutter/material.dart';
import 'package:crypto_flutter/bottomButton.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Widget child = DropdownButton<String>(
    items: [
      DropdownMenuItem(
        child: Text('yes'),
      ),

    ],
    onChanged: (value){
      print(value);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: child,
      ),
      padding: EdgeInsets.all(120.0),
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: 15.0),
      height: 20.0,
      width: double.infinity,
    );
  }
}
