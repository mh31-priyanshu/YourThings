import 'package:flutter/material.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/entry/loginuser.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141C27),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 60, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CircleAvatar(
                  child: ClipRRect(
                      child: Image.asset('zayn.jpg'),
                      borderRadius: BorderRadius.circular(50.0),
                  ),
                  radius: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      Text(
                        userModel.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'RobotoLight',
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        userModel.medium,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                          fontFamily: 'RobotoLight',
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(width: 20,),
                    Icon(
                      Icons.home_rounded,
                      color: Colors.white70,
                      size: 26,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 20,),
                    Icon(
                      Icons.person_rounded,
                      color: Colors.white70,
                      size: 26,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 20,),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white70,
                      size: 26,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Schedule",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 20,),
                    Icon(
                      Icons.add_task_rounded,
                      color: Colors.white70,
                      size: 26,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Add Things",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 20,),
                    Icon(
                      Icons.settings_rounded,
                      color: Colors.white70,
                      size: 26,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 40),
            child: GestureDetector(
              onTap: () async {
                await signOut();
                Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context)=>const LoginPage())
                );
              },
              child: Row(
                children:[
                  Container(
                    height: 20,
                    width: 2,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 10,),
                  const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}