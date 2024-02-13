import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:mock_project/feature/auth/view_model/auth_vm.dart';
import 'package:mock_project/feature/counter/view_model/counter_vm.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterVM(),),
          ChangeNotifierProvider(create: (context) => AuthVM(),),
        ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale("en", "US"),
          Locale("uz", "UZ"),
          Locale("ru", "RU"),
        ],
          path: "assets/translations",
          fallbackLocale: const Locale("uz", "UZ"),
          child: const App(),
      ),
  ));
}