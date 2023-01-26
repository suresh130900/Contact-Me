//import 'dart:html';

import 'package:flutter/material.dart';


void main()
{
  runApp(Contact());
}


//creating a enum for ligth and dark theme
enum App_theme { Light, Dark}

//creating a class fot ligth theme
class MyAppTheme {
  static ThemeData appThemeLigth() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.indigo.shade800,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade800,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }


  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      //creating a theme for appbar
      appBarTheme: AppBarTheme(
        color: Colors.black,
        //creating a color for the icons on the appbar
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    );
  }
}
class Contact extends StatefulWidget {
  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<Contact> {

  //creating a variable
  var currentTheme = App_theme.Light;

  @override
  Widget build(BuildContext context) {
    //this is the main screen on which we will put all of ours widgets
    return MaterialApp(
      //removing the debug icon which is in the rigth side of the app
      debugShowCheckedModeBanner: false,

      theme: currentTheme == App_theme.Dark
          ? MyAppTheme.appThemeDark()
          : MyAppTheme.appThemeLigth(),

      home: Scaffold(

        //this is appbar
        appBar: AppBar(
          // backgroundColor: Colors.purple,
          //this is the icon on the left side of the app
          leading: Icon(Icons.arrow_back,),
          //this is the icon on the rigth side of the app
          //it has some actions which takes array of Widgets
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //printing while we click on the star icon
                print("This Contact is Starred ");
              },
              icon: Icon(Icons.star_border),
            )
          ],
        ),

        //this is the main body of the app .it will be below the appbar
        body: ListView(
          //listview can have multiple childrens
          children: <Widget>[
            //kind of box or <div>
            Container(

              //kind of match parent
              width: double.infinity,
              height: 250,
              //image from the web url
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/LetterS.svg/640px-LetterS.svg.png",

                fit: BoxFit.contain,
              ),
            ),
            Container(
                height: 60,
                child: Row(
                  //row or coloumn

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //a child can have row and row can have multiple children
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Suresh Chaudhary",
                            style: TextStyle(fontSize: 30),
                          )
                      ),
                    ]
                )
            ),
            //putting a dividing line
            Divider(
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: profileActionItems(),
            ),

            Divide(),
            MobileNumber(),
            Divide(),
            EmailmeButton(),
            Divide(),
            Address(),
          ],
        ),


        //creating a floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Toogle ");
          },
          child: IconButton(
              icon: Icon(
                Icons.threesixty,
              ),
            onPressed: () {
            setState(()
            {
              currentTheme == App_theme.Dark
                  ? currentTheme = App_theme.Light
                  : currentTheme = App_theme.Dark;
            });
          },
          ),
        ),
      ),
    );
  }

  //divider Widget
  Widget Divide()
  {
    return Divider(
      color: Colors.grey,
    );
  }


  Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CallButton(),
        TextButton(),
        VideoButton(),
        EmailButton(),
        DirectionButton(),
        PayButton(),
      ],
    );
  }

//widget for call button
Widget CallButton()
  {
    //this is returning coloum and not material app
    return Column(
      children: <Widget>[

        //icon button is used to display inbuild icons
        IconButton(onPressed: () {
          //just printing in the console
          print("Call Button is presses");
        },
          icon: Icon(
            Icons.call,
          ),
        ),
        Text("Call"),
      ],
    );
  }


  Widget TextButton()
  {
    return Column(
      children: <Widget>[
        IconButton(onPressed: () {
          print("Text button is pressed ");
        },
            icon: Icon(
              Icons.message,
            ),
        ),
        Text("Text"),
      ],
    );
  }

  Widget VideoButton()
  {
    return Column(
      children: <Widget>[
        IconButton(onPressed: (){
          print("Video Button is presses");
        }, icon: Icon(
          Icons.video_call,
        ),
        ),
        Text("Video Call"),
      ],
    );
  }

  Widget EmailButton()
  {
    return Column(
      children: <Widget>[
        IconButton(onPressed: () {},
            icon: Icon(
              Icons.email,
            ),
        ),
        Text("Email"),
      ],
    );
  }

  //direction button

  Widget DirectionButton()
  {
    return Column(
      children: <Widget>[
        IconButton(onPressed: () {},
            icon: Icon(
              Icons.directions,
            ),
        ),
        Text("Directions"),
      ],
    );
  }

  //Paying button
  Widget PayButton()
  {
    return Column(
      children: <Widget>[
        IconButton(onPressed: () {} ,
            icon: Icon(
              Icons.attach_money,

            ),
        ),
        Text("Pay"),
      ],
    );
  }

  //creating a mobile phone number Widget
  Widget MobileNumber()
  {
    //list tile is used to create a row with leading and a middle text and a trailing
    //The leading property shows a call icon. The title property displays the phone number.
    // The subtitle property shows the category of the phone number as “Mobile.”
    // The trailing property provides the IconButton for text message action.
    return ListTile(
      leading: Icon(Icons.call),
      title: Text("9653413472"),
      subtitle: Text("Mobile Number "),
      trailing: IconButton(
        icon: Icon(
          Icons.message,
        ),
        onPressed: () {} ,
      ),
    );
  }

  //creating a EmailME Button
  Widget EmailmeButton()
  {
    return ListTile(
      leading: Text(""),
      title: Text("sureshchaudhary2017@gmail.com"),
      subtitle: Text("Email ME"),
      trailing: IconButton(onPressed: () {},
          icon: Icon(
            Icons.email,
          ),
      ),
    );
  }

  //Address Widget
  Widget Address()
  {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text("Mumbai, India"),
      subtitle: Text("Home"),
      trailing: IconButton(onPressed: () {},
          icon: Icon(
            Icons.directions,
          ),
      ),
    );
  }
}
