import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/things/addthingtodatabase.dart';

class AboutYourThing extends StatefulWidget {
  final String DocumentID;
  const AboutYourThing({Key? key,required this.DocumentID}) : super(key: key);

  @override
  _AboutYourThingState createState() => _AboutYourThingState();
}

class _AboutYourThingState extends State<AboutYourThing> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String formattedDate =  DateFormat('MMM dd, yyyy').format(date);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xff141C27),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').doc(userModel.useruid).collection('Things').doc(widget.DocumentID).snapshots(),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if(snapshot.data == null) return CircularProgressIndicator();
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Image(
                        image: AssetImage('backarrowicon.png'),
                        width: 40,
                      ),
                    ),
                    const Text(
                      "About Your Thing",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white70
                      ),
                    ),
                    const SizedBox(width: 30,)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child:Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: Colors.white60)
                  ),
                  child: const Image(
                    image: AssetImage('aboutthingicon.png'),
                    width: 32,
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "To Do Thing",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            snapshot.data['thing'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width-50,
                            height: 1,
                            color: Colors.white30,
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            snapshot.data['description'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width-50,
                            height: 1,
                            color: Colors.white30,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          const Text(
                            "Time",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            TimeFormater(snapshot.data['time']),
                            style:const TextStyle(
                              color: Colors.white70,
                              fontSize: 18
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.white30,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            DateFormater(snapshot.data['date']),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40,),
                    Container(
                      child: ElevatedButton(
                        onPressed: (){
                          if(snapshot.data['thingdone']){
                            markThingAsOngoing(userModel.useruid,snapshot.data['id']);
                          }else{
                            markThingAsDone(userModel.useruid,snapshot.data['id']);
                          }
                          Navigator.pop(context);
                        },
                        child:Text(
                          (snapshot.data['thingdone'])?"Mark as Ongoing":"Mark as Done",
                          style: const TextStyle(
                            color: Colors.black54
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color(0xffDC9E88);
                              }
                              return const Color(0xffDC9E88); // Use the component's default.
                            },
                          ),
                      ),
                    )
                    )],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

String TimeFormater(Timestamp time){
  String Time = DateFormat('jm').format(time.toDate());
  return Time;
}
String DateFormater(Timestamp date){
  String Date = DateFormat('MMM dd, yyyy').format(date.toDate());
  return Date;
}