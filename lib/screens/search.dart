import 'package:flutter/material.dart';
import 'package:fret/services/service.dart';

class SearchMenu extends StatefulWidget {
  final String query;
  SearchMenu({this.query});
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

List searchRes;

class _SearchMenuState extends State<SearchMenu> {
  @override
  void initState() {
    getSearchResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          for (var i in searchRes)
            Container(
              child: Text(
                i.toString(),
                style: TextStyle(color: Colors.white),
              ),
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
              margin: EdgeInsets.fromLTRB(3, 6, 3, 6),
            ),
        ],
      )),
    );
  }

  //functions
  getSearchResults() async {
    searchRes = [];
    List temp = await search(widget.query);
    setState(() {
      searchRes = temp;
    });
    print(searchRes);
  }
}
