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
        child: ListView(
          children: <Widget>[
            for (var i in searchRes)
              ListTile(
                isThreeLine: true,
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    // to implement pop up menu here
                  },
                ),
                subtitle: Text(i.author.toString()),
                leading: Image.network(i.thumbnails.lowResUrl),
                title: Text(getTitle(i.title)),
                onTap: () async {
                  await convert(i.id.toString(), i.title.toString());
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
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

  String getTitle(String str) {
    if (str.length < 30) {
      return str;
    }
    return str.substring(0, 30) + '...';
  }
}
