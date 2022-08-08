import 'package:flutter/material.dart';
import 'package:past_paper/widgets.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'colors.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({
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
            AppLocalizations.of(context)!.testingTitle,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: mcol.primary),
          ),
          Container(height: 16),
          const TestingBanner(),
          Container(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.aboutTestingTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Badge(
                            content:
                                AppLocalizations.of(context)!.testingBadge),
                      ],
                    ),
                    Container(height: 16),
                    Text(AppLocalizations.of(context)!.testingBannerContent,
                        style: TextStyle(fontSize: 14, color: mcol.primary)),
                  ],
                ),
              ),
            ],
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.bugAndFeatureTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.bugAndFeatureContent1,
                      style: TextStyle(fontSize: 14, color: mcol.primary),
                    ),
                    Container(height: 16),
                    Text(AppLocalizations.of(context)!.bugAndFeatureContent2,
                        style: TextStyle(fontSize: 14, color: mcol.accentText)),
                  ],
                ),
              ),
            ],
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.roadmapTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  AppLocalizations.of(context)!.roadmapContent,
                  style: TextStyle(fontSize: 14, color: mcol.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(boxShadow: [
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
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: mcol.disabledButtonBackground,
                        border: Border.all(color: mcol.disabledButtonBorder),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                      ),
                      child: Text(AppLocalizations.of(context)!.roadmapContent1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mcol.disabledButtonText))),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.orange.shade300),
                      ),
                      child: Text(AppLocalizations.of(context)!.roadmapContent2,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: mcol.buttonBackground,
                        border: Border.all(color: mcol.buttonBorder),
                      ),
                      child: Text(AppLocalizations.of(context)!.roadmapContent3,
                          style: TextStyle(fontSize: 14, color: mcol.primary))),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: mcol.buttonBackground,
                        border: Border.all(color: mcol.buttonBorder),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      child: Text(AppLocalizations.of(context)!.roadmapContent4,
                          style: TextStyle(fontSize: 14, color: mcol.primary))),
                )
              ],
            ),
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.updatesTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  AppLocalizations.of(context)!.updatesContent,
                  style: TextStyle(fontSize: 14, color: mcol.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(flex: 3, child: Container()),
              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    CustomButton(
                        title: AppLocalizations.of(context)!.updatesButton,
                        leading: UniconsLine.arrow_circle_up,
                        trailing: UniconsLine.external_link_alt,
                        onPressed: () {
                          _launchUrl("https://pastpaperfinder.vercel.app/");
                        }),
                  ],
                ),
              ),
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
