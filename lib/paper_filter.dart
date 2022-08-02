import 'dart:convert';
import 'main.dart';
import 'package:flutter/services.dart';

Future<Map<dynamic, dynamic>> loadJsonData(String path) async {
  String jsonText = await rootBundle.loadString(path);
  return json.decode(jsonText);
}

bool verifyPaperType(List paperTypes, String entry) {
  const mappings = {
    0: "_qp",
    1: "_ms",
    2: "_sp",
    3: "_sm",
    4: "_er",
    5: "_gt",
    6: "_ci",
  };
  for (var i in paperTypes) {
    if (mappings.containsKey(i)) {
      if (entry.contains(mappings[i]!)) return true;
    }
  }
  for (var i in mappings.values) {
    if (entry.contains(i)) {
      return false;
    }
  }
  if (paperTypes.contains(8)) return true;
  return false;
}

bool verifyPaperNumber(List paperNumbers, String entry) {
  for (var i in paperNumbers) {
    if (entry.contains("_${i + 1}") || entry.contains("_0${i + 1}")) {
      return true;
    }
  }
  for (var i in ['1.', '2.', '3.', '4.', '5.', '6.', '7.', '8.', '9.']) {
    if (entry.contains(i)) {
      return false;
    }
  }
  return true;
}

bool verifySeason(List seasons, String entry, int year) {
  const mappings = {
    0: "_m",
    1: "_s",
    2: "_w",
  };
  for (var i in seasons) {
    if (mappings.containsKey(i)) {
      if (entry.contains(mappings[i]! + year.toString().substring(2, 3))) {
        return true;
      }
    }
  }
  for (var i in mappings.values) {
    if (entry.contains(i + year.toString().substring(2, 3))) {
      return false;
    }
  }
  if (seasons.contains(3)) return true;
  return false;
}

Future<List<List<String>>> getPapers(CollectionItem filter) async {
  Map map;
  List<String> path = [];
  if (filter.syllabus == 0) {
    map = await loadJsonData('assets/igcse.json');
    path.add("IGCSE");
  } else {
    map = await loadJsonData('assets/alevel.json');
    path.add("A Level");
  }
  map = map[filter.subject];
  path.add(filter.subject);
  List<List<String>> result = [];
  if (map.values.first.length == 0) {
    // Really want to just throw and return >:(
  } else {
    // NORMAL CASE: this subject is classified by year
    for (int i = filter.beginYear; i <= filter.endYear; i++) {
      path.add(i.toString());
      List? sublist = map[i.toString()];
      if (sublist != null) {
        for (String j in sublist) {
          if (verifyPaperNumber(filter.paperNumbers, j) &&
              verifyPaperType(filter.paperTypes, j) &&
              verifySeason(filter.season, j, i)) {
            result.add(path + [j]);
          }
        }
      }
      path.removeLast();
    }
  }
  return result;
}
