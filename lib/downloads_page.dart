import 'package:flutter/material.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'batch_download.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({
    Key? key,
  }) : super(key: key);

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
                  AppLocalizations.of(context)!.downloadsTitle,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: mcol.primary),
                ),
                const Spacer(),
                CustomButton(
                  title: AppLocalizations.of(context)!.revealDownloadsFolder,
                  onPressed: () {},
                ),
              ],
            ),
            Container(height: 16),
            Row(
              children: [
                CustomButton(
                  title: AppLocalizations.of(context)!.cancelAllButton,
                  destructive: true,
                  onPressed: () {
                    context.read<DownloadStates>().cancelAll();
                  },
                ),
                // TODO show downloaded button
                // const SizedBox(width: 12),
                // CustomButton(
                //     title: AppLocalizations.of(context)!.showDownloadedButton,
                //     onPressed: () {}),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.tapToCancelHint,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
            Container(height: 16),
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
                child: Column(children: [
                  const DownloadsTableHeading(),
                  const Divider(height: 0),
                  if (context.watch<DownloadStates>().downloads.isEmpty &&
                      context.watch<DownloadStates>().downloading.isEmpty)
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 232,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(UniconsLine.cloud_question,
                                size: 48, color: mcol.secondaryIcon),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.seemsNoDownload,
                              style: TextStyle(
                                  color: mcol.secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )))
                  else ...[
                    for (var i = 0;
                        i < context.watch<DownloadStates>().downloading.length;
                        i++) ...[
                      DownloadsTableRow(
                        title: context
                            .read<DownloadStates>()
                            .downloading
                            .elementAt(i)["path"]
                            .last,
                        paperCount: 0,
                        progress: context
                            .watch<DownloadStates>()
                            .downloading
                            .elementAt(i)["progress"],
                        downloading: true,
                      ),
                      if (i !=
                          context.read<DownloadStates>().downloads.length - 1)
                        Divider(height: 0, color: mcol.buttonBorder),
                    ],
                    for (var i = 0;
                        i < context.watch<DownloadStates>().downloads.length;
                        i++) ...[
                      DownloadsTableRow(
                        title: context
                            .read<DownloadStates>()
                            .downloads
                            .elementAt(i)
                            .last,
                        downloading: false,
                        paperCount: 0,
                        progress: AppLocalizations.of(context)!.waitingProgress,
                      ),
                      if (i !=
                          context.read<DownloadStates>().downloads.length - 1)
                        Divider(height: 0, color: mcol.buttonBorder),
                    ],
                  ]
                ]))
          ],
        ));
  }
}

class DownloadsTableHeading extends StatelessWidget {
  const DownloadsTableHeading({
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
              AppLocalizations.of(context)!.fileNameHeading,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              AppLocalizations.of(context)!.progressHeading,
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

class DownloadsTableRow extends StatelessWidget {
  const DownloadsTableRow(
      {Key? key,
      required this.title,
      required this.paperCount,
      required this.progress,
      required this.downloading})
      : super(key: key);
  final String title;
  final int paperCount;
  final String progress;
  final bool downloading;
  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return MaterialButton(
        onPressed: () {
          if (downloading) {
            context.read<DownloadStates>().removeDownloading(title);
          }
          context.read<DownloadStates>().cancelDownload(title);
        },
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(UniconsLine.cube, size: 20, color: mcol.secondaryIcon),
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
                  progress,
                  style: TextStyle(
                      color: mcol.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                UniconsLine.times,
                size: 20,
                color: mcol.secondary,
              )
            ],
          ),
        ));
  }
}

String getDownloadUrl(List<String> path) {
  String result = "https://papers.gceguide.com/";
  if (path.first == "IGCSE") {
    result += "Cambridge%20IGCSE/";
  } else {
    result += "A%20Levels/";
  }
  for (var i = 1; i < path.length; i++) {
    result += path[i];
    if (i != path.length - 1) {
      result += "/";
    }
  }
  return result;
}

Future<void> tryRedownload(BuildContext context, List<String> currentDownload,
    String url, String save, int retryCount) async {
  if (retryCount > 5) {
    context.read<DownloadStates>().setDownloadingProgress(
        currentDownload, AppLocalizations.of(context)!.downloadFailedProgress);
    if (kDebugMode) {
      print("Retry exceeds limit.");
    }
    downloadFile(context, save);
    return;
  }
  Dio().download(
    url,
    save,
    onReceiveProgress: (received, total) {
      context.read<DownloadStates>().setDownloadingProgress(
          currentDownload, "${(received / total * 100).toStringAsFixed(0)}%");
    },
  ).then((value) {
    context.read<DownloadStates>().removeDownloading(currentDownload.last);
    context.read<DownloadStates>().addDownloaded(currentDownload);
    downloadFile(context, save);
  }).onError((error, stackTrace) {
    context
        .read<DownloadStates>()
        .setDownloadingProgress(currentDownload, "Retrying #$retryCount");
    if (kDebugMode) {
      print(
          "Trying to redownload ${currentDownload.last}. This is try #$retryCount.");
      print("This is because");
      print(error);
    }
    tryRedownload(context, currentDownload, url, save, retryCount + 1);
  });
}

Future<void> downloadFile(BuildContext context, String save) async {
  if (context.read<DownloadStates>().downloads.isNotEmpty) {
    List<String> currentDownload =
        context.read<DownloadStates>().downloads.first;
    context.read<DownloadStates>().removeFirstDownload();
    context.read<DownloadStates>().addDownloading(currentDownload);
    String url = getDownloadUrl(currentDownload);
    if (kDebugMode) {
      print("Downloading from $url");
    }
    String fileLocation = "$save/${currentDownload.last}";

    Dio().download(
      url,
      fileLocation,
      onReceiveProgress: (received, total) {
        context.read<DownloadStates>().setDownloadingProgress(
            currentDownload, "${(received / total * 100).toStringAsFixed(0)}%");
      },
    ).then((value) {
      context.read<DownloadStates>().removeDownloading(currentDownload.last);
      context.read<DownloadStates>().addDownloaded(currentDownload);
      downloadFile(context, save);
    }).onError((error, stackTrace) {
      context
          .read<DownloadStates>()
          .setDownloadingProgress(currentDownload, "Retrying #0");
      if (kDebugMode) {
        print(
            "Trying to redownload ${currentDownload.last}. This is the first try.");
        print("This is because");
        print(error);
      }
      tryRedownload(context, currentDownload, url, fileLocation, 0);
    });
  }
}

Future<void> downloadFiles(BuildContext context) async {
  if (context.read<DownloadStates>().isDownloading == true) {
    return;
  }
  context.read<DownloadStates>().setIsDownloading(true);
  int threads = context.read<Settings>().simultaneous;
  String saveTo = context.read<Settings>().path;
  for (var i = 0; i < threads; i++) {
    if (context.read<DownloadStates>().downloads.isEmpty) {
      if (kDebugMode) {
        print("Download ended on thread #$i");
      }
      break;
    }
    if (kDebugMode) {
      print("Download task started on #$i");
    }
    downloadFile(context, saveTo);
  }
  context.read<DownloadStates>().setIsDownloading(false);
}
