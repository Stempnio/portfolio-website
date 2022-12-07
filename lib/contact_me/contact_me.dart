import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/reused_widgets/icon_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/reused_widgets/info_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (kDebugMode) {
        print("error while launching url");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return InfoBar(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "jakub.stepien2905@gmail.com",
            style: TextStyle(
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              IconTile(
                showText: isDesktop,
                icon: FontAwesomeIcons.linkedin,
                iconColor: Colors.white,
                text: "Linkedin",
                textColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                onTap: () =>
                    _launchUrl("https://www.linkedin.com/in/jakub--stepien/"),
              ),
              IconTile(
                showText: isDesktop,
                icon: FontAwesomeIcons.twitter,
                iconColor: Colors.white,
                text: "Twitter",
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                onTap: () => _launchUrl("https://www.twitter.com/_Stempnio"),
              ),
              IconTile(
                showText: isDesktop,
                icon: FontAwesomeIcons.github,
                iconColor: Colors.white,
                text: "Github",
                textColor: Colors.white,
                backgroundColor: Colors.black54,
                onTap: () => _launchUrl("https://www.github.com/stempnio"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
