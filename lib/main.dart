import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {

  double firstNum;
  double secondNum;
  String texttodisplay = '';
  String result;
  String operatorToPerform;

  void btnclicked(String btnvalue) {
    if(btnvalue=='C'){
      texttodisplay = '';
      firstNum=0;
      secondNum=0;
      result='';
    }
    else if(btnvalue == '+' || btnvalue == '-' || btnvalue == '*' || btnvalue == '/') {
       firstNum = double.parse(texttodisplay);
       result = '';
       operatorToPerform = btnvalue;
    }
    else if(btnvalue == '.') {
      if(result.contains('.')) {
        print("Already contains a decimals");
        return;
      }
      else {
        result = result + btnvalue;
      }
    }
    else if(btnvalue == '=') {

      secondNum = double.parse(texttodisplay);
      if (operatorToPerform == '+') {
        result = (firstNum + secondNum).toString();
      }
      if (operatorToPerform == '-') {
        result = (firstNum - secondNum).toString();
      }
      if (operatorToPerform == '*') {
        result = (firstNum * secondNum).toString();
      }
      if (operatorToPerform == '/') {
        result = (firstNum / secondNum).toString();
      }
    }
    else {
      result = int.parse(texttodisplay + btnvalue) .toString();
    }

    setState(() {
      texttodisplay = result;
    });

  }

  Widget custombutton(String btnvalue){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          '$btnvalue',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  '$texttodisplay',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('.'),
                custombutton('0'),
                custombutton('00'),
                custombutton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('C'),
                custombutton('='),
              ],
            ),
          ],
        ),
      )
    );
  }
}