import 'package:flutter/material.dart';

String AppTitle = "Classed";

String MainPageInfo =
    "Proposed system is placed above the black board of the classroom "
    "and automatically it will process the attendance once class period is started "
    "This Project first live-captures an visual of all the authorized persons and stores "
    "the information into database.";

String Infoonhome =
    "By Enter Your Name and RRN, The system will capture your image and "
    "and make upload to the dataset";

SizedBox Div = const SizedBox(
  height: 10,
  width: 8,
);

ThemeData CustomTheme = ThemeData(
  textTheme: const TextTheme(
    caption: TextStyle(color: Colors.black),
    headline1: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.blueGrey[50],
  cardColor: Colors.blueGrey,
  splashColor: Colors.blueGrey,
  appBarTheme: AppBarTheme(color: Colors.amber[100]),
);

Color? inactiveColor = Colors.amber[50];

Color? CustomClrBar = Colors.blueGrey[600];
Color? CustomunClrBar = Colors.blueGrey[50];
Color? TextClr = Colors.black;

String Info1 = " Student attendance system in classrooms: The idea of this "
    "code is to verify is the subjects that are enrolled are "
    "present in the session images";

String Info2 =
    "The whole concept is at the time of admission to college or school "
    "admin should register the students details such as his name email "
    "address and also create training data of each student by entering his "
    "roll id and taking snaps of his or her frontal face and then webapp will "
    "automatically create model for that particular roll id and save it on server, "
    "\n"
    "\n"
    "The model which is created for each student is about 8kb in size. Admin can "
    "also track using the database.";

String teamMen = "Gamini Saikiran - 180051601020"
    "\nHaja mohideen - 180051601021"
    "\nIdris Mohamed - 180051601023";

String guide = "Mr.Iniyavan Assistance professor (Sr.Gr)";

String info3 = "The project for face recognition based attendence system. "
    "We implemented this system first using OpenCV only doing everything and then using dlib for "
    "face detection and OpenCV for face recognition but we did not get much accuracy in both. "
    "\n"
    "\n"
    "We then tried using OpenFace but since neural networks require high graphic support and we were trying "
    "to do this project without any server support for later general use, so we did not went that way. "
    "\n"
    "\n"
    "We then used dlib for face detection and microsoft's vision cognitive api for face recognition and "
    "got a accuracy of 99% in a classroom of 20 students.";
