import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class AboutPage extends StatelessWidget {
  final String lastCommit = "352e86116e20f0e0c4966b65981cd0462ade5b12";
  final String version = "Development Version 0.5.2+9";
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Past Paper Finder",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: mcol.primary),
          ),
          Container(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x1018281A),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          spreadRadius: -2),
                      BoxShadow(
                          color: Color(0x1018280F),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: -2)
                    ]),
                child: Image.asset(
                  "assets/appicon.png",
                  width: 128,
                  height: 128,
                ),
              ),
              Container(height: 24),
              Text(
                "Past Paper Finder",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: mcol.primary),
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(content: version),
                ],
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Last commit ",
                    style: TextStyle(fontSize: 14, color: mcol.primary),
                  ),
                  Text(lastCommit,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "JetBrains Mono",
                          color: mcol.primary)),
                ],
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Created by ",
                    style: TextStyle(color: mcol.primary),
                  ),
                  Text("Micfong ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: mcol.primary)),
                  Text(
                    "as a part of ",
                    style: TextStyle(color: mcol.primary),
                  ),
                  Text("SCIE.DEV",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: mcol.primary)),
                ],
              ),
            ],
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text("Sponsor me",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    CustomButton(
                        title: "Open Collective",
                        leading: UniconsLine.heart,
                        onPressed: () {
                          _launchUrl(
                              'https://opencollective.com/sciedev/projects/past-paper-finder');
                        }),
                    const SizedBox(width: 12),
                    CustomButton(
                        title: "爱发电",
                        leading: UniconsLine.bolt_alt,
                        onPressed: () {
                          _launchUrl('https://afdian.net/@micfong');
                        }),
                  ],
                ),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri u = Uri.parse(url);
  if (!await launchUrl(u)) {
    throw 'Could not launch $u';
  }
}
