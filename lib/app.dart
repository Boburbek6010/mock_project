import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'feature/counter/view/counter_page.dart';
import 'feature/simple.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const CounterPage(),
    );
  }
}
