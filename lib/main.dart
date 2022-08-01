import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:past_paper/about_page.dart';
import 'package:past_paper/downloads_page.dart';
import 'package:past_paper/settings_page.dart';
import 'package:window_manager/window_manager.dart';
import 'sidebar.dart';
import 'batch_download.dart';
import 'package:provider/provider.dart';
import 'browse_papers.dart';
import 'dart:convert';
import 'collection.dart';
import 'paper_filter.dart';

void main() async {
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1024, 768),
      minimumSize: Size(800, 400),
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BatchPreferences()),
    ChangeNotifierProvider(create: (_) => SidebarStates()),
    ChangeNotifierProvider(create: (_) => BrowsePreferences()),
    ChangeNotifierProvider(create: (_) => CollectionStates()),
    ChangeNotifierProvider(create: (_) => DownloadStates()),
    ChangeNotifierProvider(create: (_) => Settings()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var navigationKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      title: 'Past Paper Finder',
      home: Scaffold(
        body: Row(
          children: [
            const Sidebar(),
            Expanded(
                child: WillPopScope(
                    onWillPop: () async =>
                        !await navigationKey.currentState!.maybePop(),
                    child: Navigator(
                      key: navigationKey,
                      onGenerateRoute: (routeSettings) {
                        return MaterialPageRoute(
                          builder: (context) => ListView(children: [
                            if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                0) ...[
                              const BatchDownloadPage(),
                            ] else if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                1) ...[
                              const BrowsePapersPage(),
                            ] else if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                2) ...[
                              const CollectionPage(),
                            ] else if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                3) ...[
                              const DownloadsPage(),
                            ] else if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                4) ...[
                              const SettingsPage(),
                            ] else if (context
                                    .watch<SidebarStates>()
                                    .currentSelection ==
                                5) ...[
                              const AboutPage(),
                            ] else ...[
                              const Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Center(child: Text(" :( ")),
                              ),
                            ]
                          ]),
                        );
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}

class SidebarStates with ChangeNotifier {
  int _currentSelection = 0;
  int get currentSelection => _currentSelection;
  void changeSelection(int index) {
    _currentSelection = index;
    notifyListeners();
  }
}

class CollectionItem {
  final String name;
  final int syllabus;
  final String subject;
  final int beginYear;
  final int endYear;
  final List<int> season;
  final List<int> paperNumbers;
  final List<int> paperTypes;
  int paperCount;
  CollectionItem(
      this.name,
      this.syllabus,
      this.subject,
      this.beginYear,
      this.endYear,
      this.season,
      this.paperNumbers,
      this.paperTypes,
      this.paperCount);
}

class CollectionStates with ChangeNotifier {
  final Set<CollectionItem> _collection = {};
  Set<CollectionItem> get collection => _collection;
  int get collectionCount => _collection.length;

  void addItem(CollectionItem obj) async {
    obj.paperCount = (await getPapers(obj)).length;
    _collection.add(obj);
    notifyListeners();
  }

  void removeItem(String name) {
    _collection.removeWhere(
      (element) => element.name == name,
    );
    notifyListeners();
  }

  void removeAll() {
    _collection.clear();
    notifyListeners();
  }
}

class DownloadStates with ChangeNotifier {
  Set<List<String>> _downloads = {};
  Set<List<String>> get downloads => _downloads;
  final Set<String> _downloaded = {};
  Set<String> get downloaded => _downloaded;

  void addDownloaded(List<String> downloaded) {
    _downloaded.addAll(downloaded);
    notifyListeners();
  }

  void clearDownloaded() {
    _downloaded.clear();
    notifyListeners();
  }

  void removeDownloaded(String downloaded) {
    _downloaded.remove(downloaded);
    notifyListeners();
  }

  void setDownloads(List<List<String>> entries) {
    _downloads = entries.toSet();
    notifyListeners();
  }

  void addDownloads(List<List<String>> entries) {
    _downloads.addAll(entries);
    notifyListeners();
  }

  void cancelAllDownloads() {
    _downloads.clear();
    notifyListeners();
  }

  void cancelDownload(String entry) {
    _downloads.removeWhere(
      (element) => element.last == entry,
    );
    notifyListeners();
  }

  void downloadCollections(Set<CollectionItem> collection) async {
    for (CollectionItem item in collection) {
      List<List<String>> papers = await getPapers(item);
      addDownloads(papers);
    }
    notifyListeners();
  }
}

class BrowsePreferences with ChangeNotifier {
  final Set<String> _selected = {};
  Set<String> get selected => _selected;
  final Set<List<String>> _selectedPath = {};
  Set<List<String>> get selectedPath => _selectedPath;
  int get selectedCount => _selected.length;

  void toggleItem(String id) {
    if (_selected.contains(id)) {
      _selected.remove(id);
      _selectedPath.remove(_path + [id]);
    } else {
      _selected.add(id);
      _selectedPath.add(_path + [id]);
    }
    notifyListeners();
  }

  void removeItemInSelection(String id) {
    _selected.remove(id);
    _selectedPath.removeWhere((element) => element.contains(id));
    notifyListeners();
  }

  void removeAllSelected() {
    _selected.clear();
    _selectedPath.clear();
    notifyListeners();
  }

  List<String> _path = [];
  List<String> get path => _path;
  Future<Map> get _igcseMap => loadJsonData('assets/igcse.json');
  Future<Map> get _alevelMap => loadJsonData('assets/alevel.json');

  Future<Map<dynamic, dynamic>> loadJsonData(String path) async {
    String jsonText = await rootBundle.loadString(path);
    return json.decode(jsonText);
  }

  void _updateEntries() async {
    if (_path.isEmpty) {
      _entries = ['IGCSE', 'A Levels'];
    } else {
      if (_path[0] == 'IGCSE') {
        var map = await _igcseMap;
        for (int i = 1; i < _path.length; i++) {
          if (map[_path[i]].runtimeType != List) {
            map = map[_path[i]];
          } else {
            _entries = [
              for (var j in map[_path[i]]) ...[j.toString()]
            ];
            notifyListeners();
            return;
          }
        }
        _entries = [
          for (var i in map.keys.toList()) ...[i.toString()]
        ];
      } else {
        var map = await _alevelMap;
        for (int i = 1; i < _path.length; i++) {
          if (map[_path[i]].runtimeType != List) {
            map = map[_path[i]];
          } else {
            _entries = [
              for (var j in map[_path[i]]) ...[j.toString()]
            ];
            notifyListeners();
            return;
          }
        }
        _entries = [
          for (var i in map.keys.toList()) ...[i.toString()]
        ];
      }
    }
    notifyListeners();
  }

  void changePath(List<String> path) {
    _path = path;
    notifyListeners();
    _updateEntries();
  }

  void appendPath(String path) {
    _path.add(path);
    notifyListeners();
    _updateEntries();
  }

  List<String> _entries = ['IGCSE', 'A Levels'];
  List<String> get entries => _entries;
  void changeEntries(List<String> entries) {
    _entries = entries;
    notifyListeners();
  }
}

class Settings with ChangeNotifier {
  int _appearance = 0;
  int get appearance => _appearance;
  void changeAppearance(int appearance) {
    _appearance = appearance;
    notifyListeners();
  }

  String _path = "";
  String get path => _path;
  void changePath(String path) {
    _path = path;
    notifyListeners();
  }

  int _simultaneous = 3;
  int get simultaneous => _simultaneous;
  void changeSimultaneous(int simultaneous) {
    _simultaneous = simultaneous;
    notifyListeners();
  }

  void increaseSimultaneous() {
    if (simultaneous < 6) {
      _simultaneous++;
    }
    notifyListeners();
  }

  void decreaseSimultaneous() {
    if (simultaneous > 1) {
      _simultaneous--;
    }
    notifyListeners();
  }
}

class BatchPreferences with ChangeNotifier {
  String _subject = "";
  String get subject => _subject;

  int _syllabus = 0; // 0 - IGCSE, 1 - A Level
  int get syllabus => _syllabus;

  bool _selectSeasonOpen = false;
  bool get selectSeasonOpen => _selectSeasonOpen;
  final Set<int> _seasons = {};
  Set<int> get seasons => _seasons;

  bool _selectPaperNumberOpen = false;
  bool get selectPaperNumberOpen => _selectPaperNumberOpen;
  final Set<int> _paperNumbers = {};
  Set<int> get paperNumbers => _paperNumbers;

  bool _selectPaperTypeOpen = false;
  bool get selectPaperTypeOpen => _selectPaperTypeOpen;
  final Set<int> _paperTypes = {};
  Set<int> get paperTypes => _paperTypes;

  int _beginYear = 2018;
  int get beginYear => _beginYear;
  int _endYear = 2021;
  int get endYear => _endYear;

  void setYears(int begin, int end) {
    _beginYear = begin;
    _endYear = end;
    notifyListeners();
  }

  void setSubject(String sub) {
    _subject = sub;
    notifyListeners();
  }

  void setSyllabus(int syllabus) {
    if (syllabus != _syllabus) {
      _syllabus = syllabus;
      _subject = "";
    }
    notifyListeners();
  }

  void toggleSelectSeason() {
    _selectSeasonOpen = !_selectSeasonOpen;
    notifyListeners();
  }

  void toggleSeason(int season) {
    if (_seasons.contains(season)) {
      _seasons.remove(season);
    } else {
      _seasons.add(season);
    }
    notifyListeners();
  }

  void changeSeasons(List<int> seasons) {
    _seasons.clear();
    _seasons.addAll(seasons);
    notifyListeners();
  }

  void toggleSelectPaperNumber() {
    _selectPaperNumberOpen = !_selectPaperNumberOpen;
    notifyListeners();
  }

  void togglePaperNumber(int paperNumber) {
    if (_paperNumbers.contains(paperNumber)) {
      _paperNumbers.remove(paperNumber);
    } else {
      _paperNumbers.add(paperNumber);
    }
    notifyListeners();
  }

  void changePaperNumber(List<int> items) {
    _paperNumbers.clear();
    _paperNumbers.addAll(items);
    notifyListeners();
  }

  void toggleSelectPaperType() {
    _selectPaperTypeOpen = !_selectPaperTypeOpen;
    notifyListeners();
  }

  void togglePaperType(int paperType) {
    if (_paperTypes.contains(paperType)) {
      _paperTypes.remove(paperType);
    } else {
      _paperTypes.add(paperType);
    }
    notifyListeners();
  }

  void changePaperType(List<int> items) {
    _paperTypes.clear();
    _paperTypes.addAll(items);
    notifyListeners();
  }
}
