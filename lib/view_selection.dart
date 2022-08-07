import 'dart:math';
import 'package:flutter/material.dart';
import 'package:past_paper/downloads_page.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'browse_papers.dart';
import 'package:provider/provider.dart';
import 'batch_download.dart';
import 'colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets.dart';

class ViewSelectionPage extends StatelessWidget {
  const ViewSelectionPage({Key? key, required this.globalContext})
      : super(key: key);
  final BuildContext globalContext;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return ListView(children: [
      Container(
        color: mcol.pageBackground,
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
                  child: Icon(UniconsLine.angle_left_b,
                      size: 30, color: mcol.primary),
                ),
                Text(
                  AppLocalizations.of(context)!.selectedPapersTitle,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary),
                ),
                const Spacer(),
                CustomButton(
                  title: AppLocalizations.of(context)!.downloadAllButton,
                  primary: true,
                  onPressed: () {
                    if (context.read<Settings>().path == "") {
                      context.read<DownloadStates>().setShowDownloadFailedOn(1);
                    } else {
                      context.read<DownloadStates>().addDownloads(context
                          .read<BrowsePreferences>()
                          .selectedPath
                          .toList());
                      context.read<BrowsePreferences>().removeAllSelected();
                      downloadFiles(globalContext);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (context.watch<DownloadStates>().showDownloadFailedOn == 1) ...[
              const PathNotSpecifiedBanner(),
              Container(height: 16),
            ],
            Row(
              children: [
                CustomButton(
                  title: AppLocalizations.of(context)!.removeAllButton,
                  primary: false,
                  onPressed: () {
                    context.read<BrowsePreferences>().removeAllSelected();
                  },
                  destructive: true,
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.tapToRemoveHint,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: mcol.buttonBorder),
                  borderRadius: BorderRadius.circular(8),
                  color: mcol.buttonBackground,
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
                  const EntryTableHeading(),
                  Divider(height: 0, color: mcol.buttonBorder),
                  if (context.watch<BrowsePreferences>().selectedCount == 0)
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 232,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(UniconsLine.file_question_alt,
                                size: 48, color: mcol.secondaryIcon),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.seemsNoSelection,
                              style: TextStyle(
                                  color: mcol.secondary,
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
                        Divider(height: 0, color: mcol.buttonBorder),
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
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
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
    Map<String, String> localizedType = {
      "Folder": AppLocalizations.of(context)!.folderType,
      "Mark scheme": AppLocalizations.of(context)!.msType,
      "Question paper": AppLocalizations.of(context)!.qpType,
      "Examiner report": AppLocalizations.of(context)!.erType,
      "Grade thresholds": AppLocalizations.of(context)!.gtType,
      "Confidential instructions": AppLocalizations.of(context)!.ciType,
      "Insert": AppLocalizations.of(context)!.inType,
      "Source files": AppLocalizations.of(context)!.sfType,
      "Specimen mark scheme": AppLocalizations.of(context)!.smType,
      "Specimen paper": AppLocalizations.of(context)!.spType,
      "Transcript": AppLocalizations.of(context)!.qrType,
      "Speaking assessment": AppLocalizations.of(context)!.rpType,
      "Examiner's notes": AppLocalizations.of(context)!.tnType,
      "Syllabus": AppLocalizations.of(context)!.syType,
      "Specimen insert": AppLocalizations.of(context)!.siType,
      "Syllabus update": AppLocalizations.of(context)!.suType,
      "Other file": AppLocalizations.of(context)!.otherType,
    };
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
              Icon(icons[type], size: 20, color: mcol.secondaryIcon),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  localizedType[type]!,
                  style: TextStyle(
                      color: mcol.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                UniconsLine.trash,
                size: 20,
                color: mcol.destructive,
              )
            ],
          ),
        ));
  }
}
