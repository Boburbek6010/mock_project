import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mock_project/feature/auth/view/pages/register_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const RegisterPage(),
    );
  }
}