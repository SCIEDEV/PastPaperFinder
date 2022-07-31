import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'batch_download.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Container(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Text("Appearance",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              const Expanded(
                flex: 6,
                child: AppearanceButtons(),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ]));
  }
}

class _AppearanceButtonsState extends State<AppearanceButtons> {
  @override
  Widget build(BuildContext context) {
    int selected = context.watch<Settings>().appearance;
    return Row(
      children: [
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
          child: MaterialButton(
            color: (selected == 0 ? Colors.orange : Colors.white),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                side: BorderSide(
                    color: selected == 0
                        ? Colors.orange.shade300
                        : Colors.grey.shade300)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(0);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("System Default",
                  style: TextStyle(
                      color: (selected == 0 ? Colors.white : Colors.black),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0x1018280D),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
          transform: Matrix4.translationValues(-1, 0, 0),
          child: MaterialButton(
            color: (selected == 1 ? Colors.orange : Colors.white),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.zero),
                side: BorderSide(
                    color: selected == 1
                        ? Colors.orange.shade300
                        : Colors.grey.shade300)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(1);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("Light",
                  style: TextStyle(
                      color: (selected == 1 ? Colors.white : Colors.black),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0x1018280D),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1))
          ]),
          transform: Matrix4.translationValues(-2, 0, 0),
          child: MaterialButton(
            color: (selected == 2 ? Colors.orange : Colors.white),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                side: BorderSide(
                    color: selected == 2
                        ? Colors.orange.shade300
                        : Colors.grey.shade300)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(2);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("Dark",
                  style: TextStyle(
                      color: (selected == 2 ? Colors.white : Colors.black),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }
}

class AppearanceButtons extends StatefulWidget {
  const AppearanceButtons({Key? key}) : super(key: key);

  @override
  State<AppearanceButtons> createState() => _AppearanceButtonsState();
}
