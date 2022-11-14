import 'package:flutter/material.dart';
import 'package:flutter_getx_app/page/counter/counter_binding.dart';
import 'package:flutter_getx_app/page/counter/counter_pages.dart';
import 'package:flutter_getx_app/page/other/other_binding.dart';
import 'package:flutter_getx_app/page/quote/quote_binding.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:flutter_getx_app/utils/app_pages.dart';
import 'package:flutter_getx_app/utils/localization/app_localization.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale:Get.deviceLocale,
     
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: AppLocalization(),
      supportedLocales: const [Locale('uz', 'UZ'), Locale('en', 'GB')],
      fallbackLocale: const Locale('en', 'GB'),
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      getPages:appPages,
      initialBinding:QuoteBinding(),
      initialRoute: AppNames.quote
    );
  }
}
