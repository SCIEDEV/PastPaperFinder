import 'package:flutter/material.dart';
import 'package:past_paper/downloads_page.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'package:provider/provider.dart';
import 'colors.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({
    Key? key,
    required this.globalContext,
  }) : super(key: key);
  final BuildContext globalContext;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
        margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Collection",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary),
                ),
                const Spacer(),
                CustomButton(
                  title: 'Download All',
                  primary: true,
                  onPressed: () {
                    context.read<DownloadStates>().downloadCollections(
                        context.read<CollectionStates>().collection);
                    context.read<CollectionStates>().removeAll();
                    downloadFiles(globalContext);
                  },
                ),
              ],
            ),
            Container(height: 16),
            Row(
              children: [
                CustomButton(
                  title: 'Remove All',
                  primary: false,
                  onPressed: () {
                    context.read<CollectionStates>().removeAll();
                  },
                  destructive: true,
                ),
                const Spacer(),
                const Text(
                  "Tap to remove any single item",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Container(
              height: 16,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
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
                width: double.infinity,
                child: Column(children: [
                  collectionTableHeading(),
                  const Divider(height: 0),
                  if (context.watch<CollectionStates>().collectionCount == 0)
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 232,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(UniconsLine.folder_question,
                                size: 48, color: Colors.grey.shade400),
                            const SizedBox(height: 16),
                            Text(
                              "Seems like you did not add anything to collection yet",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )))
                  else
                    for (var i = 0;
                        i < context.watch<CollectionStates>().collectionCount;
                        i++) ...[
                      CollectionTableRow(
                        title: context
                            .read<CollectionStates>()
                            .collection
                            .elementAt(i)
                            .name,
                        paperCount: context
                            .read<CollectionStates>()
                            .collection
                            .elementAt(i)
                            .paperCount,
                      ),
                      if (i !=
                          context.read<CollectionStates>().collectionCount - 1)
                        const Divider(height: 0),
                    ],
                ]))
          ],
        ));
  }
}

Widget collectionTableHeading() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    ),
    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(width: 28),
        Expanded(
          flex: 2,
          child: Text(
            'Collected time',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Papers',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 8),
        SizedBox(
          width: 20,
        )
      ],
    ),
  );
}

class CollectionTableRow extends StatelessWidget {
  const CollectionTableRow(
      {Key? key, required this.title, required this.paperCount})
      : super(key: key);
  final String title;
  final int paperCount;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          context.read<CollectionStates>().removeItem(title);
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(UniconsLine.cube, size: 20, color: Colors.grey.shade400),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  paperCount.toString(),
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                UniconsLine.trash,
                size: 20,
                color: Colors.red,
              )
            ],
          ),
        ));
  }
}
