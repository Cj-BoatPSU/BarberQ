import 'package:flutter/material.dart';
//import 'package:barberq/presentation/reservation_page.dart';

class AnotherDayScreen extends StatefulWidget {
  final DateTime _dateTime;
  AnotherDayScreen(this._dateTime);

  @override
  _AnotherDayScreenState createState() => _AnotherDayScreenState();
}

class _AnotherDayScreenState extends State<AnotherDayScreen> {
  DateTime _dateTime;
  @override
  void initState() {
   _dateTime = widget._dateTime;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151e3d),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
       title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("BarberQ", style: TextStyle(fontFamily: 'C_BOX', fontSize: 35),),
              Padding(padding: EdgeInsets.only(left:10)),
              Image.asset("images/Icon2.png", height: 50,width: 50,),
              ]),
          backgroundColor: Color(0xff2b3252),//navy0xff2b3252
      ),
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            "${_dateTime.day}/ ${_dateTime.month}/ ${_dateTime.year}",
             style: TextStyle(fontSize: 25, color: Color(0xffdcd4c0), 
             fontFamily: 'CinzelDecorative-Bold'),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return buildlisttime(context, index);
              }),
        ),
      ]),
    );
  }


// void navigatorToReservation(BuildContext context) async {
//     final ReserveInfo resultreservation = await Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ReservationScreen()));
//     if (resultreservation != null) {
//       setState(() {
       
//       });
//       print("Success navigator to reservation page");
//     }
//   }

  Widget buildlisttime(BuildContext context, int index) {
    return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
            Container(
              alignment: Alignment.center,
                height: 100,
                width: 400,
                margin: EdgeInsets.only(bottom : 10, left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Color(0xffdcd4c0),
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
                        Image.asset("images/bookmark.png", width: 40, height: 40,),
                    ]),
                
                   Text(" 9:00 ",
                    style: TextStyle(fontSize: 40),),
               
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name : Boat", style: TextStyle(fontSize: 18, fontFamily: 'Chewy' ,),),
                          Text("Phone : 098-670xxxxx ", style: TextStyle(fontSize: 18, fontFamily: 'Chewy' ,),),
                        ]
                      )
                    ),
                    FloatingActionButton(
                      heroTag: Text("hero2"),
                      backgroundColor: Color(0xffdcd4c0),
                      onPressed: (){
                         // navigatorToReservation(context);
                    }, 
                    child: 
                    Image.asset("images/add-bookmark.png")
                    )
                    
                  ],
                )),
          ]),
        ]);
  }
}
