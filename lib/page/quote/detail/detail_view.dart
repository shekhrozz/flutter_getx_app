
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/page/quote/detail/detail_controller.dart';
import 'package:get/get.dart';


  
class DetailView extends GetWidget<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:controller.backToQuote,
           icon:const Icon(Icons.arrow_forward)),
           actions: [
            GetBuilder(
              init: controller,
              builder:(_) {
                return TextButton(
                  onPressed:(){},
                   child:Text(controller.id.toString(),
                   style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.red
                   ),));
              
            },)
           ],

           title: GetBuilder(
            init: controller,
            builder:(_) {
              return FutureBuilder(
                initialData: "",
                future: controller.prefs.loadDataFromStorage(key: "author"),
                builder:(context, snapshot) {
                  if (snapshot.connectionState==ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }
                  if (!snapshot.hasData||snapshot.hasError) {
                    return const Text('Your app has an error');
                  }
                  return Text(snapshot.data??'author');
                },);
              
            },),
      ),

      body: SafeArea(
        child:Column(
          children: [
            const Text('Get Storage'),
            GetBuilder(
              init: controller,
              builder:(_) {
                return FutureBuilder<String?>(builder:(context, snapshot) {
                  if (snapshot.connectionState==ConnectionState.waiting) {
                    
                    return const CupertinoActivityIndicator();
                  }
                  if (snapshot.hasData||snapshot.hasError) {
                    return const Text('Your app has an error');
  
                  }
                  return Text(snapshot.data??'quottttttttttte');
                },
                );
                
              },),
              Text('Quote Repository'),
              GetBuilder(
                init: controller,
                builder:(controller) {
              return FutureBuilder<Quote?>
              (
                initialData: Quote.fromJson({}),
                future: controller.apiRepository
                          .getSingleQuote(id: controller.id),
                builder:(context, snapshot) {
                  if (snapshot.connectionState==ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }
                  if (!snapshot.hasData||snapshot.hasError) {
                    return const Text('Your app has an error');
                  }
                  return Text(snapshot.data!.quote??"quote");
                },
                );
                },
                )

          ],
        )),
    );
  }
}