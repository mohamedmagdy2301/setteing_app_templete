import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/language/app_localizations.dart';

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        appLocal.translate(title)!,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
