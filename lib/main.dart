import 'package:flutter/material.dart';

import 'classes/customColorScheme.dart';
import 'classes/billData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: customColorScheme().primary,
        primaryColorDark: customColorScheme().primaryDark,
        accentColor: customColorScheme().accent,
        accentIconTheme: IconThemeData(color: Colors.white),
        errorColor: customColorScheme().warning,
      ),
      home: MyHomePage(title: "Cisco Bill"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final _scaffoldkey = new GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  final names = [
    "Sijan Khadka",
    "Miran Bhattrai",
    "Suraj Karki",
    "Sagar Aryal"
  ];
  final dates = [
    "Monday, 2 2018",
    "Tuesday, 3 2018",
    "Wednesday, 4 2018",
    "Thursday, 5 2018",
  ];
  final prices = [2000, 500, 2000, 100000];
  final items = [
    ["Facebook Boosting", "Digital Marketing"],
    ["Logo design"],
    ["Video Editing", "Facebook Boosting", "Video Shooting"],
    ["Cafe Management Softwaree"]
  ];
  final billDatas = new List<billData>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      billDatas.add(billData(names[i], dates[i], items[i], prices[i]));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    billDatas.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          widget.title,
          style: TextStyle(
              fontFamily: "Abel", fontSize: 45.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: PageView.builder(
              itemCount: billDatas.length,
              pageSnapping: true,
              itemBuilder: (context, index) {
                return billInfo(billDatas.elementAt(index));
              },
            )),
          ],
        ),
      ),
    );
  }
}

class billInfo extends StatefulWidget {
  billData data;
  GlobalKey key;
  billInfo(this.data);
  @override
  _billInfoState createState() {
    // TODO: implement createState
    return _billInfoState();
  }
}

class _billInfoState extends State<billInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.only(bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      child: Material(
        type: MaterialType.card,
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: customColorScheme().accent))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          // border: Border(bottom: BorderSide(color: customColorScheme().accent))
                          ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.data.customerName}",
                            style: TextStyle(
                                fontFamily: "QuickSand",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${widget.data.billDate}",
                            style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black54,
                                fontFamily: "Abel",
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${widget.data.billItems.elementAt(0)}",
                                  style: TextStyle(
                                      fontSize: 8.0,
                                      fontFamily: "Oswald",
                                      color: Colors.grey),
                                ),
                                Text(
                                  "Price Rs.${widget.data.billPrice}/-",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: "QuickSand",
                                      color: customColorScheme().primaryDark,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // _scaffoldkey.currentState
                  //     .showBottomSheet((BuildContext context) {
                  //   return new Container(
                  //       child: new Row(
                  //     children: <Widget>[
                  //       Column(
                  //         children: <Widget>[],
                  //       )
                  //     ],
                  //   ));
                  // });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "VIEW INFO",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: "Noto",
                          color: customColorScheme().primary),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                      color: customColorScheme().primary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
