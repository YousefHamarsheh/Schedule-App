// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static var now = DateTime.now();
  List<Widget> satClasses = [
    const SizedBox(
      height: 20,
    ),
    buildClassItem("10:00", "AM", "COMP433: Software", "Rights - ALSADIK408"),
    const SizedBox(
      height: 20,
    ),
    buildClassItem("11:25", "AM", "COMP438: Encryption",
        "IT - Sat: Masri109, Mon: Masri406"),
    const SizedBox(
      height: 20,
    ),
  ];

  List<Widget> monClasses = [
    const SizedBox(
      height: 20,
    ),
    buildClassItem("11:25", "AM", "COMP438: Encryption",
        "IT - Sat: Masri109, Mon: Masti406"),
  ];

  List<Widget> tueAndThuClasses = [
    const SizedBox(
      height: 20,
    ),
    buildClassItem(
        "8:00", "AM", "CULS332: Arabic culture", "Adab - A.Shaheen150"),
    const SizedBox(
      height: 20,
    ),
    buildClassItem(
        "10:00", "PM", "MATH330: Numerical methods", "Sceince - SCI213"),
    const SizedBox(
      height: 20,
    ),
    buildClassItem("12:50", "PM", "COMP336: Algorithm", "IT - Masri404"),
  ];

  List<Widget> wedClasses = [
    const SizedBox(
      height: 20,
    ),
    buildClassItem("10:00", "AM", "COMP433: Software", "Rights - ALSADIK408"),
  ];

  List<Widget> noneClasses = [
    const SizedBox(
      height: 20,
    ),
    buildClassItem("0:00", "AM", "None", "None"),
  ];

  List<Widget> getClasses() {
    String dayOfWeek = DateFormat('EEEE').format(now).substring(0, 3);
    if (dayOfWeek.contains("Th") || dayOfWeek.contains("Tue")) {
      return tueAndThuClasses;
    } else if (dayOfWeek.contains("Mon")) {
      return monClasses;
    } else if (dayOfWeek.contains("Sat")) {
      return satClasses;
    } else if (dayOfWeek.contains("Wed")) {
      return wedClasses;
    } else {
      return noneClasses;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF008000),
              Color(0xFFF9F9FB),
            ], begin: Alignment.topRight
                // end: Alignment.bottomCenter,
                ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: DateFormat('EEEE').format(now).substring(0, 3) + " ",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      TextSpan(
                        text: now.day.toString() +
                            " " +
                            DateFormat("MMMM").format(now).substring(0, 3),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 8,
                          )
                        ],
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://scontent.fjrs2-2.fna.fbcdn.net/v/t39.30808-6/240101929_1645254012338697_2205819092647647933_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=DlM3c0NqbOQAX82GkEl&_nc_ht=scontent.fjrs2-2.fna&oh=7d66860d722807eaa80548c46444cda0&oe=615F5611"),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi Fares",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ID: 1190714",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 185,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 230,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            //////////////////
            ///Here is where the white space must be filled with a child component///////
            //////////////
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Today Classes",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                //////////////////
                ///Classes will be filled here
                //////////////////
                ///Start
                // const SizedBox(
                //   height: 20,
                // ),
                // buildClassItem(
                //     "8:00", "AM", "COMP438: Android", "IT - Masri109"),
                // const SizedBox(
                //   height: 20,
                // ),
                // buildClassItem("10:00", "AM", "COMP334: Web", "IT - Masri306"),
                // const SizedBox(
                //   height: 20,
                // ),
                // buildClassItem(
                //     "12:40", "PM", "COMP336: Algorithm", "IT - Masri404"),
                Column(
                  children: <Widget>[
                    for (int i = 0; i < getClasses().length; i++)
                      getClasses()[i],
                  ],
                )
                /////////////////
                ///End of class////
                ///
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Container buildClassItem(
    String time,
    String timeType,
    String studentClass,
    String placeClass,
  ) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                timeType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    studentClass,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    child: Text(
                      placeClass,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
