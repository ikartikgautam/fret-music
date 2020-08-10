import 'package:flutter/material.dart';
import 'package:fret/services/service.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

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
                onChanged: (text) {
                  print(text);
                },
              ),
              // Player Info
              Expanded(
                flex: 2,
                child: Container(
                  child: Text('asd'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white),
                    child: Text('asd'),
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
