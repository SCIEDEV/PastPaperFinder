import 'package:flutter/material.dart';
import 'package:past_paper/colors.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const List<List<dynamic>> topItems = [
      ["Batch", UniconsLine.filter],
      ["Browse", UniconsLine.search],
      ["Collection", UniconsLine.layers],
      ["Downloads", UniconsLine.file_download_alt],
    ];

    const List<List<dynamic>> bottomItems = [
      ["Settings", UniconsLine.setting],
      ["About", UniconsLine.info_circle],
    ];

    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
        width: 240,
        decoration: BoxDecoration(
            color: mcol.pageBackground,
            border: Border(right: BorderSide(color: mcol.buttonBorder))),
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                for (var i = 0; i < topItems.length; i++) ...[
                  SidebarItem(
                      icon: topItems[i][1], title: topItems[i][0], index: i)
                ],
                const Spacer(),
                for (var i = 0; i < bottomItems.length; i++) ...[
                  SidebarItem(
                      icon: bottomItems[i][1],
                      title: bottomItems[i][0],
                      index: i + topItems.length)
                ]
              ],
            )));
  }
}

class SidebarItem extends StatelessWidget {
  const SidebarItem(
      {Key? key, required this.icon, required this.title, required this.index})
      : super(key: key);
  final String title;
  final IconData icon;
  final int index;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    bool active = context.watch<SidebarStates>().currentSelection == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: active ? const Color(0x1018281A) : Colors.transparent,
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: -2),
        BoxShadow(
            color: active ? const Color(0x1018281A) : Colors.transparent,
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: -2)
      ]),
      padding: const EdgeInsets.only(bottom: 4),
      child: AnimatedCrossFade(
          firstChild: MaterialButton(
            animationDuration: const Duration(milliseconds: 200),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: mcol.buttonBorder, width: 1.0)),
            color: mcol.buttonBackground,
            elevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            onPressed: () {
              context.read<SidebarStates>().changeSelection(index);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.orange.shade500,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: mcol.accentText),
                  )
                ],
              ),
            ),
          ),
          secondChild: MaterialButton(
            animationDuration: const Duration(milliseconds: 200),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), side: BorderSide.none),
            color: null,
            elevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            onPressed: () {
              context.read<SidebarStates>().changeSelection(index);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: mcol.sideBarIcon,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: mcol.secondary),
                  )
                ],
              ),
            ),
          ),
          crossFadeState:
              active ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 100)),
    );
  }
}
