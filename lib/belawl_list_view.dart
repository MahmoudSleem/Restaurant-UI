import 'dart:convert';

import 'package:flutter/material.dart';

class BelawListView extends StatefulWidget {
  @override
  _BelawListViewState createState() => _BelawListViewState();
}

class _BelawListViewState extends State<BelawListView> {
  @override
  Widget build(BuildContext context) {
    Future<List<Widget>> createList() async {
      List<Widget> item = new List<Widget>();
      String dataString =
          await DefaultAssetBundle.of(context).loadString('assets/data.json');
      List<dynamic> dataJSON = jsonDecode(dataString);
      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item + "|";
        });
        item.add(Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ]),
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    object['placeImage'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(object['placeName']),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 2),
                          child: Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "Min. Order: ${object['minOrder']} ",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });
      return item;
    }

    return Container(
        child: FutureBuilder(
            initialData: <Widget>[Text('')],
            future: createList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: snapshot.data,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
