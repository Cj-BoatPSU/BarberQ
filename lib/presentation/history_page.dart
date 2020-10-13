import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final DateTime _dateTime;
  HistoryScreen(this._dateTime);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime _datetime;
  @override
  void initState() {
    _datetime = widget._dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      backgroundColor: Color(0xff151e3d),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "BarberQ",
                style: TextStyle(fontFamily: 'C_BOX', fontSize: 35),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Image.asset(
                "images/Icon2.png",
                height: 50,
                width: 50,
              ),
            ]),
        backgroundColor: Color(0xff2b3252), //navy0xff2b3252
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffdcd4c0),
                    width: 5,
                  ),
                ),
                child: Text(
                  "Today ${_datetime.day}/ ${_datetime.month}/ ${_datetime.year}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffdcd4c0),
                      fontFamily: 'CinzelDecorative-Bold'),
                ),
              )),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Time : ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffdcd4c0),
                            )),
                        Container(
                          //alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            //color: Colors.white10,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Text("${now.hour}.00 - ${now.hour+1}.00 ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffdcd4c0),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              buildTextFieldName(),
              buildTextFieldPhone(),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Service : ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffdcd4c0),
                      fontFamily: 'CinzelDecorative-Bold'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Color(0xffdcd4c0),
                            child: Image.asset(
                              "images/barber-scissors.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 5,
                            ),
                          ),
                        ),
                        Text(
                          "Cut",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffdcd4c0),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Merienda'),
                        ),
                      ],
                    ),
                    Column(children: <Widget>[
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Color(0xffdcd4c0),
                          child: Image.asset(
                            "images/hair-washing-sink.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                      ),
                      Text(
                        "Wash",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffdcd4c0),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merienda'),
                      ),
                    ]),
                    Column(children: <Widget>[
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Color(0xffdcd4c0),
                          child: Image.asset(
                            "images/Shaving.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                      ),
                      Text(
                        "Shaving",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xffdcd4c0),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merienda'),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldName() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Name : ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              )),
          Container(
            decoration: BoxDecoration(
            //  color: Colors.white10,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 280,
            child: Text(
              "Boat",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextFieldPhone() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Phone : ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              )),
          Container(
            decoration: BoxDecoration(
              //color: Colors.white10,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 280,
            child: Text(
              "098-6706456",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
