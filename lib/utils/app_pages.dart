import 'package:flutter_getx_app/page/counter/counter_binding.dart';
import 'package:flutter_getx_app/page/counter/counter_pages.dart';
import 'package:flutter_getx_app/page/other/other_binding.dart';
import 'package:flutter_getx_app/page/other/other_view.dart';
import 'package:flutter_getx_app/page/quote/quote_binding.dart';
import 'package:flutter_getx_app/page/quote/quote_view.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:get/get.dart';

final appPages=[
  GetPage(
    name: AppNames.counter,
     page:() => CounterPage(),
     binding:CounterBinding() 
     ),

     GetPage(
      name:AppNames.other,
       page:() => OtherView(),
       binding: OtherBinding()
       ),

       GetPage(
        name:AppNames.quote,
         page:() => QuoteView(),
         binding:QuoteBinding()
         )
];