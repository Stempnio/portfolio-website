import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio_website/responsive_layout.dart';
import 'package:portfolio_website/utils.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageAssetName,
    required this.onPressed,
    required this.language,
    this.loading = false,
  });

  final String name;
  final String language;
  final String description;
  final String imageAssetName;
  final VoidCallback onPressed;
  final bool loading;

  Widget loadingSpinner() => ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: SpinKitFadingCube(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.blueAccent : Colors.blueGrey,
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = ResponsiveLayout.isDesktop(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: isDesktop ? 300 : screenWidth * 0.9,
          child: Card(
            color: const Color(0xff343a40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 12),
              child: SizedBox(
                height: isDesktop ? 430 : null,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isDesktop)
                      Align(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: loading
                                ? loadingSpinner()
                                : Image.asset(imageAssetName),
                          ),
                        ),
                      ),
                    const SizedBox(height: 15),
                    Text(
                      language,
                      style: const TextStyle(color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(height: 5),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        name.toTitleCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
