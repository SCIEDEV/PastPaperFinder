import 'package:flutter/material.dart';
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
    return Container(
        width: 240,
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey.shade300))),
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
                side: BorderSide(color: Colors.grey.shade300, width: 1.0)),
            color: Colors.white,
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
                        color: Colors.orange.shade900),
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
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade700),
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
