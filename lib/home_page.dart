import 'package:crypto_flutter/constants.dart';
import 'package:crypto_flutter/networking.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'bottomButton.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = 'USD';

//  List<int> conversionRate=[];

  int conversionRate0;
  int conversionRate1;
  int conversionRate2;
  String apikey = '1192785D-1F46-446B-BB64-FCF16A70910A';
  String apiurl = 'https://rest.coinapi.io/v1/exchangerate/';

 Future<void> getConversionData1(String dropDownValue) async {


      String url = '$apiurl${cryptoList[1]}/$dropDownValue?apikey=$apikey';
      NetworkHelper networkHelper = NetworkHelper(url: url);
      var conversionData = await networkHelper.getData();
      double actualRate =  await conversionData['rate'];
      var rateInt =  actualRate.toInt();

      conversionRate1 = rateInt;
      print('conversion rate set');

 }

  Future<void> getConversionData2(String dropDownValue) async {


    String url = '$apiurl${cryptoList[2]}/$dropDownValue?apikey=$apikey';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var conversionData = await networkHelper.getData();
    double actualRate =  await conversionData['rate'];
    var rateInt =  actualRate.toInt();

      conversionRate2 = rateInt;

  }
  Future<void> getConversionData0(String dropDownValue) async {


    String url = '$apiurl${cryptoList[0]}/$dropDownValue?apikey=$apikey';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var conversionData = await networkHelper.getData();
    double actualRate =  await conversionData['rate'];
    var rateInt =  actualRate.toInt();

      conversionRate0 = rateInt;

  }

  DropdownButton getDropDownMenu(List<DropdownMenuItem<String>> menuItems) {
   print('dropdown button');
    return DropdownButton<String>(
      value: dropDownValue == null ? 'USD' : dropDownValue,
      items: menuItems,
      onChanged: (value) {
        setState(() {
          dropDownValue = value;
          print(value);
          getConversionData0(value);
          getConversionData1(value);
          getConversionData2(value);
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker(List<Widget> menuItems) {
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);

        },
        children: menuItems);
  }



  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [];
    print('is anything wrking here?');


    for (int i = 0; i < currenciesList.length; i++) {
      menuItems.add(DropdownMenuItem(
        child: Text(
          currenciesList[i],
          style: kNumberTextStyle,
        ),
        value: currenciesList[i],
      ));
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Crypto'),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DisplayBox(conversionRate: conversionRate0, dropDownValue: dropDownValue, index: 0),
              DisplayBox(conversionRate: conversionRate1, dropDownValue: dropDownValue, index: 1),
              DisplayBox(conversionRate: conversionRate2, dropDownValue: dropDownValue, index: 2),
              Expanded(
                child: Container(
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 15.0),
                  height: 20.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Platform.isIOS? getCupertinoPicker(menuItems) : getDropDownMenu(menuItems),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({
    Key key,
    @required this.conversionRate,
    @required this.dropDownValue,
    @required this.index,
  }) : super(key: key);

  final int conversionRate;
  final String dropDownValue;
  final index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        onPressed: () {},
        colour: kActiveCardColor,
        cardChild: Center(
          child: Text(
            '1 ${cryptoList[index]} = $conversionRate $dropDownValue',
            style: kNumberTextStyle,
          ),
        ),
      ),
    );
  }
}
