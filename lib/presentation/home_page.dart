import 'package:flutter/material.dart';
import 'package:barberq/listTme.dart';
import 'package:barberq/presentation/reservation_page.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen();

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<ListTime> listtime;
  @override
  void initState() {
    
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
              Text("BarberQ", style: TextStyle(fontFamily: 'C_BOX', fontSize: 35),),
              Padding(padding: EdgeInsets.only(left:10)),
              Image.asset("images/Icon2.png", height: 50,width: 50,),
              ]),
          backgroundColor: Color(0xff2b3252),//navy0xff2b3252
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Choose a day for reservation  ",
              style: TextStyle(fontSize: 20, color: Color(0xffdcd4c0), fontFamily: 'CinzelDecorative-Bold'),
            ),
          ),
          
         
          Container(
            margin: EdgeInsets.all(10),
            child: Text("Today ${now.day}/ ${now.month}/ ${now.year}", style: TextStyle(fontSize: 25, color: Color(0xffdcd4c0), 
            fontFamily: 'CinzelDecorative-Bold'),),
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
                color: Color(0xffdcd4c0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: RawMaterialButton(
                onPressed: () {
                  print("testtt");
                },
                elevation: 15.0,
                fillColor: Color(0xffdcd4c0),
                child: Text(
                "Today",
                style: TextStyle(fontSize: 20,  fontWeight: FontWeight.bold,), 
              ),
                shape: CircleBorder(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xffdcd4c0),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Text(
                "Tomorrow",
                style: TextStyle(fontSize: 20,  fontWeight: FontWeight.bold,),
              ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 11,
                //padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
                itemBuilder: (BuildContext context, int index) {
                  return buildlisttime(context, index);
                }),
          ),
          Container(
            margin: EdgeInsets.only(top:10),
            child: FloatingActionButton(
              heroTag: Text("hero1"),
              onPressed:()=>{
                showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2018), 
                  lastDate: DateTime(2022),
                  )
         

              },
              child: Image.asset("images/calendar.png", width: 40, height: 40,), 
              backgroundColor: Color(0xffdcd4c0),
              
              ),
          )
        ]));
  }

  void navigatorToReservation(BuildContext context) async {
    final ListTime addpersonslist = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReservationScreen()));
    if (addpersonslist != null) {
      setState(() {
       
      });
      print("Success navigator to reservation page");
    }
  }


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
                          navigatorToReservation(context);
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
