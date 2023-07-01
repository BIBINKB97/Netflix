import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/hot_and_new_response/model/hot_and_new_comingsoon.dart';

ValueNotifier<List<HotAndNewComingSoon>> resultComingSoon = ValueNotifier([]);

getHotandNewComingSoon() async {
  try {
    Response response =
        await Dio(BaseOptions()).get(ApiEndPoints.upcomingmovie);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.data;
      for (var index = 0; index < json["results"].length; index++) {
        resultComingSoon.value.add(HotAndNewComingSoon.fromJson(json, index));
      }
    }
  } catch (e) {
    log(e.toString());
  }
}
