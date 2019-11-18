import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:stem_jobs/api_helper.dart';
import 'package:stem_jobs/bloc/base_bloc.dart';
import 'package:stem_jobs/data.network/api_endpoint.dart';
import 'package:stem_jobs/feed_model.dart';
import 'package:stem_jobs/network_utils.dart';

class ProfileBloc extends BaseBloc {
  BehaviorSubject<List<FeedItem>> profileController;

  ProfileBloc() {
    profileController = new BehaviorSubject();
    initData();
  }

  void initData() async {
    try {
    /*  var response = await apiHelper.getWithAuth(endpoint: ApiEndpoint.feeds);
      if (NetworkUtils.isReqSuccess(tag: ApiEndpoint.feeds, response: response)) {
        print(response.body);

        FeedModel feedModel = FeedModel.fromJson(json.decode(response.body));
        profileController.add(feedModel.feedList);
      } else {
        print("Some error");
      }*/
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    profileController.close();
  }
}
