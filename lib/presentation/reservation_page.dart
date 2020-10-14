import 'package:flutter/material.dart';
import 'package:barberq/reserveInfo.dart';

class ReservationScreen extends StatefulWidget {
  final ReserveInfo _reserveInfo;
  ReservationScreen(this._reserveInfo);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController _textNameController;
  TextEditingController _textPhoneController;
  ReserveInfo _thisreserveInfo;
  @override
  void initState() {
    _thisreserveInfo = widget._reserveInfo;
    _textNameController = TextEditingController();
    _textPhoneController = TextEditingController();
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
                  "Today ${now.day}/ ${now.month}/ ${now.year}",
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
                    //padding: EdgeInsets.symmetric(vertical: 10),
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
                              Text(
                                  "${_thisreserveInfo.time.hour}.00 - ${_thisreserveInfo.time.hour + 1}.00 ",
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
                            color: _thisreserveInfo.cutService
                                ? Colors.green[300]
                                : Color(0xffdcd4c0),
                            child: RawMaterialButton(
                              child: Image.asset(
                                "images/barber-scissors.png",
                                height: 60,
                                width: 60,
                              ),
                              onPressed: () {
                                setState(() {
                                  _thisreserveInfo.cutService =
                                      !_thisreserveInfo.cutService;
                                });
                              },
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
                          color: _thisreserveInfo.washService
                              ? Colors.green[300]
                              : Color(0xffdcd4c0),
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                _thisreserveInfo.washService =
                                    !_thisreserveInfo.washService;
                              });
                            },
                            child: Image.asset(
                              "images/hair-washing-sink.png",
                              height: 60,
                              width: 60,
                            ),
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
                          color: _thisreserveInfo.shavingService
                              ? Colors.green[300]
                              : Color(0xffdcd4c0),
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                _thisreserveInfo.shavingService =
                                    !_thisreserveInfo.shavingService;
                              });
                            },
                            child: Image.asset(
                              "images/Shaving.png",
                              height: 60,
                              width: 60,
                            ),
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
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    child: RawMaterialButton(
                      onPressed: () {
                        addReserved();
                      },
                      elevation: 15.0,
                      fillColor: Color(0xffdcd4c0),
                      child: Image.asset(
                        "images/barber-chair.png",
                        height: 55,
                        width: 55,
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  void addReserved() {
    ReserveInfo _newreserved = _thisreserveInfo;
    if(_textNameController.text != "" && _textPhoneController.text != "")
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Confirm Reservation",
            style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold,),),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                onPressed: () {
                   setState(() {
                    _newreserved.name = _textNameController.text;
                    _newreserved.phone = _textPhoneController.text;
                    _newreserved.reserved = true;
                  });
                  Navigator.of(context).pop();
                  Navigator.pop(context, _newreserved);
                },
              ),
              FlatButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onPressed: () {
                   Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
        if(_textNameController.text == "" || _textPhoneController.text == "")
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Please fill in all required information.", 
            style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold,),),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                onPressed: () {
                   setState(() {
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
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
              color: Colors.white10,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 280,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _textNameController,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              ),
              cursorColor: Color(0xffdcd4c0),
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
              color: Colors.white10,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 280,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _textPhoneController,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffdcd4c0),
              ),
              cursorColor: Color(0xffdcd4c0),
              keyboardType: TextInputType.phone,
            ),
          )
        ],
      ),
    );
  }
}
