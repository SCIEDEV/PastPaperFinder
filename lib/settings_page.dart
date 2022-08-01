import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'batch_download.dart';
import 'dart:math' as math;

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
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Text("Download Path",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Expanded(
                flex: 6,
                child: longButton("Select download path",
                    UniconsLine.download_alt, UniconsLine.angle_right, () {}),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Text("Simultaneous Downloads",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              const Expanded(
                flex: 6,
                child: ValueStepper(),
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
              child: Text("Auto",
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

class ValueStepper extends StatefulWidget {
  const ValueStepper({Key? key}) : super(key: key);

  @override
  State<ValueStepper> createState() => _ValueStepperState();
}

class _ValueStepperState extends State<ValueStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0x1018280D),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1))
        ]),
        child: MaterialButton(
          minWidth: 24,
          color: Colors.white,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              side: BorderSide(color: Colors.grey.shade300)),
          onPressed: () {
            context.read<Settings>().increaseSimultaneous();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child:
                const Icon(UniconsLine.angle_up, color: Colors.black, size: 17),
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
          color: Colors.white,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          disabledColor: Colors.white,
          disabledTextColor: Colors.grey.shade600,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.zero),
              side: BorderSide(color: Colors.grey.shade300)),
          onPressed: null,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(context.watch<Settings>().simultaneous.toString()),
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
          minWidth: 24,
          color: Colors.white,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              side: BorderSide(color: Colors.grey.shade300)),
          onPressed: () {
            context.read<Settings>().decreaseSimultaneous();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(UniconsLine.angle_down,
                color: Colors.black, size: 17),
          ),
        ),
      ),
    ]);
  }
}
