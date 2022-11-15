

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_app/data/dataprovider/quote_api.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/data/repository/quote_repository.dart';
import 'package:flutter_getx_app/service/prefs.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController  {
  final prefs=Get.find<GetPrefs>();  
   late final QuoteApiRepository quoteRepository;
   List<Color?> colorList=[
      Colors.amber,
    Colors.cyan,
    Colors.green,
    Colors.limeAccent
   ];

   void saveDateToDb({required Quote quote})async{
    try {
       
       final isSavedAuthor=
                 await prefs.saveData(key: 'author', data: quote.author!);
                 final isSavedQuote=await prefs.saveData(key: 'quote', data:quote.quote!);

                 if (isSavedAuthor!&&isSavedQuote!) {
                   Get.toNamed(AppNames.quoteDetail,arguments: {'id':quote.id});
                 }
    } catch (e) {
      log(e.toString());
    }
   }

   @override
  void onInit() {
    quoteRepository=QuoteApiRepository(quoteApi: QuoteApi());
    super.onInit();
  }

   
}