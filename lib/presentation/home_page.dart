import 'package:barberq/presentation/history_page.dart';
import 'package:flutter/material.dart';
import 'package:barberq/reserveInfo.dart';
import 'package:barberq/presentation/reservation_page.dart';
import 'package:barberq/presentation/anotherDay_page.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen();

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  DateTime _dateTime;
  bool todayClicked;
  bool tomorrowClicked;
  List<ReserveInfo> listtimes = [];
  @override
  void initState() {
    listtimes = [
      ReserveInfo(TimeOfDay(hour: 9, minute: 0), "Boat", "0986706456", true, true, true, true),
      ReserveInfo(TimeOfDay(hour: 10, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 11, minute: 0), "Roon", "0864244489", true, true, false, false),
      ReserveInfo(TimeOfDay(hour: 12, minute: 0), "", "", true, false, false, false),
      ReserveInfo(TimeOfDay(hour: 13, minute: 0), "", "", false, false, false, false ),
      ReserveInfo(TimeOfDay(hour: 14, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 15, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 16, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 17, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 18, minute: 0), "", "", false, false, false, false),
      ReserveInfo(TimeOfDay(hour: 19, minute: 0), "", "", false, false, false, false),
    ];
    todayClicked = false;
    tomorrowClicked = true;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Choose a day for reservation  ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffdcd4c0),
                      fontFamily: 'CinzelDecorative-Bold'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (todayClicked)
                      Text(
                        "${now.day}/ ${now.month}/ ${now.year}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffdcd4c0),
                            fontFamily: 'CinzelDecorative-Bold'),
                      ),
                    if (tomorrowClicked)
                      Text(
                        "${now.day + 1}/ ${now.month}/ ${now.year}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffdcd4c0),
                            fontFamily: 'CinzelDecorative-Bold'),
                      ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: todayClicked
                            ? Colors.green[300]
                            : Color(0xffdcd4c0), //Color(0xffdcd4c0)
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            todayClicked = true;
                            tomorrowClicked = false;
                          });
                        },
                        elevation: 2.0,
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // shape: CircleBorder(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: tomorrowClicked
                            ? Colors.green[300]
                            : Color(0xffdcd4c0),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            todayClicked = false;
                            tomorrowClicked = true;
                          });
                        },
                        elevation: 15.0,
                        child: Text(
                          "Tomorrow",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // shape: CircleBorder(),
                      ),
                    ),
                  ]),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listtimes.length,
                    //padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
                    itemBuilder: (BuildContext context, int index) {
                      return buildlisttime(context, index);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FloatingActionButton(
                  heroTag: Text("hero1"),
                  onPressed: () => {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2022),
                    ).then((date) => {
                          setState(() {
                            _dateTime = date;
                          }),
                          if (_dateTime != null)
                            {navigatorToAnotherDay(context, _dateTime)}
                        }),
                  },
                  child: Image.asset(
                    "images/calendar.png",
                    width: 40,
                    height: 40,
                  ),
                  backgroundColor: Color(0xffdcd4c0),
                ),
              )
            ]));
  }

  void navigatorToReservation(BuildContext context, ReserveInfo _thisReserveInfo, int index) async {
    final ReserveInfo newreservation = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ReservationScreen(_thisReserveInfo)));
    if (newreservation != null) {
      setState(() {
        listtimes[index] = newreservation;
      });
      print("Success navigator to reservation page");
    }
  }

  void navigatorToAnotherDay(BuildContext context, DateTime _dateTime) async {
    final ReserveInfo addpersonslist = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AnotherDayScreen(_dateTime)));
    if (addpersonslist != null) {
      setState(() {});
      print("Success navigator to AnotherDay page");
    }
  }

  void navigatorToHistory(BuildContext context, DateTime _dateTime, ReserveInfo _revserveInfo) async {
    final ReserveInfo addpersonslist = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => HistoryScreen(_dateTime, _revserveInfo)));
    if (addpersonslist != null) {
      setState(() {});
      print("Success navigator to AnotherDay page");
    }
  }
 
  void deleteQueue(BuildContext context, int index){
      showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                      "Are you sure you want to delete queue ${listtimes[index].name}?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        setState(() { 
                          listtimes[index].reserved = false;
                          listtimes[index].cutService = false;
                          listtimes[index].washService = false;
                          listtimes[index].shavingService = false;
                          });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
  }

  Widget buildlisttime(BuildContext context, int index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              if (listtimes[index].time.hour != 12 && listtimes[index].reserved == true) {
                navigatorToHistory(context, DateTime.now(), listtimes[index]);
              }
            },
            elevation: 15.0,
            child: Container(
                alignment: Alignment.centerRight,
                height: 100,
                width: 400,
                margin: EdgeInsets.only(bottom: 10, left: 5),
                decoration: BoxDecoration(
                  color: listtimes[index].reserved
                      ? Colors.red[300]
                      : Color(0xffdcd4c0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (listtimes[index].reserved)
                            Image.asset(
                              "images/bookmark.png",
                              width: 40,
                              height: 40,
                            ),
                        ]),
                    if (listtimes[index].time.hour == 9)
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                        child: Text(
                          "0${listtimes[index].time.hour}:00",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    if (listtimes[index].time.hour != 9)
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Text(
                          "${listtimes[index].time.hour}:00",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    if (listtimes[index].time.hour != 12)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if(listtimes[index].reserved == false)
                                  Text(
                                    "<<---Empty--->>",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Chewy',
                                    ),
                                  ),
                                  if(listtimes[index].reserved == true)
                                  Text(
                                    "Name : ${listtimes[index].name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Chewy',
                                    ),
                                  ),
                                   if(listtimes[index].reserved == true)
                                  Text(
                                    "Phone : ${listtimes[index].phone} ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Chewy',
                                    ),
                                  ),
                                ])),
                      ),
                    if (listtimes[index].time.hour == 12)
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Take  lunch break",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Chewy',
                                  ),
                                ),
                              ])),
                    if (listtimes[index].time.hour != 12 &&
                        listtimes[index].reserved == false)
                      Expanded(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: RawMaterialButton(
                            onPressed: () {
                              navigatorToReservation(context, listtimes[index], index);
                            },
                            elevation: 2.0,
                            fillColor: Color(0xffdcd4c0),
                            child: Image.asset(
                              "images/add-bookmark.png",
                              height: 40,
                              width: 40,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    if (listtimes[index].time.hour != 12 &&
                        listtimes[index].reserved == true)
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          child: RawMaterialButton(
                            onPressed: () {
                              deleteQueue(context, index);
                            },
                            elevation: 2.0,
                            fillColor: Color(0xffdcd4c0),
                            child: Image.asset(
                              "images/remove.png",
                              height: 30,
                              width: 30,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    if (listtimes[index].time.hour == 12)
                      Expanded(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "images/lunch.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                  ],
                )),
          ),
        ]);
  }
}
