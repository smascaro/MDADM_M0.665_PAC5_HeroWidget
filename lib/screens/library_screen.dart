import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_hero/screens/player_screen.dart';
import 'package:hello_hero/albums_backend.dart';

class LibraryScreen extends StatelessWidget {
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: SongsBackend.getSongs()
              .map((album) => GestureDetector(
                    child: Hero(
                      child: Image.network(
                        album.coverUrl,
                      ),
                      tag: album.tag,
                    ),
                    onTap: () => {
                      Navigator.pushNamed(context, PlayerScreen.routeName,
                          arguments: PlayerScreenArguments(album))
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
