import 'package:flutter/material.dart';


void main()
{
  runApp(contact());
}

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is the main screen on which we will put all of ours widgets
    return MaterialApp(
      //removing the debug icon which is in the rigth side of the app
      debugShowCheckedModeBanner: false,

      //Scafflod porvide the app bar and body for the app
      home: Scaffold(

        //this is appbar
        appBar: AppBar( backgroundColor: Colors.purple,
          //this is the icon on the left side of the app
          leading: Icon(Icons.arrow_back,color: Colors.black,),
          //this is the icon on the rigth side of the app
          //it has some actions which takes array of Widgets
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //printing while we click on the star icon
                print("This Contact is Starred ");
              },
              icon: Icon(Icons.star_border),color: Colors.black,)
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
              margin: const EdgeInsets.only(top: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  //this are the Widgets methods written below
                  CallButton(),
                  TextButton(),
                  VideoButton(),
                  EmailButton(),
                  DirectionButton(),
                  PayButton(),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
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
            color: Colors.indigo.shade800,
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
              color: Colors.indigo.shade800,
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
          color: Colors.indigo.shade800,
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
              color: Colors.indigo.shade800,
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
              color: Colors.indigo.shade800,
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
              color: Colors.indigo.shade800,
            ),
        ),
        Text("Pay"),
      ],
    );
  }
}
