import 'package:flutter/material.dart';
import 'package:theming_app_templete/core/language/app_localizations.dart';

class BuildRadioListTile<T> extends StatelessWidget {
  const BuildRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.labelKey,
  });

  final T groupValue;
  final void Function(T?) onChanged;
  final String labelKey;
  final T value;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context)!;
    return RadioListTile<T>(
      title: Text(appLocal.translate(labelKey)!),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
