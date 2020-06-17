import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piggyvest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Interest Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> period = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Interest Calculator',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              'Amount',
              style: TextStyle(fontSize: 15.5),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                //hintText: title,
                filled: true,
                fillColor: Color.fromRGBO(0, 0, 0, 0.07),
                focusColor: Colors.grey,
                hoverColor: Colors.grey,
                hintStyle: TextStyle(color: Colors.white),

                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Interest Rate Per Annum(%)',
              style: TextStyle(fontSize: 15.5),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(0, 0, 0, 0.07),
                focusColor: Colors.grey,
                hoverColor: Colors.grey,
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Period:',
                  style: TextStyle(fontSize: 15.5),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.07),
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ToggleButtons(
                constraints: BoxConstraints(
                  //maxWidth: (MediaQuery.of(context).size.width - 40) / 3,
                  minWidth: (MediaQuery.of(context).size.width - 40) / 3.04,
                  minHeight: 50,
                ),
                children: [
                  Text(
                    'Days',
                  ),
                  Text(
                    'Month',
                  ),
                  Text(
                    'Years',
                  ),
                ],
                isSelected: period,
                selectedColor: Colors.blue,
                selectedBorderColor: Colors.blue,
                focusColor: Colors.blue,
                onPressed: (index) {
                  switch (index) {
                    case 0:
                      setState(() {
                        period = [true, false, false];
                      });
                      break;
                    case 1:
                      setState(() {
                        period = [false, true, false];
                      });
                      break;
                    case 2:
                      setState(() {
                        period = [false, false, true];
                      });
                      break;
                    default:
                  }
                },
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: (context),
                    builder: (BuildContext context) {
                      return ResultModal();
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Calculate Interest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultModal extends StatelessWidget {
  const ResultModal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.height * 0.45,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  'Your interest for 6 months would be \$500',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  fillColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  constraints: BoxConstraints.tightForFinite(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okay',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
