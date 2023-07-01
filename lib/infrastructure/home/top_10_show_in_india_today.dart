import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/home/models/home_main_model.dart';



ValueNotifier<List<ScrollImageHome>> top10showindia = ValueNotifier([]);
getHomeTop10showindia() async {
  try {
    Response response =
        await Dio(BaseOptions()).get(ApiEndPoints.top10showindia);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("200 from release in past");
      var json = response.data;
      log(json["results"].length.toString());

      for (var index = 0; index < json["results"].length; index++) {
        top10showindia.value.add(ScrollImageHome.fromJson(json, index));
        top10showindia.notifyListeners();
      }
    }
  } catch (e) {
    log("exception from release in past");
    log(e.toString());
  }
}
