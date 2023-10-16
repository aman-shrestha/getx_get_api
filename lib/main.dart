import 'package:demo/controller/opensea_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  final openseaController = Get.put(OpenseaController());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    openseaController.getData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: Obx(() => openseaController.isDataLoading.value
              ? CircularProgressIndicator()
              : Container(
                  child: Column(children: [
                    Text("Longitude:::" +
                        openseaController.data.value.longitude.toString()),
                    Expanded(
                        child: ListView.builder(
                            itemCount: openseaController
                                .data.value.hourly!.time!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(openseaController
                                  .data.value.hourly!.time![index]);
                            }))
                  ]),
                ))),
    );
  }
}
