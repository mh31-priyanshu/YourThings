import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/things/addthingtodatabase.dart';

class AddThingsPage extends StatefulWidget {
  AddThingsPage({Key? key}) : super(key: key);

  @override
  _AddThingsPageState createState() => _AddThingsPageState();
}

class _AddThingsPageState extends State<AddThingsPage> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  TextEditingController thingInputController= TextEditingController();
  TextEditingController descriptionInputController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    String formattedDate =  DateFormat('MMM dd, yyyy').format(date);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color(0xff141C27),
      body: Column(
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
                  "Add new thing",
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
                image: AssetImage('brushicon.png'),
                width: 30,
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: thingInputController,
                    cursorColor: const Color(0xffDC9E88),
                    cursorWidth: 1,
                    cursorHeight: 20,
                    decoration: const InputDecoration(
                      labelText: 'To Do Thing',
                      labelStyle: TextStyle(
                        color: Colors.white30
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white30
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white30
                        )
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white70
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: descriptionInputController,
                    cursorColor: const Color(0xffDC9E88),
                    cursorWidth: 1,
                    cursorHeight: 20,
                    decoration: const InputDecoration(
                      labelText: 'More about your thing',
                      labelStyle: TextStyle(
                        color: Colors.white30
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white30
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white30
                        )
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white70
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 15
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return buildDatePicker();
                                }
                              );
                            }, 
                            child: const Text("Set Date"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color(0xff27374D);
                                  }
                                  return const Color(0xff27374D); // Use the component's default.
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 140,
                    child: CupertinoTheme(
                      data: const CupertinoThemeData(
                        brightness: Brightness.dark
                      ),
                      child: CupertinoDatePicker(
                        initialDateTime: time,
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (time){
                          setState(() {
                            this.time = time;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async{
                        await addThings(userModel.useruid, thingInputController.text, descriptionInputController.text, date, time);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add Thing",
                        style: TextStyle(
                          color: Colors.white
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
            ),
          )
        ],
      ),
    );
  }
  Widget buildDatePicker (){ return Stack(
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(10, 240, 10, 0),
        height:220,
        width: MediaQuery.of(context).size.width-20,
        decoration: const BoxDecoration(
          color: Color(0xff141C27),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
      Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 250, 20, 0),
            height: 140,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark
              ),
              child: CupertinoDatePicker(
                minimumYear: 2020,
                maximumYear: 2025,
                initialDateTime: date,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date){
                  setState(() {
                    this.date = date;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text(
                "Done",
                style: TextStyle(
                  color: Colors.white70
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
            ),
          )
        ],
      ),
    ],
  );}
}