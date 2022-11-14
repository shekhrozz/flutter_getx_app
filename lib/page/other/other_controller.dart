

import 'dart:developer';

import 'package:get/get.dart';

class OtherController extends GetxController  {

    late int count;
    @override
  void onInit() {
    count=0;
    update();
    super.onInit();
  }  

  @override
  void onReady() {
    log('On READY');
    super.onReady();
  }
  @override
  void onClose() {
    log('On CLOSE');
    super.onClose();

  }
  void increment(){
    count++;
    update();
  }
  void decrement(){
    count--;
    update();
  }
}