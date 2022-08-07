import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'batch_download.dart';
import 'package:file_picker/file_picker.dart';
import 'colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
        margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppLocalizations.of(context)!.settingsTitle,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: mcol.primary),
          ),
          Container(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.appearanceTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
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
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.downloadPathTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              Expanded(
                flex: 6,
                child: LongButton(
                    title: context.watch<Settings>().path == ""
                        ? AppLocalizations.of(context)!.selectDownloadPathButton
                        : context.read<Settings>().path,
                    leading: UniconsLine.download_alt,
                    trailing: UniconsLine.angle_right,
                    onPressed: () async {
                      Future<String?> selectedDirectory = FilePicker.platform
                          .getDirectoryPath(
                              dialogTitle: AppLocalizations.of(context)!
                                  .selectDownloadPathButton);
                      context.read<Settings>().setPath(selectedDirectory);
                    },
                    placeholder: (context.watch<Settings>().path == "")),
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
              Expanded(
                flex: 3,
                child: Text(
                    AppLocalizations.of(context)!.simultaneousDownloadsTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              const Expanded(
                flex: 6,
                child: ValueStepper(),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
          const VertDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(AppLocalizations.of(context)!.languageTag,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mcol.primary)),
              ),
              const Expanded(
                flex: 6,
                child: LanguageButtons(),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ]));
  }
}

class LanguageButtons extends StatefulWidget {
  const LanguageButtons({Key? key}) : super(key: key);

  @override
  State<LanguageButtons> createState() => _LanguageButtonsState();
}

class _LanguageButtonsState extends State<LanguageButtons> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    const languages = {
      "English": Locale("en"),
      "简体中文": Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      "繁体中文": Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
    };
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
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
          child: ToggleButtons(
              constraints: const BoxConstraints(minHeight: 36),
              isSelected: context.watch<LocaleProvider>().selected,
              onPressed: (index) {
                context
                    .read<LocaleProvider>()
                    .setLocale(languages.values.toList()[index]);
                context.read<LocaleProvider>().setSelected(index);
              },
              borderRadius: BorderRadius.circular(8),
              borderColor: mcol.buttonBorder,
              fillColor: Colors.orange,
              selectedColor: Colors.white,
              color: mcol.primary,
              selectedBorderColor: Colors.orange.shade300,
              children: [
                for (var i in languages.keys)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(i,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  )
              ]),
        ),
      ],
    );
  }
}

class _AppearanceButtonsState extends State<AppearanceButtons> {
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
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
            color: (selected == 0 ? Colors.orange : mcol.buttonBackground),
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
                        : mcol.buttonBorder)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(0);
                context.read<Appearance>().setAutoMode();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.autoButton,
                  style: TextStyle(
                      color: (selected == 0 ? Colors.white : mcol.primary),
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
            color: (selected == 1 ? Colors.orange : mcol.buttonBackground),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.zero),
                side: BorderSide(
                    color: selected == 1
                        ? Colors.orange.shade300
                        : mcol.buttonBorder)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(1);
                context.read<Appearance>().changeMode(false);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.lightButton,
                  style: TextStyle(
                      color: (selected == 1 ? Colors.white : mcol.primary),
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
            color: (selected == 2 ? Colors.orange : mcol.buttonBackground),
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
                        : mcol.buttonBorder)),
            onPressed: () {
              setState(() {
                context.read<Settings>().changeAppearance(2);
                context.read<Appearance>().changeMode(true);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.darkButton,
                  style: TextStyle(
                      color: (selected == 2 ? Colors.white : mcol.primary),
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
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
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
          color: mcol.buttonBackground,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              side: BorderSide(color: mcol.buttonBorder)),
          onPressed: () {
            context.read<Settings>().increaseSimultaneous();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Icon(UniconsLine.angle_up, color: mcol.primary, size: 17),
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
          color: mcol.buttonBackground,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          disabledColor: mcol.buttonBackground,
          disabledTextColor: mcol.secondary,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.zero),
              side: BorderSide(color: mcol.buttonBorder)),
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
          color: mcol.buttonBackground,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              side: BorderSide(color: mcol.buttonBorder)),
          onPressed: () {
            context.read<Settings>().decreaseSimultaneous();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Icon(UniconsLine.angle_down, color: mcol.primary, size: 17),
          ),
        ),
      ),
    ]);
  }
}
