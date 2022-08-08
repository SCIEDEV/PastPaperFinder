import 'package:flutter/material.dart';
import 'package:past_paper/colors.dart';
import 'package:past_paper/main.dart';
import 'package:unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PathNotSpecifiedBanner extends StatelessWidget {
  const PathNotSpecifiedBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: mcol.errorBadgeBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: mcol.errorBannerBorder)),
        child: Row(
          children: [
            const Icon(UniconsLine.exclamation_octagon, color: Colors.red),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.downloadFailedTitle,
                style: TextStyle(
                    color: mcol.errorBadgeText, fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            Expanded(
              flex: 99,
              child: Text(
                AppLocalizations.of(context)!.downloadFailedMessage,
                style: TextStyle(color: mcol.errorBadgeText),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                    minWidth: 0,
                    onPressed: () {
                      context
                          .read<DownloadStates>()
                          .setShowDownloadFailedOn(-1);
                    },
                    child: const Icon(UniconsLine.times, color: Colors.red)),
              ],
            ),
          ],
        ));
  }
}

class TestingBanner extends StatelessWidget {
  const TestingBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MColors mcol = MColors(context.watch<Appearance>().darkMode);
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: mcol.badgeBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: mcol.badgeBorder)),
        child: Row(
          children: [
            const Icon(UniconsLine.trophy, color: Colors.orange),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.testingBannerTitle,
                style: TextStyle(
                    color: mcol.badgeText, fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                AppLocalizations.of(context)!.testingBannerContent,
                style: TextStyle(color: mcol.badgeText),
                softWrap: true,
              ),
            ),
          ],
        ));
  }
}
