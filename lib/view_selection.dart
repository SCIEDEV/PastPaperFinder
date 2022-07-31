import 'dart:math';

import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'browse_papers.dart';
import 'package:provider/provider.dart';
import 'batch_download.dart';

class ViewSelectionPage extends StatelessWidget {
  const ViewSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        color: Colors.grey.shade50,
        child: Container(
          margin:
              const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minWidth: 32,
                  child: const Icon(UniconsLine.angle_left_b, size: 30),
                ),
                const Text(
                  "Selected Papers",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CustomButton(
                  title: 'Download All',
                  primary: true,
                  onPressed: () {
                    context.read<DownloadStates>().addDownloads(context
                        .read<BrowsePreferences>()
                        .selectedPath
                        .toList());
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomButton(
                  title: 'Remove All',
                  primary: false,
                  onPressed: () {
                    context.read<BrowsePreferences>().removeAllSelected();
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
            const SizedBox(height: 16),
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
              child: Column(
                children: [
                  entryTableHeading(),
                  const Divider(height: 0),
                  if (context.watch<BrowsePreferences>().selectedCount == 0)
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 232,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(UniconsLine.file_question_alt,
                                size: 48, color: Colors.grey.shade400),
                            const SizedBox(height: 16),
                            Text(
                              "Seems like you did not select any papers yet",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )))
                  else
                    for (var i = 0;
                        i < context.watch<BrowsePreferences>().selected.length;
                        i++) ...[
                      SelectedTableRow(
                          title: context
                              .read<BrowsePreferences>()
                              .selected
                              .elementAt(i)),
                      if (i !=
                          context.read<BrowsePreferences>().selected.length - 1)
                        const Divider(height: 0),
                    ],
                ],
              ),
            ),
            if (context.watch<BrowsePreferences>().selectedCount > 0)
              SizedBox(
                  height: max(
                      0,
                      MediaQuery.of(context).size.height -
                          232 -
                          context.read<BrowsePreferences>().selectedCount * 52))
          ]),
        ),
      ),
    ]);
  }
}

class SelectedTableRow extends StatelessWidget {
  const SelectedTableRow({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    String type = 'Folder';
    if (title.contains('.')) {
      if (title.contains('_ms')) {
        type = 'Mark scheme';
      } else if (title.contains('_qp')) {
        type = 'Question paper';
      } else if (title.contains('_er')) {
        type = 'Examiner report';
      } else if (title.contains('_gt')) {
        type = 'Grade thresholds';
      } else if (title.contains('_ci') || title.contains('_ir')) {
        type = 'Confidential instructions';
      } else if (title.contains('_in')) {
        type = 'Insert';
      } else if (title.contains('_sf')) {
        type = 'Source files';
      } else if (title.contains('_sm')) {
        type = 'Specimen mark scheme';
      } else if (title.contains('_sp')) {
        type = 'Specimen paper';
      } else if (title.contains('_qr')) {
        type = 'Transcript';
      } else if (title.contains('_rp')) {
        type = 'Speaking assessment';
      } else if (title.contains('_tn')) {
        type = 'Examiner\'s notes';
      } else if (title.contains('_sy')) {
        type = 'Syllabus';
      } else if (title.contains('_si')) {
        type = 'Specimen insert';
      } else if (title.contains('_su')) {
        type = 'Syllabus update';
      } else {
        type = 'Other file';
      }
    }
    const icons = {
      'Folder': UniconsLine.folder,
      'Mark scheme': UniconsLine.file_check_alt,
      'Question paper': UniconsLine.file_question_alt,
      'Examiner report': UniconsLine.file_search_alt,
      'Grade thresholds': UniconsLine.file_graph,
      'Other file': UniconsLine.copy_alt,
      'Confidential instructions': UniconsLine.file_info_alt,
      'Insert': UniconsLine.file_export,
      'Source files': UniconsLine.file_plus,
      'Specimen mark scheme': UniconsLine.file_bookmark_alt,
      'Specimen paper': UniconsLine.file_bookmark_alt,
      'Transcript': UniconsLine.invoice,
      'Speaking assessment': UniconsLine.voicemail_rectangle,
      'Examiner\'s notes': UniconsLine.notes,
      'Syllabus': UniconsLine.clipboard_notes,
      'Specimen insert': UniconsLine.file_export,
      'Syllabus update': UniconsLine.file_upload_alt,
    };
    return MaterialButton(
        onPressed: () {
          context.read<BrowsePreferences>().toggleItem(title);
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icons[type], size: 20, color: Colors.grey.shade400),
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
                  type,
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
