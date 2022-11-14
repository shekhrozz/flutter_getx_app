
import 'package:flutter_getx_app/page/other/other_controller.dart';
import 'package:flutter_getx_app/page/other/other_view.dart';
import 'package:get/get.dart';

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherController>(() =>OtherController());
  }
  
}
