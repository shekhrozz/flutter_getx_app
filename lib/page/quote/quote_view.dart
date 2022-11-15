import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/page/quote/quote_controller.dart';
import 'package:get/get.dart';

class QuoteView extends GetView<QuoteController> {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        width: context.mediaQuerySize.width,
        child: GetBuilder(
          init: controller,
          builder:(_) {
            return FutureBuilder<List<Quote?>?>(
              initialData:List.empty(),
              future: controller.quoteRepository.getQuotes(),
              builder:(context, snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (!snapshot.hasData||snapshot.hasError) {
                  return const Text('You have not data or have an error'); 
                }
                debugPrint(snapshot.data.toString());

                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder:(context, index) {
                    final quote=snapshot.data![index];
                    final colorIndex=index%controller.colorList.length;
                    return ExpansionTile(
                      collapsedBackgroundColor:controller.colorList[colorIndex],
                      backgroundColor: controller.colorList[colorIndex],
                      title:Text(quote!.author??'author'),
                      children: [
                        ListTile(
                          onTap: (){
                            Get.snackbar(quote.author??'author', 
                            quote.quote??'quote',
                            barBlur: 20);
                           controller.saveDateToDb(quote: quote);
                          },
                          title: Text(quote.quote??'quote'),
                        )

                      ],
                       );
                  }, 
                  separatorBuilder:(context, index) => const SizedBox(
                    height: 10,
                  ), 
                  itemCount:snapshot.data!.length);
              },
              );
          },),
      ),
    );
  }
}