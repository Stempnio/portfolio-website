import 'package:flutter/material.dart';

class IconTile extends StatefulWidget {
  IconTile({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.showText = true,
    VoidCallback? onTap,
  })  : onTap = onTap ?? (() {}),
        super(key: key);

  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final bool showText;
  final VoidCallback onTap;

  @override
  State<IconTile> createState() => _IconTileState();
}

class _IconTileState extends State<IconTile> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: isHover
            ? widget.backgroundColor.withAlpha(1)
            : widget.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        mouseCursor: SystemMouseCursors.basic,
        onTap: widget.onTap,
        onHover: (val) => setState(() {
          isHover = val;
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  widget.icon,
                  color: widget.iconColor,
                ),
                Visibility(
                    visible: widget.showText,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          widget.text,
                          style: TextStyle(
                            color: widget.textColor,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
