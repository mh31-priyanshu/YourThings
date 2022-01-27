import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/homescreen/appdrawer.dart';
import 'package:yourthingss/homescreen/digitalclock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yourthingss/things/aboutyourthings.dart';
import 'package:yourthingss/things/addthingspage.dart';
import 'package:yourthingss/things/addthingtodatabase.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    double digitalClockContainerWidth = MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/2)+20;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd, yyyy').format(now);
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').doc(userModel.useruid).collection('Things').orderBy('created',descending: true).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if(snapshot.data == null) return CircularProgressIndicator();
          return Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Stack(
                  children:[
                    Image(
                      width: MediaQuery.of(context).size.width,
                      image: const AssetImage('banner.jpg')
                    ),
                    Positioned(
                      top: 35,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                isDrawerOpen==false? Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: GestureDetector(
                                    child: const Image(
                                      width: 25,
                                      image: AssetImage('menuicon.png')
                                    ),
                                    onTap: (){
                                      setState(() {
                                        xOffset = 230;
                                        yOffset = 150;
                                        scaleFactor = 0.6;
                                        isDrawerOpen = true;
                                      });
                                    },
                                  )
                                ):Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: GestureDetector(
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    onTap: (){
                                      setState(() {
                                        xOffset = 0;
                                        yOffset = 0;
                                        scaleFactor = 1;
                                        isDrawerOpen = false;
                                      });
                                    },
                                  )
                                ),
                                const Text(
                                  "Your",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'RobotoLight'
                                  ),
                                ),
                                const Text(
                                  "Things",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'RobotoLight'
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Colors.white60
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff887384),Color(0xffD1A7A2),Color(0xff71809A)]
                        ).createShader(bounds),
                        child:Container(height: 5,width: (MediaQuery.of(context).size.width/2)+20,color: Colors.white,),
                      )
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width/2)+20,
                      child: Container(
                        width: digitalClockContainerWidth,
                        height: 246,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              child: Container(
                                width: digitalClockContainerWidth,
                                height: 200,
                                color: Colors.black12,
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 30,
                              child: DigitalClock(),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 40,
                              child: Row(
                                children: [
                                  Container(
                                    child: CircularPercentIndicator(
                                      radius: 30,
                                      lineWidth: 3,
                                      percent: progressPercent(),
                                      backgroundColor: const Color(0xff3B4A68),
                                      progressColor: const Color(0xffDC9E88),
                                      circularStrokeCap: CircularStrokeCap.round,
                                      animation: true,
                                    )
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    progressPercentString() + "% done",
                                    style: const TextStyle(
                                      color: Colors.white54
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    )
                ]
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                      child: const Text(
                        "THINGS",
                        style: TextStyle(
                          color: Colors.black54
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: const EdgeInsets.fromLTRB(5, 30, 0, 0),
                          child: Container(
                            height: 3,
                            width: 3,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: Colors.black54
                          ),
                        ),
                        Positioned(
                          top: 35,
                          left: (snapshot.data.docs.length<10)?12.5:10,
                          child: Text(
                            snapshot.data.docs.length.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>AboutYourThing(DocumentID: snapshot.data.docs[index]['id'],))
                                );
                          },
                        onLongPress: (){
                          deleteThing(context,userModel.useruid,snapshot.data.docs[index]['id']);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child:Container(
                                      margin: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(width: 1, color: Colors.black12)
                                      ),
                                      child: Image(
                                        image: (snapshot.data.docs[index]['thingdone'])?const AssetImage('donethingicon.png'):const AssetImage('waitingthingicon.png'),
                                        width: 25,
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 35,),
                                  Column(
                                    children:[
                                      Text(
                                        snapshot.data.docs[index]['thing'],
                                        style: const TextStyle(
                                          color: Colors.black87
                                        ),
                                      ),
                                      const SizedBox(height: 3,),
                                      Text(
                                        DateTimeFormater(snapshot.data.docs[index]['time'],snapshot.data.docs[index]['date']),
                                        style: const TextStyle(
                                          color: Colors.black45
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-60,
                                height: 0.2,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // drawer: Container(
            //   width: 300,
            //   child: AppDrawer(),
            // ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>AddThingsPage())
                  );
                },
                backgroundColor: const Color(0xffDC9E88),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
                elevation: 5,
              ),
            ),
          );
        }
      ),
    );
  }
}

String DateTimeFormater(Timestamp time,Timestamp date){
  String Time = DateFormat('jm').format(time.toDate());
  String Date = DateFormat('MMM dd, yyyy').format(date.toDate());
  String DateTime = Time + ', '+ Date;
  return DateTime;
}

double progressPercent(){
  double percent = 0;
  getCurrentUserDataFunction();
  percent = (userModel.totalthingsdone/userModel.totalthings);
  if(userModel.totalthings==0){
    return 0;
  }
  getCurrentUserDataFunction();
  if(percent==0){
    return 0;
  }
  return percent;
}

String progressPercentString(){
  String percent = '';
  double doublepercent = 0;
  int intpercent = 0;
  getCurrentUserDataFunction();
  doublepercent = (userModel.totalthingsdone/userModel.totalthings)*100;
  if(userModel.totalthings==0){
    return '0';
  }
  getCurrentUserDataFunction();
  intpercent = doublepercent.toInt();
  percent = intpercent.toString();

  return percent;
}