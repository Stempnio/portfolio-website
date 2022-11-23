import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.showText = true,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              Visibility(
                  visible: showText,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
