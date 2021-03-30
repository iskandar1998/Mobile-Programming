import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ABSI Calculator",
    theme: ThemeData(
        brightness: Brightness.dark, // for backgrund color
        primaryColor: Colors.indigo, //for app bar
        accentColor: Colors.indigoAccent //for overscoll edge effect and nobs
        ),
    home: Scaffold(
        appBar: AppBar(
          title: Text("ABSI Calculator"),
        ),
        body: SIform()),
  ));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return form();
  }
}

class form extends State<SIform> {
  static const _currencies1 = ['Male', 'Women'];
  String currencies1 = _currencies1[0];
  static const _currencies2 = ['Years'];
  String currencies2 = _currencies2[0];
  static const _currencies3 = ['cm', 'm', 'in', 'ft'];
  String currencies3 = _currencies3[0];
  static const _currencies4 = ['kg', 'ib', 'stone'];
  String currencies4 = _currencies4[0];
  static const _currencies5 = ['cm', 'm', 'in'];
  String currencies5 = _currencies5[0];

  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController waist = TextEditingController();

  String displayresult = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Sex",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Container(width: 20.0),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies1.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      value: currencies1,
                      onChanged: (String valueselected) {
                        setState(() {
                          currencies1 = valueselected;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          controller: age,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              hintText: 'In year',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))))),
                  Container(width: 20.0),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies2.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      value: currencies2,
                      onChanged: (String valueselected) {
                        setState(() {
                          currencies2 = valueselected;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          controller: height,
                          decoration: InputDecoration(
                              labelText: 'Height',
                              hintText: 'cm / m',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))))),
                  Container(width: 20.0),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies3.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      value: currencies3,
                      onChanged: (String valueselected) {
                        setState(() {
                          currencies3 = valueselected;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          controller: weight,
                          decoration: InputDecoration(
                              labelText: 'Weight',
                              hintText: 'kg',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))))),
                  Container(width: 20.0),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies4.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      value: currencies4,
                      onChanged: (String valueselected) {
                        setState(() {
                          currencies4 = valueselected;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          controller: waist,
                          decoration: InputDecoration(
                              labelText: 'Waist circumference',
                              hintText: 'cm / m',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))))),
                  Container(width: 20.0),
                  Expanded(
                    child: DropdownButton<String>(
                      items: _currencies5.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                      value: currencies5,
                      onChanged: (String valueselected) {
                        setState(() {
                          currencies5 = valueselected;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: 125.0,
                    height: 50.0,
                    child: RaisedButton(
                        child: Text(
                          "Calculate",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        elevation: 6.0,
                        onPressed: () {
                          setState(() {
                            this.displayresult = _calculatetotareturns();
                          });
                        }),
                  )),
                  Container(width: 10.0),
                  Expanded(
                      child: Container(
                    width: 125.0,
                    height: 50.0,
                    child: RaisedButton(
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        elevation: 6.0,
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        }),
                  ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                displayresult,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }

  String _calculatetotareturns() {
    double t1 = double.parse(height.text) / 100;
    double t2 = double.parse(weight.text);
    double t3 = double.parse(waist.text);

    double BMI = t2 / (t1 * t1);
    double ABSI = (t3 / (pow(BMI, 2 / 3) * pow(t1, 1 / 2))) / 100;

    String result = "Result ABSI = $ABSI";

    return result;
  }

  void _reset() {
    age.text = "";
    height.text = "";
    weight.text = "";
    waist.text = "";
    displayresult = "";
  }
}
