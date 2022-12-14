import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio_website/responsive_layout.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.name,
    required this.description,
    required this.imageAssetName,
    required this.btnOnTap,
    this.loading = false,
  }) : super(key: key);

  final String name;
  final String description;
  final String imageAssetName;
  final VoidCallback btnOnTap;
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
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isDesktop ? 300 : screenWidth * 0.9,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
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
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: loading ? null : btnOnTap,
                child: const Text("see details"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
