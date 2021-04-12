import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Translation on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;
}

const imageBaseUrl = "https://image.tmdb.org/t/p/";

extension StringExtentions on String {
  String get path => imageBaseUrl + "w500" + this;
}
