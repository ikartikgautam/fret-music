import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fret/screens/search.dart';
import 'package:fret/services/service.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

bool play = true;

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              // Search Box
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Search..',
                    filled: true),
                onSubmitted: (val) {
                  setState(() {
                    play = false;
                  });
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => SearchMenu(
                                query: val,
                              )));
                },
                // onChanged: (text) {
                //   print(text);
                // },
              ),
              // Player Info
              Expanded(
                flex: 2,
                child: Container(
                  child: Text('asd'),
                ),
              ),
              // Bottom Menu
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white),
                    child: Row(
                      // Control Row
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                size: 50,
                              ),
                              onPressed: () {}),
                        ),
                        if (play)
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.pause_circle_filled, size: 50),
                            onPressed: () {
                              print("pause");
                              pauseAudio();
                            },
                          )),
                        if (!play)
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.play_arrow, size: 50),
                            onPressed: () {
                              print("pause");
                              pauseAudio();
                            },
                          )),
                        Expanded(
                          child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                size: 50,
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                  )),
            ],
          ),
          width: double.infinity,
        ),
      ),
    );
  }
}
