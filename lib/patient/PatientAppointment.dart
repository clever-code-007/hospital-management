import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/doctor/doctorAppoinment.dart';
import 'package:hospital_management/doctor/doctorMedicine.dart';
import 'package:hospital_management/utils/size.dart';

class PatientAppointment extends StatefulWidget {
  TabController controller;
  PatientAppointment(this.controller);
  @override
  _PatientAppointmentState createState() => _PatientAppointmentState();
}

class _PatientAppointmentState extends State<PatientAppointment> {
  DatabaseReference medicaleDetail =
      FirebaseDatabase.instance.reference().child('medicale_detail');
  List<Icon> _iconList = [
    Icon(
      Icons.hearing_outlined,
      color: Colors.black38,
      size: 60,
    ),
    Icon(
      Icons.arrow_upward_rounded,
      color: Colors.black38,
      size: 48,
    ),
    Icon(
      Icons.water_damage_outlined,
      color: Colors.black38,
      size: 48,
    ),
    Icon(
      Icons.data_usage_sharp,
      color: Colors.black38,
      size: 48,
    ),
    Icon(
      Icons.line_weight_rounded,
      color: Colors.black38,
      size: 48,
    ),
    Icon(
      Icons.home_repair_service_outlined,
      color: Colors.black38,
      size: 48,
    )
  ];
  List<String> name = [
    "Blud Pressure",
    "Height",
    "Blud Group",
    "Age",
    "Weight",
    "Health",
  ];
  List<Icon> _iconsList2 = [
    Icon(
      Icons.calendar_today,
      color: Colors.lightGreen[200],
      size: 48,
    ),
    Icon(
      Icons.medical_services,
      color: Colors.lightGreen[200],
      size: 48,
    ),
    // Icon(
    //   Icons.book_rounded,
    //   color: Colors.lightGreen[200],
    //   size: 48,
    // ),
    // Icon(
    //   Icons.notification_important_rounded,
    //   color: Colors.lightGreen[200],
    //   size: 48,
    // )
  ];
  List<String> name2 = [
    "Appoinment",
    "Medicine",
    // "Report",
    // "Notification",
  ];
  List<dynamic> medicaleList = [
    "Loading..",
    "Loading..",
    "Loading..",
    "Loading..",
    "Loading..",
    "Loading..",
  ];

  @override
  void initState() {
    medicaleDetail.once().then((DataSnapshot snap) {
      var _data = snap.value[FirebaseAuth.instance.currentUser.uid];
      medicaleList.clear();
      String pressure = _data['Blud Pressure'];
      medicaleList.add(_data['Blud Pressure']);
      medicaleList.add(_data['Height:']);
      medicaleList.add(_data['Blud Group']);
      medicaleList.add(_data['Age']);
      medicaleList.add(_data['Weight']);
      String health = "null";
      int num = int.parse(pressure);
      if (_data['Blud Pressure'] == "null") {
        health = "null";
      } else {
        if (num < 95) {
          health = "65.00 %";
        } else if (num < 128) {
          health = "95.50 %";
        } else if (num > 128) {
          health = "55.50 %";
        }
      }
      medicaleList.add(health);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(50, 210, 210, 200),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: screenWidth * 0.03,
              right: screenWidth * 0.03,
            ),
            height: screenHeight * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[100],
              Colors.blue[200],
              Colors.blue[300],
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800],
              Colors.blue[900],
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: 78,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nitin Kanjariya",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("Nitin0561",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w400))
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      height: screenHeight * 0.06,
                      color: Colors.lightGreen[200],
                      onPressed: () {
                        setState(() {
                          widget.controller.index = 3;
                        });
                      },
                      child: Text("  My Account  "),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: screenHeight * 0.4,
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: _iconList.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _iconList[index],
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                medicaleList[index],
                                style: TextStyle(
                                    fontSize: 18.3,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(name[index],
                                  style: TextStyle(
                                      fontSize: 14.7,
                                      fontWeight: FontWeight.w400))
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: _iconsList2.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorAppoinment(
                                      FirebaseAuth.instance.currentUser.uid)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorMedicine(
                                    FirebaseAuth.instance.currentUser.uid),
                              ));
                        }
                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _iconsList2[index],
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              name2[index],
                              style: TextStyle(
                                  fontSize: 15.3, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
