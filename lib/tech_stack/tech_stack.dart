import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/reused_widgets/icon_tile.dart';
import 'package:flutter_devicon/flutter_devicon.dart';
import 'package:portfolio_website/reused_widgets/info_bar.dart';

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
            children: const [
              IconTile(
                icon: FlutterDEVICON.flutter_plain,
                iconColor: Colors.white,
                text: "Flutter",
                textColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              IconTile(
                icon: FlutterDEVICON.apache_line,
                iconColor: Colors.white,
                text: "Dart",
                textColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              IconTile(
                icon: FontAwesomeIcons.fire,
                iconColor: Colors.white,
                text: "Firebase",
                textColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              IconTile(
                icon: FlutterDEVICON.swift_plain,
                iconColor: Colors.white,
                text: "Swift",
                textColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
              IconTile(
                icon: FlutterDEVICON.python_plain,
                iconColor: Colors.black,
                text: "Python",
                textColor: Colors.black,
                backgroundColor: Colors.white60,
              ),
              IconTile(
                icon: FlutterDEVICON.git_plain,
                iconColor: Colors.white,
                text: "Git",
                textColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              IconTile(
                icon: FlutterDEVICON.apache_line,
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
              IconTile(
                icon: FlutterDEVICON.apache_line,
                iconColor: Colors.white,
                text: "Numpy",
                textColor: Colors.white,
                backgroundColor: Colors.lightGreen,
              ),
              IconTile(
                icon: FlutterDEVICON.apache_line,
                iconColor: Colors.white,
                text: "Keras",
                textColor: Colors.white,
                backgroundColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
