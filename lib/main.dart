import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  static bool selected = false;
  IconData icon = Icons.add_a_photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          Container(
            decoration: BoxDecoration(color: Colors.yellow,border: Border.symmetric(horizontal: BorderSide(width: 1,color: Colors.black))),
            height: 150,
           // color: Colors.yellow,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 15,
                ),

                buildContainer(Icons.ac_unit),
                buildContainer(Icons.car_rental),
                buildContainer(Icons.face),
                buildContainer(Icons.calendar_today),
                buildContainer(Icons.add_a_photo_outlined),
                buildContainer(Icons.volume_down_sharp),
                buildContainer(Icons.face_retouching_natural),
                buildContainer(Icons.add_a_photo)
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selected
                  ? Container(
                      height: 100,
                      width: 100,
                      child: Icon(
                        icon,
                        size: 50,
                      ),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    )
                  : SizedBox(),
            ],
          )),
        ],
      ),
    );
  }

  Container buildContainer(IconData iconselected) {

    return Container(

                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                        child: Icon(iconselected, size: icon == iconselected && selected ? 1.5*30 : 1*30),
                        onPressed: () {
                          setState(() {
                            if (icon == iconselected) {
                              selected = !selected;
                              icon = iconselected;
                            } else if (icon != iconselected) {
                              selected = true;
                              icon = iconselected;
                            }
                          });
                        },

                        elevation: 0,
                        constraints: BoxConstraints.tight(Size(icon == iconselected && selected ? 1.5*50 : 1*50, icon == iconselected && selected ? 1.5*50 : 1*50)),
                        shape: CircleBorder(side: BorderSide(color: Colors.white,width: icon == iconselected && selected ? 2 : 0)),
                        fillColor: Colors.blue),
                  ],
                ),
              );
  }
}

