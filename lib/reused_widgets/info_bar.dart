import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/reused_widgets/icon_tile.dart';
import 'package:flutter_devicon/flutter_devicon.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveLayout.isDesktop(context) ? 20 : 10,
          horizontal:
              ResponsiveLayout.isDesktop(context) ? screenWidth * 0.12 : 10,
        ),
        child: body,
        // child: Row(
        //   children: [
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text(
        //             "Tech stack",
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white,
        //               fontSize: 30,
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           Wrap(spacing: 15, runSpacing: 15, children: []),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
      // child: ,
    );
  }
}
