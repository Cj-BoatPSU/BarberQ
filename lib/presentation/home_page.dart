import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen();

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("BarberQ"),
        ),
        body: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Choose the day you want to  reserve the queue.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text("Today ${now.day}/ ${now.month}/ ${now.year}", style: TextStyle(fontSize: 18),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Container(
               margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xffffc300),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Text(
                "Today",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xffffc300),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Text(
                "Tomorrow",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 11,
                padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
                itemBuilder: (BuildContext context, int index) {
                  return buildlisttime(context, index);
                }),
          ),
          Container(
            child: FloatingActionButton(
              onPressed:(){
                showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2018), 
                  lastDate: DateTime(2022),
                  );
              },
              child: Image.asset("images/calendar.png"), 
              backgroundColor: Colors.white,
              
              ),
          )
        ]));
  }

  Widget buildlisttime(BuildContext context, int index) {
    return Column(
       // mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.,
        children: <Widget>[
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start, 
            children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
                height: 100,
                width: 340,
                margin: EdgeInsets.only(bottom : 10),
                decoration: BoxDecoration(
                  color: Color(0xffffc300),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(" 9:00 ",
                    style: TextStyle(fontSize: 25),),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name : Boat"),
                          Text("Phone : 098-670xxxxx "),
                        ]
                      )
                    ),
                    Image.asset("images/add-bookmark.png")
                  ],
                )),
          ]),
        ]);
  }
}
