import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'select_subject.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'paper_filter.dart';

class BatchDownloadPage extends StatelessWidget {
  const BatchDownloadPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<dynamic> seasons = [
      ['m', 'Spring (February - March)', UniconsLine.trees],
      ['s', 'Summer (May - June)', UniconsLine.sun],
      ['w', 'Winter (October - November)', UniconsLine.snow_flake],
      ['o', 'Other Seasons', UniconsLine.ellipsis_h],
    ];

    const List<dynamic> paperNumbers = [
      ['1', 'Paper 1', Icons.looks_one_outlined],
      ['2', 'Paper 2', Icons.looks_two_outlined],
      ['3', 'Paper 3', Icons.looks_3_outlined],
      ['4', 'Paper 4', Icons.looks_4_outlined],
      ['5', 'Paper 5', Icons.looks_5_outlined],
      ['6', 'Paper 6', Icons.looks_6_outlined],
    ];

    const List<dynamic> paperTypes = [
      ['qp', 'Question Paper', UniconsLine.file_question_alt],
      ['ms', 'Mark Scheme', UniconsLine.file_check_alt],
      ['sp', 'Specimen Paper', UniconsLine.file_bookmark_alt],
      ['sm', 'Specimen Mark Scheme', UniconsLine.file_bookmark_alt],
      ['er', 'Examiner Report', UniconsLine.file_search_alt],
      ['gt', 'Grade Thresholds', UniconsLine.file_graph],
      ['ci', 'Confidential Instructions', UniconsLine.file_info_alt],
      ['ot', 'Others', UniconsLine.copy_alt],
    ];

