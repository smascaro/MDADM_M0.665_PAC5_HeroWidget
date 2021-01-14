import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../album.dart';

class PlayerScreenArguments {
  Album album;

  PlayerScreenArguments(this.album);
}

class PlayerScreen extends StatelessWidget {
  static String routeName = "/player";

  @override
  Widget build(BuildContext context) {
    PlayerScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              child: Image.network(arguments.album.coverUrl),
              tag: arguments.album.tag,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Text(
              "${arguments.album.title} (${arguments.album.year})",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            Text(
              arguments.album.artist,
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
