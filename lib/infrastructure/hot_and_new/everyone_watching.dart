import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/core/api_end_point.dart';
import 'package:netflix/domain/hot_and_new_response/model/hot_and_new_everyone_watching.dart';

ValueNotifier<List<HotAndNewEveryOnewatching>> resultEveryWatching =
    ValueNotifier([]);

getHotAndSNewEveryWatching() async {
  try {
    Response response =
        await Dio(BaseOptions()).get(ApiEndPoints.everyoneseenmovie);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.data;
      for (var index = 0; index < json["results"].length; index++) {
        resultEveryWatching.value.add(
          HotAndNewEveryOnewatching.fromJson(json, index),
        );
      }
    }
  } catch (e) {
    log(e.toString());
  }
}
