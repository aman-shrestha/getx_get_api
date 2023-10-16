import 'dart:convert';

import 'package:demo/models/opensea_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class OpenseaController extends GetxController{
  var isLoading = false.obs;
  var data=WeatherModel().obs;
  var isDataLoading=true.obs;




  Future<void> getData() async {
    var response = await http.get(
      Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m'),
    );
    print("Response:::"+response.body);
    if (response.statusCode == 200) {
      print("Got response");
       WeatherModel
          weatherModel =
          WeatherModel.fromJson(
              jsonDecode(response.body));
         data.value = WeatherModel(

          latitude: weatherModel.latitude,
          longitude: weatherModel.longitude,
          hourly: weatherModel.hourly
          
          );
      isDataLoading.value=false;
    } else {
      // Error response code
     print("Error fetching data");
    }
  }
}