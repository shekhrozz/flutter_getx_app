
import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:flutter_getx_app/page/counter/counter_pages.dart';
import 'package:get/get.dart';

class CounterBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<CounterController>(() =>CounterController());
  
  }
}