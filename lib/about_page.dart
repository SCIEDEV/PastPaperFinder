import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final String lastCommit = "067900002c69b805bed86671bb2b2ccfc6cf9a01";
  final String version = "Development Version 0.3.0+3";
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Past Paper Finder",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
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
              const Text(
                "Past Paper Finder",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  badge(version),
                ],
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Last commit ",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(lastCommit,
                      style: const TextStyle(
                          fontSize: 14, fontFamily: "JetBrains Mono")),
                ],
              ),
              Container(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Created by "),
                  Text("Micfong ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("as a part of "),
                  Text("SCIE.DEV",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Text("Sponsor me",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    CustomButton(
                        title: "Open Collective",
                        leading: UniconsLine.heart,
                        trailing: UniconsLine.external_link_alt,
                        onPressed: () {
                          _launchUrl(
                              'https://opencollective.com/sciedev/projects/past-paper-finder');
                        }),
                    const SizedBox(width: 12),
                    CustomButton(
                        title: "爱发电",
                        leading: UniconsLine.heart,
                        trailing: UniconsLine.external_link_alt,
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
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
