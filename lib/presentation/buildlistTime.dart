import 'package:barberq/presentation/history_page.dart';
import 'package:flutter/material.dart';
import 'package:barberq/reserveInfo.dart';
import 'package:barberq/presentation/reservation_page.dart';

class BuildlistTime extends StatefulWidget {
  final  List<ReserveInfo> listtimes;
  BuildlistTime(this.listtimes);

  @override
  _BuildlistTimeState createState() => _BuildlistTimeState();
}

class _BuildlistTimeState extends State<BuildlistTime> {

  
  List<ReserveInfo> listtimes = [];
@override
  void initState() {
    listtimes = widget.listtimes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listtimes.length,
        //padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
        itemBuilder: (BuildContext context, int index) {

            return buildlisttime(context, index);
         
        });
  }

  void navigatorToReservation(
      BuildContext context, ReserveInfo _thisReserveInfo, int index) async {
    final ReserveInfo newreservation = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReservationScreen(_thisReserveInfo)));
    if (newreservation != null) {
      setState(() {
        listtimes[index] = newreservation;
      });
      print("Success navigator to reservation page");
    }
  }

  void navigatorToHistory(BuildContext context, DateTime _dateTime,
      ReserveInfo _revserveInfo) async {
    final ReserveInfo addpersonslist = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HistoryScreen(_dateTime, _revserveInfo)));
    if (addpersonslist != null) {
      setState(() {});
      print("Success navigator to AnotherDay page");
    }
  }

  void deleteQueue(BuildContext context, int index) {
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
              if (listtimes[index].time.hour != 12 &&
                  listtimes[index].reserved == true) {
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
                                  if (listtimes[index].reserved == false)
                                    Text(
                                      "<<---Empty--->>",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Chewy',
                                      ),
                                    ),
                                  if (listtimes[index].reserved == true)
                                    Text(
                                      "Name : ${listtimes[index].name}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Chewy',
                                      ),
                                    ),
                                  if (listtimes[index].reserved == true)
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
                              navigatorToReservation(
                                  context, listtimes[index], index);
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