    bool accessible = (context.watch<BatchPreferences>().subject != "") &&
        (context.watch<BatchPreferences>().seasons.isNotEmpty) &&
        (context.watch<BatchPreferences>().paperNumbers.isNotEmpty) &&
        (context.watch<BatchPreferences>().paperTypes.isNotEmpty);

    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 48, left: 32, right: 32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Batch Download",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        Container(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 3,
              child: Text("Syllabus",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonGroup(),
                  const SizedBox(height: 20),
                  longButton(
                      context.watch<BatchPreferences>().subject == ""
                          ? "Select subject"
                          : context.read<BatchPreferences>().subject,
                      UniconsLine.book_alt,
                      UniconsLine.angle_right, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectSubjectPage(),
                            fullscreenDialog: true));
                  },
                      placeholder:
                          (context.watch<BatchPreferences>().subject == ""))
                ],
              ),
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
              child: Text("Year range",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            const Expanded(
              flex: 6,
              child: YearRangeSlider(),
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
              child: Text("Seasons",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    longButton(
                        context.watch<BatchPreferences>().seasons.isEmpty
                            ? "Select season"
                            : '${context.read<BatchPreferences>().seasons.length} season${context.read<BatchPreferences>().seasons.length != 1 ? "s" : ""} selected',
                        UniconsLine.calender,
                        context.watch<BatchPreferences>().selectSeasonOpen
                            ? UniconsLine.angle_up
                            : UniconsLine.angle_down, () {
                      context.read<BatchPreferences>().toggleSelectSeason();
                    },
                        placeholder:
                            context.read<BatchPreferences>().seasons.isEmpty,
                        radiusMode:
                            context.watch<BatchPreferences>().selectSeasonOpen
                                ? 1
                                : 0),
                    if (context.watch<BatchPreferences>().selectSeasonOpen) ...[
                      if (context.read<BatchPreferences>().seasons.length ==
                          seasons.length)
                        longButton("Select none", null, null, () {
                          context.read<BatchPreferences>().changeSeasons([]);
                        }, isMenuItem: true, radiusMode: 3, transformOffset: 1)
                      else
                        longButton("Select all", null, null, () {
                          context.read<BatchPreferences>().changeSeasons(
                              [for (var i = 0; i < seasons.length; i++) i]);
                        }, isMenuItem: true, radiusMode: 3, transformOffset: 1),
                      for (var index = 0; index < seasons.length; index++)
                        longButton(
                            seasons[index][1],
                            seasons[index][2],
                            context
                                    .watch<BatchPreferences>()
                                    .seasons
                                    .contains(index)
                                ? UniconsLine.check
                                : null, () {
                          context.read<BatchPreferences>().toggleSeason(index);
                        },
                            radiusMode: index == (seasons.length - 1) ? 2 : 3,
                            transformOffset: (index + 2).toDouble(),
                            isMenuItem: true)
                    ],
                  ]),
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
              child: Text("Paper type",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      longButton(
                          context.watch<BatchPreferences>().paperNumbers.isEmpty
                              ? "Select paper numbers"
                              : '${context.read<BatchPreferences>().paperNumbers.length} paper number${context.read<BatchPreferences>().paperNumbers.length != 1 ? "s" : ""} selected',
                          UniconsLine.list_ol_alt,
                          context
                                  .watch<BatchPreferences>()
                                  .selectPaperNumberOpen
                              ? UniconsLine.angle_up
                              : UniconsLine.angle_down, () {
                        context
                            .read<BatchPreferences>()
                            .toggleSelectPaperNumber();
                      },
                          placeholder: context
                              .read<BatchPreferences>()
                              .paperNumbers
                              .isEmpty,
                          radiusMode: context
                                  .watch<BatchPreferences>()
                                  .selectPaperNumberOpen
                              ? 1
                              : 0),
                      if (context
                          .watch<BatchPreferences>()
                          .selectPaperNumberOpen) ...[
                        if (context
                                .read<BatchPreferences>()
                                .paperNumbers
                                .length ==
                            paperNumbers.length)
                          longButton("Select none", null, null, () {
                            context
                                .read<BatchPreferences>()
                                .changePaperNumber([]);
                          },
                              isMenuItem: true,
                              radiusMode: 3,
                              transformOffset: 1)
                        else
                          longButton("Select all", null, null, () {
                            context.read<BatchPreferences>().changePaperNumber([
                              for (var i = 0; i < paperNumbers.length; i++) i
                            ]);
                          },
                              isMenuItem: true,
                              radiusMode: 3,
                              transformOffset: 1),
                        for (var index = 0;
                            index < paperNumbers.length;
                            index++)
                          longButton(
                              paperNumbers[index][1],
                              paperNumbers[index][2],
                              context
                                      .watch<BatchPreferences>()
                                      .paperNumbers
                                      .contains(index)
                                  ? UniconsLine.check
                                  : null, () {
                            context
                                .read<BatchPreferences>()
                                .togglePaperNumber(index);
                          },
                              radiusMode:
                                  index == (paperNumbers.length - 1) ? 2 : 3,
                              transformOffset: (index + 2).toDouble(),
                              isMenuItem: true)
                      ]
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        longButton(
                            context.watch<BatchPreferences>().paperTypes.isEmpty
                                ? "Select paper types"
                                : '${context.read<BatchPreferences>().paperTypes.length} paper type${context.read<BatchPreferences>().paperTypes.length != 1 ? "s" : ""} selected',
                            UniconsLine.apps,
                            context
                                    .watch<BatchPreferences>()
                                    .selectPaperTypeOpen
                                ? UniconsLine.angle_up
                                : UniconsLine.angle_down, () {
                          context
                              .read<BatchPreferences>()
                              .toggleSelectPaperType();
                        },
                            placeholder: context
                                .read<BatchPreferences>()
                                .paperTypes
                                .isEmpty,
                            radiusMode: context
                                    .watch<BatchPreferences>()
                                    .selectPaperTypeOpen
                                ? 1
                                : 0),
                        if (context
                            .watch<BatchPreferences>()
                            .selectPaperTypeOpen) ...[
                          if (context
                                  .read<BatchPreferences>()
                                  .paperTypes
                                  .length ==
                              paperTypes.length)
                            longButton("Select none", null, null, () {
                              context
                                  .read<BatchPreferences>()
                                  .changePaperType([]);
                            },
                                isMenuItem: true,
                                radiusMode: 3,
                                transformOffset: 1)
                          else
                            longButton("Select all", null, null, () {
                              context.read<BatchPreferences>().changePaperType([
                                for (var i = 0; i < paperTypes.length; i++) i
                              ]);
                            },
                                isMenuItem: true,
                                radiusMode: 3,
                                transformOffset: 1),
                          for (var index = 0;
                              index < paperTypes.length;
                              index++)
                            longButton(
                                paperTypes[index][1],
                                paperTypes[index][2],
                                context
                                        .watch<BatchPreferences>()
                                        .paperTypes
                                        .contains(index)
                                    ? UniconsLine.check
                                    : null, () {
                              context
                                  .read<BatchPreferences>()
                                  .togglePaperType(index);
                            },
                                radiusMode:
                                    index == (paperTypes.length - 1) ? 2 : 3,
                                transformOffset: (index + 2).toDouble(),
                                isMenuItem: true)
                        ],
                      ]),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const VertDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!accessible)
              badge("Some fields are not filled in", destructive: true),
            const SizedBox(width: 12),
            CustomButton(
              title: "Add to Collection",
              onPressed: accessible
                  ? () {
                      CollectionItem collection = CollectionItem(
                          DateTime.now().toString(),
                          context.read<BatchPreferences>().syllabus,
                          context.read<BatchPreferences>().subject,
                          context.read<BatchPreferences>().beginYear,
                          context.read<BatchPreferences>().endYear,
                          context.read<BatchPreferences>().seasons.toList(),
                          context
                              .read<BatchPreferences>()
                              .paperNumbers
                              .toList(),
                          context.read<BatchPreferences>().paperTypes.toList(),
                          0);
                      context.read<CollectionStates>().addItem(collection);
                    }
                  : null,
            ),
            const SizedBox(width: 12),
            CustomButton(
              title: "Download",
              primary: true,
              onPressed: accessible
                  ? () async {
                      context.read<DownloadStates>().setDownloads(
                          await getPapers(CollectionItem(
                              DateTime.now().toString(),
                              context.read<BatchPreferences>().syllabus,
                              context.read<BatchPreferences>().subject,
                              context.read<BatchPreferences>().beginYear,
                              context.read<BatchPreferences>().endYear,
                              context.read<BatchPreferences>().seasons.toList(),
                              context
                                  .read<BatchPreferences>()
                                  .paperNumbers
                                  .toList(),
                              context
                                  .read<BatchPreferences>()
                                  .paperTypes
                                  .toList(),
                              0)));
                    }
                  : null,
            ),
          ],
        )
      ]),
    );
  }
}

