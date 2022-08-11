import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'subject_lists.dart';
import 'colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({Key? key}) : super(key: key);

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
                    context.read<SidebarStates>().removeContext();
                    Navigator.pop(context);
                  },
                  minWidth: 32,
                  child: Icon(UniconsLine.angle_left_b,
                      size: 30, color: mcol.primary),
                ),
                Text(
                  context.read<BatchPreferences>().syllabus == 0
                      ? "IGCSE ${AppLocalizations.of(context)!.subjectsTitle}"
                      : "A Level ${AppLocalizations.of(context)!.subjectsTitle}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary),
                ),
              ],
            ),
            const SizedBox(height: 32),
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
                  const SubjectTableHeading(),
                  Divider(
                    height: 0,
                    color: mcol.buttonBorder,
                  ),
                  for (var subject
                      in context.read<BatchPreferences>().syllabus == 0
                          ? igcseSubjects.keys
                          : alevelSubjects.keys) ...[
                    SubjectTableRow(
                        title: subject,
                        code: (context.read<BatchPreferences>().syllabus == 0
                            ? igcseSubjects
                            : alevelSubjects)[subject]!['code'],
                        leading: (context.read<BatchPreferences>().syllabus == 0
                            ? igcseSubjects
                            : alevelSubjects)[subject]!['icon'],
                        trailing: UniconsLine.angle_right),
                    if (subject != 'World Literature' &&
                        subject != 'Urdu - Pakistan only (A Level only)')
                      Divider(height: 0, color: mcol.buttonBorder),
                  ]
                ],
              ),
            ),
          ]),
        ),
      ),
    ]);
  }
}

class SubjectTableHeading extends StatelessWidget {
  const SubjectTableHeading({
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
              AppLocalizations.of(context)!.subjectNameHeading,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppLocalizations.of(context)!.subjectCodeHeading,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(flex: 1),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class SubjectTableRow extends StatelessWidget {
  const SubjectTableRow(
      {Key? key,
      required this.title,
      required this.code,
      required this.leading,
      required this.trailing})
      : super(key: key);
  final String title;
  final String code;
  final IconData leading;
  final IconData trailing;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return MaterialButton(
        onPressed: () {
          context.read<BatchPreferences>().setSubject('$title ($code)');
          Navigator.pop(context);
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(leading, size: 20, color: mcol.secondaryIcon),
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
                flex: 1,
                child: Text(
                  code,
                  style: TextStyle(
                      color: mcol.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(flex: 1),
              Icon(
                trailing,
                size: 20,
                color: mcol.secondary,
              )
            ],
          ),
        ));
  }
}
