import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/data/db/content_db.dart';
import 'package:movie_app_flutter/pages/main/main_page.dart';
import 'package:movie_app_flutter/resources/colors.dart';

const fontItcAvantGardeStd = 'itc_avant_garde_std';
const fontEthnocentric = 'Ethnocentric';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final _database = await $FloorContentDatabase.databaseBuilder('content_database.db').build();

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(_database),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: MovieColors.yellow,
        textTheme: textTheme.copyWith(
          headline1: textTheme.headline1!.copyWith(
              fontFamily: fontItcAvantGardeStd,
              fontWeight: FontWeight.w600,
              color: MovieColors.greyText,
              fontSize: 90),
          headline2: textTheme.headline2!.copyWith(
              fontFamily: fontItcAvantGardeStd,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20),
          headline3: textTheme.headline3!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            color: MovieColors.greyText,
            fontSize: 14.0,
          ),
          headline4: textTheme.headline4!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline5: textTheme.headline5!.copyWith(
              fontFamily: fontItcAvantGardeStd,
              fontWeight: FontWeight.w500,
              color: MovieColors.greyText,
              fontSize: 16,
              height: 1.6),
          headline6: textTheme.headline6!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          subtitle1: textTheme.subtitle1!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          bodyText1: textTheme.bodyText1!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          bodyText2: textTheme.bodyText2!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          button: textTheme.button!.copyWith(
              fontFamily: fontItcAvantGardeStd,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16),
          caption: textTheme.caption!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            color: MovieColors.greyText,
            fontWeight: FontWeight.w500,
          ),
          overline: textTheme.overline!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}