Widget longButton(
    String title, IconData? leading, IconData? trailing, Function() onPressed,
    {bool placeholder = true,
    int radiusMode = 0,
    double transformOffset = 0,
    bool isMenuItem = false}) {
  // radiusMode: 0 - all, 1 - top, 2 - bottom, 3 - none
  var borderRadius = BorderRadius.zero;
  var transform = Matrix4.translationValues(0, 0, 0);
  if (radiusMode == 0) {
    borderRadius = BorderRadius.circular(8);
  } else if (radiusMode == 1) {
    borderRadius = const BorderRadius.vertical(top: Radius.circular(8));
  } else if (radiusMode == 2) {
    borderRadius = const BorderRadius.vertical(bottom: Radius.circular(8));
    transform = Matrix4.translationValues(0, -transformOffset, 0);
  } else {
    borderRadius = BorderRadius.zero;
    transform = Matrix4.translationValues(0, -transformOffset, 0);
  }
  return Container(
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
    transform: transform,
    child: MaterialButton(
      color: Colors.white,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      minWidth: double.infinity,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: Colors.grey.shade300)),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            if (isMenuItem) const SizedBox(width: 16),
            if (leading != null)
              Icon(
                leading,
                color: Colors.grey.shade600,
                size: 20,
              ),
            const SizedBox(width: 8),
            Expanded(
              flex: 99,
              child: Text(title,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: (placeholder && !isMenuItem)
                          ? Colors.grey.shade600
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
            const Spacer(flex: 1),
            if (trailing != null)
              Icon(
                trailing,
                color: Colors.grey.shade600,
                size: 20,
              ),
          ],
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String title;
  final bool? primary;
  final IconData? leading;
  final IconData? trailing;
  final Function()? onPressed;
  final bool destructive;
  const CustomButton(
      {Key? key,
      required this.title,
      this.leading,
      this.trailing,
      this.primary,
      required this.onPressed,
      this.destructive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return MaterialButton(
        color: Colors.grey.shade300,
        elevation: 0,
        disabledColor: Colors.grey.shade300,
        disabledTextColor: Colors.grey.shade500,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade400)),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            children: [
              if (leading != null)
                Icon(
                  leading,
                  color: (primary != null && primary != false)
                      ? Colors.orange.shade100
                      : Colors.grey.shade600,
                  size: 20,
                ),
              if (leading != null) const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500)),
              if (trailing != null) const SizedBox(width: 8),
              if (trailing != null)
                Icon(
                  trailing,
                  color: (primary != null && primary != false)
                      ? Colors.orange.shade100
                      : Colors.grey.shade600,
                  size: 20,
                ),
            ],
          ),
        ),
      );
    } else {
      return Container(
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
          color: (primary != null && primary != false)
              ? Colors.orange
              : Colors.white,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: (primary != null && primary != false)
                      ? Colors.orange.shade300
                      : Colors.grey.shade300)),
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                if (leading != null)
                  Icon(
                    leading,
                    color: (primary != null && primary != false)
                        ? Colors.orange.shade100
                        : Colors.grey.shade600,
                    size: 20,
                  ),
                if (leading != null) const SizedBox(width: 8),
                Text(title,
                    style: TextStyle(
                        color: (primary != null && primary != false)
                            ? Colors.white
                            : (destructive ? Colors.red : Colors.black),
                        fontWeight: FontWeight.w500)),
                if (trailing != null) const SizedBox(width: 8),
                if (trailing != null)
                  Icon(
                    trailing,
                    color: (primary != null && primary != false)
                        ? Colors.orange.shade100
                        : Colors.grey.shade600,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

Widget badge(String content, {bool destructive = false}) {
  return Container(
    height: 28,
    decoration: BoxDecoration(
        color: destructive ? Colors.red.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(100)),
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: destructive ? Colors.red : Colors.orange,
                borderRadius: BorderRadius.circular(100)),
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 6, top: 2),
          ),
          Text(
            content,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color:
                    destructive ? Colors.red.shade900 : Colors.orange.shade900),
          ),
        ],
      ),
    ),
  );
}

