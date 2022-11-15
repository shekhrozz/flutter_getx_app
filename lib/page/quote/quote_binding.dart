

import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:flutter_getx_app/page/quote/detail/detail_controller.dart';
import 'package:flutter_getx_app/page/quote/quote_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class QuoteBinding extends Bindings { 
  @override
  void dependencies() {
    Get.lazyPut<QuoteController>(() => QuoteController());
    Get.lazyPut<CounterController>(() =>CounterController());
    Get.lazyPut<DetailController>(() => DetailController());
  }
}