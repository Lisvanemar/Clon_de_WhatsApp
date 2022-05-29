import 'package:flutter/material.dart';
import 'chatClass.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  chatScreenState createState() => new chatScreenState();
}

class chatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Widget notificationCircle(value) {
      return Container(
        child: Center(
            child: Text(
          value.toString(),
          style: TextStyle(color: Colors.white),
        )),
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
        ),
      );
    }

    return ListView.builder(
      itemCount: temporalData.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          Divider(
            height: 5.0,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  temporalData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  temporalData[i].time,
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      temporalData[i].message,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                    temporalData[i].newMessage == 1 ? notificationCircle(Random().nextInt(5) + 1) : new Container()
                  ],
                )),
          )
        ],
      ),
    );
  }
}