class VertDivider extends StatelessWidget {
  const VertDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Divider(),
    );
  }
}

class _ButtonGroupState extends State<ButtonGroup> {
  var selected = 1;
  @override
  Widget build(BuildContext context) {
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
            color: (context.watch<BatchPreferences>().syllabus == 0
                ? Colors.orange
                : Colors.white),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                side: BorderSide(
                    color: context.watch<BatchPreferences>().syllabus == 0
                        ? Colors.orange.shade300
                        : Colors.grey.shade300)),
            onPressed: () {
              setState(() {
                context.read<BatchPreferences>().setSyllabus(0);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("IGCSE",
                  style: TextStyle(
                      color: (context.watch<BatchPreferences>().syllabus == 0
                          ? Colors.white
                          : Colors.black),
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
            color: (context.watch<BatchPreferences>().syllabus == 1
                ? Colors.orange
                : Colors.white),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                side: BorderSide(
                    color: context.watch<BatchPreferences>().syllabus == 1
                        ? Colors.orange.shade300
                        : Colors.grey.shade300)),
            onPressed: () {
              setState(() {
                context.read<BatchPreferences>().setSyllabus(1);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text("A Level",
                  style: TextStyle(
                      color: (context.watch<BatchPreferences>().syllabus == 1
                          ? Colors.white
                          : Colors.black),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSliderThumbShape extends RangeSliderThumbShape {
  const CustomSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  final double enabledThumbRadius;

  final double? disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  final double elevation;

  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    assert(sliderTheme.showValueIndicator != null);
    assert(sliderTheme.overlappingShapeStrokeColor != null);
    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    final double radius = radiusTween.evaluate(enableAnimation);
    final Tween<double> elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );
    if (isOnTop ?? false) {
      final Paint strokePaint = Paint()
        ..color = sliderTheme.overlappingShapeStrokeColor!
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, strokePaint);
    }

    final Color color = colorTween.evaluate(enableAnimation)!;

    final double evaluatedElevation =
        isPressed! ? elevationTween.evaluate(activationAnimation) : elevation;
    final Path shadowPath = Path()
      ..addArc(
          Rect.fromCenter(
              center: center, width: 2 * radius, height: 2 * radius),
          0,
          math.pi * 2);
    canvas.drawShadow(shadowPath, const Color.fromARGB(40, 24, 40, 13),
        evaluatedElevation, true);

    canvas.drawCircle(
      center,
      radius,
      Paint()..color = color,
    );
  }
}

class YearRangeSlider extends StatefulWidget {
  const YearRangeSlider({Key? key}) : super(key: key);

  @override
  State<YearRangeSlider> createState() => _YearRangeSliderState();
}

class _YearRangeSliderState extends State<YearRangeSlider> {
  @override
  Widget build(BuildContext context) {
    double start = context.watch<BatchPreferences>().beginYear.toDouble();
    double end = context.watch<BatchPreferences>().endYear.toDouble();
    return SliderTheme(
        data: SliderThemeData(
            activeTrackColor: Colors.orange.shade500,
            inactiveTrackColor: Colors.grey.shade200,
            inactiveTickMarkColor: Colors.grey.shade400,
            thumbColor: Colors.white,
            overlayColor: Colors.transparent,
            trackHeight: 6,
            valueIndicatorColor: Colors.white,
            overlayShape: SliderComponentShape.noOverlay,
            rangeThumbShape: const CustomSliderThumbShape(
                enabledThumbRadius: 12, elevation: 4, pressedElevation: 4),
            rangeValueIndicatorShape: const CustomValueIndicatorShape(),
            valueIndicatorTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500)),
        child: RangeSlider(
          min: 2010,
          max: 2022,
          divisions: 12,
          labels: RangeLabels(
            start.round().toString(),
            end.round().toString(),
          ),
          values: RangeValues(start, end),
          onChanged: (values) {
            context
                .read<BatchPreferences>()
                .setYears(values.start.round(), values.end.round());
          },
        ));
  }
}

class CustomValueIndicatorShape extends RangeSliderValueIndicatorShape {
  const CustomValueIndicatorShape();

  static const _CustomSliderValueIndicatorPathPainter _pathPainter =
      _CustomSliderValueIndicatorPathPainter();

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    required TextPainter labelPainter,
    required double textScaleFactor,
  }) {
    assert(textScaleFactor >= 0);
    return _pathPainter.getPreferredSize(labelPainter, textScaleFactor);
  }

  @override
  double getHorizontalShift({
    RenderBox? parentBox,
    Offset? center,
    TextPainter? labelPainter,
    Animation<double>? activationAnimation,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    return _pathPainter.getHorizontalShift(
      parentBox: parentBox!,
      center: center!,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      scale: activationAnimation!.value,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    bool? isOnTop,
    TextPainter? labelPainter,
    double? textScaleFactor,
    Size? sizeWithOverflow,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    Thumb? thumb,
  }) {
    final Canvas canvas = context.canvas;
    final double scale = activationAnimation!.value;
    _pathPainter.paint(
      parentBox: parentBox!,
      canvas: canvas,
      center: center,
      scale: scale,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      backgroundPaintColor: sliderTheme!.valueIndicatorColor!,
      strokePaintColor:
          isOnTop! ? sliderTheme.overlappingShapeStrokeColor : null,
    );
  }
}

class _CustomSliderValueIndicatorPathPainter {
  const _CustomSliderValueIndicatorPathPainter();

  static const double _triangleHeight = 8.0;
  static const double _labelPadding = 16.0;
  static const double _preferredHeight = 32.0;
  static const double _minLabelWidth = 16.0;
  static const double _bottomTipYOffset = 14.0;
  static const double _preferredHalfHeight = _preferredHeight / 2;
  static const double _upperRectRadius = 8;

  Size getPreferredSize(
    TextPainter labelPainter,
    double textScaleFactor,
  ) {
    return Size(
      _upperRectangleWidth(labelPainter, 1, textScaleFactor),
      labelPainter.height + _labelPadding,
    );
  }

  double getHorizontalShift({
    required RenderBox parentBox,
    required Offset center,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required double scale,
  }) {
    assert(!sizeWithOverflow.isEmpty);

    const double edgePadding = 8.0;
    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);
    final Offset globalCenter = parentBox.localToGlobal(center);
    final double overflowLeft =
        math.max(0, rectangleWidth / 2 - globalCenter.dx + edgePadding);
    final double overflowRight = math.max(
        0,
        rectangleWidth / 2 -
            (sizeWithOverflow.width - globalCenter.dx - edgePadding));

    if (rectangleWidth < sizeWithOverflow.width) {
      return overflowLeft - overflowRight;
    } else if (overflowLeft - overflowRight > 0) {
      return overflowLeft - (edgePadding * textScaleFactor);
    } else {
      return -overflowRight + (edgePadding * textScaleFactor);
    }
  }

  double _upperRectangleWidth(
      TextPainter labelPainter, double scale, double textScaleFactor) {
    final double unscaledWidth =
        math.max(_minLabelWidth * textScaleFactor, labelPainter.width) +
            _labelPadding * 2;
    return unscaledWidth * scale;
  }

  void paint({
    required RenderBox parentBox,
    required Canvas canvas,
    required Offset center,
    required double scale,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required Color backgroundPaintColor,
    Color? strokePaintColor,
  }) {
    if (scale == 0.0) {
      return;
    }
    assert(!sizeWithOverflow.isEmpty);

    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);
    final double horizontalShift = getHorizontalShift(
      parentBox: parentBox,
      center: center,
      labelPainter: labelPainter,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      scale: scale,
    );

    final double rectHeight = labelPainter.height + _labelPadding;
    final Rect upperRect = Rect.fromLTWH(
      -rectangleWidth / 2 + horizontalShift,
      -_triangleHeight - rectHeight,
      rectangleWidth,
      rectHeight,
    );

    final Path trianglePath = Path()
      ..lineTo(-_triangleHeight, -_triangleHeight)
      ..lineTo(_triangleHeight, -_triangleHeight)
      ..close();
    final Paint fillPaint = Paint()..color = backgroundPaintColor;
    final RRect upperRRect = RRect.fromRectAndRadius(
        upperRect, const Radius.circular(_upperRectRadius));
    trianglePath.addRRect(upperRRect);

    canvas.save();
    canvas.translate(center.dx, center.dy - _bottomTipYOffset);
    canvas.scale(scale, scale);
    canvas.drawShadow(
        trianglePath, const Color.fromARGB(40, 24, 40, 13), 4, true);
    if (strokePaintColor != null) {
      final Paint strokePaint = Paint()
        ..color = strokePaintColor
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawPath(trianglePath, strokePaint);
    }
    canvas.drawPath(trianglePath, fillPaint);

    final double bottomTipToUpperRectTranslateY =
        -_preferredHalfHeight / 2 - upperRect.height;
    canvas.translate(0, bottomTipToUpperRectTranslateY);
    final Offset boxCenter = Offset(horizontalShift, upperRect.height / 2);
    final Offset halfLabelPainterOffset =
        Offset(labelPainter.width / 2, labelPainter.height / 2);
    final Offset labelOffset = boxCenter - halfLabelPainterOffset;
    labelPainter.paint(canvas, labelOffset);
    canvas.restore();
  }
}

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({Key? key}) : super(key: key);

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}
