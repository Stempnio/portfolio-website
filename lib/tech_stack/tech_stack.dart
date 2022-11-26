import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/reused_widgets/icon_tile.dart';
import 'package:portfolio_website/reused_widgets/info_bar.dart';
import "package:dev_icons/dev_icons.dart";

class TechStack extends StatelessWidget {
  const TechStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoBar(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tech stack",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: _techStackItems(),
          ),
        ],
      ),
    );
  }

  List<Widget> _techStackItems() => [
        IconTile(
          icon: DevIcons.flutterPlain,
          iconColor: Colors.white,
          text: "Flutter",
          textColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        IconTile(
          icon: DevIcons.dartPlain,
          iconColor: Colors.blue,
          text: "Dart",
          textColor: Colors.black,
          backgroundColor: Colors.white70,
        ),
        IconTile(
          icon: DevIcons.firebasePlain,
          iconColor: Colors.orangeAccent,
          text: "Firebase",
          textColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        IconTile(
          icon: DevIcons.swiftPlain,
          iconColor: Colors.white,
          text: "Swift",
          textColor: Colors.white,
          backgroundColor: Colors.orange,
        ),
        IconTile(
          icon: DevIcons.pythonPlain,
          iconColor: Colors.black,
          text: "Python",
          textColor: Colors.black,
          backgroundColor: Colors.white60,
        ),
        IconTile(
          icon: DevIcons.gitPlain,
          iconColor: Colors.white,
          text: "Git",
          textColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        IconTile(
          icon: FontAwesomeIcons.database,
          iconColor: Colors.black,
          text: "SQL Server",
          textColor: Colors.black,
          backgroundColor: Colors.white60,
        ),
        IconTile(
          icon: FontAwesomeIcons.figma,
          iconColor: Colors.black,
          text: "Figma",
          textColor: Colors.black,
          backgroundColor: Colors.deepOrange,
        ),
      ];
}
