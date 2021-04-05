import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app_flutter/resources/colors.dart';

const fontItcAvantGardeStd = 'itc_avant_garde_std';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: textTheme!.copyWith(
          headline1: textTheme.headline1!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontWeight: FontWeight.w600,
            color: MovieColors.greyText,
          ),
          headline2: textTheme.headline2!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline3: textTheme.headline3!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            color: MovieColors.greyText,
          ),
          headline4: textTheme.headline4!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          headline5: textTheme.headline5!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            fontWeight: FontWeight.w400,
            color: MovieColors.greyText,
          ),
          headline6: textTheme.headline6!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          subtitle1: textTheme.subtitle1!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          bodyText1: textTheme.bodyText1!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          bodyText2: textTheme.bodyText2!.copyWith(
            fontFamily: fontItcAvantGardeStd,
          ),
          button: textTheme.button!.copyWith(
            fontFamily: fontItcAvantGardeStd,
            color: Colors.white,
          ),
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title = ""}) : super();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.helloWorld),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
