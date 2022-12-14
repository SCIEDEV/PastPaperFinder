import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'view_selection.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrowsePapersPage extends StatelessWidget {
  const BrowsePapersPage({Key? key, required this.globalContext})
      : super(key: key);
  final BuildContext globalContext;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.browseTitle,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: mcol.primary),
            ),
            const SizedBox(width: 16),
            Badge(
                content: AppLocalizations.of(context)!.papersSelectedTag(
                    context.watch<BrowsePreferences>().selectedCount)),
            const Spacer(),
            CustomButton(
              title: AppLocalizations.of(context)!.viewSelectionButton,
              primary: true,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          context.read<SidebarStates>().setContext(context);
                          return ViewSelectionPage(
                            globalContext: globalContext,
                          );
                        },
                        fullscreenDialog: true));
              },
            ),
          ],
        ),
        Container(height: 12),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Breadcumb(),
        ),
        Container(height: 24),
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
              for (var i = 0;
                  i < context.watch<BrowsePreferences>().entries.length;
                  i++) ...[
                EntryTableRow(
                    title: context.read<BrowsePreferences>().entries[i]),
                if (i != context.read<BrowsePreferences>().entries.length - 1)
                  Divider(height: 0, color: mcol.buttonBorder),
              ],
            ],
          ),
        ),
      ]),
    );
  }
}

class EntryTableHeading extends StatelessWidget {
  const EntryTableHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
      decoration: BoxDecoration(
        color: mcol.tableHeadingBackground,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 28),
          Expanded(
            flex: 2,
            child: Text(
              AppLocalizations.of(context)!.entryNameHeading,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              AppLocalizations.of(context)!.typeHeading,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class Breadcumb extends StatefulWidget {
  const Breadcumb({Key? key}) : super(key: key);

  @override
  State<Breadcumb> createState() => _BreadcumbState();
}

class _BreadcumbState extends State<Breadcumb> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Row(
      children: [
        MaterialButton(
          minWidth: 0,
          onPressed: () {
            context.read<BrowsePreferences>().changePath([]);
          },
          child: Text(
            AppLocalizations.of(context)!.homeLocation,
            style: TextStyle(color: mcol.accentText),
          ),
        ),
        const Text(
          "/",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        for (var i = 0;
            i < context.watch<BrowsePreferences>().path.length;
            i++) ...[
          MaterialButton(
            minWidth: 0,
            onPressed: () {
              context.read<BrowsePreferences>().changePath([
                ...context.read<BrowsePreferences>().path.sublist(0, i + 1)
              ]);
            },
            child: Text(
              context.read<BrowsePreferences>().path[i],
              style: TextStyle(color: mcol.accentText),
            ),
          ),
          if (i != context.read<BrowsePreferences>().path.length - 1)
            const Text(
              "/",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
        ]
      ],
    );
  }
}

class EntryTableRow extends StatelessWidget {
  const EntryTableRow({Key? key, required this.title}) : super(key: key);
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
    bool contained =
        context.watch<BrowsePreferences>().selected.contains(title);
    return MaterialButton(
        onPressed: () {
          if (type == 'Folder') {
            context.read<BrowsePreferences>().appendPath(title);
          } else {
            context.read<BrowsePreferences>().toggleItem(title);
          }
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icons[type],
                  size: 20,
                  color:
                      contained ? Colors.orange.shade600 : mcol.secondaryIcon),
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
                type == 'Folder'
                    ? UniconsLine.angle_right
                    : (contained
                        ? UniconsLine.check_circle
                        : UniconsLine.circle),
                size: 20,
                color: contained ? Colors.orange.shade600 : mcol.secondary,
              )
            ],
          ),
        ));
  }
}
