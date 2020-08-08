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
      body: SafeArea(
          child: Column(
        children: <Widget>[
          // Search Box
          Container(
            color: Colors.red,
            child: Text('data'),
            width: double.infinity,
          ),
          // Player Info Panel
          Expanded(
            child: Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  convert('OmF1AY3sO9Q', 'ritviz');
                },
                child: Text('CONVERT'),
              ),
              color: Colors.blue,
            ),
          ),
          // Bottom Controls Panel
          Container(
            width: double.infinity,
            child: Text('Controls'),
            color: Colors.red,
          )
        ],
      )),
    );
  }
}
