import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:stem_jobs/api_helper.dart';
import 'package:stem_jobs/bloc/base_bloc.dart';
import 'package:stem_jobs/data.model/inspiraton_model.dart';
import 'package:stem_jobs/data.network/api_endpoint.dart';
import 'package:stem_jobs/network_utils.dart';

class InspirationBloc extends BaseBloc {
  final BehaviorSubject<List<InspirationItem>> list = new BehaviorSubject();

  void initData() async {
    try {
      var response = await apiHelper.getWithAuth(endpoint: ApiEndpoint.inspiration);
      if (NetworkUtils.isReqSuccess(tag: ApiEndpoint.inspiration, response: response)) {
        var model = InspirationModel.fromJson(json.decode(response.body));
        list.add(model.list);
      } else {
        print("Some error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    print("abc");
  }
}
