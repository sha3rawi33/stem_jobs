import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:stem_jobs/api_helper.dart';
import 'package:stem_jobs/bloc/base_bloc.dart';
import 'package:stem_jobs/data.network/api_endpoint.dart';
import 'package:stem_jobs/feed_model.dart';

class FeedBloc extends BaseBloc {
  BehaviorSubject<List<FeedItem>> feedController;

  FeedBloc() {
    feedController = new BehaviorSubject();
    initData();
  }

  void initData() async {
    NetworkResponse _networkResponse = await apiHelper.getWithAuth1(endpoint: ApiEndpoint.feeds);
    if (_networkResponse.isSuccess) {
      FeedModel feedModel = FeedModel.fromJson(json.decode(_networkResponse.response.body));
      feedController.add(feedModel.feedList);
    } else {
      print("Some error");
    }
  }

  @override
  void dispose() {
    feedController.close();
  }
}
