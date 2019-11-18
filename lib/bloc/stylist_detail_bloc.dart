import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:stem_jobs/api_helper.dart';
import 'package:stem_jobs/bloc/base_bloc.dart';
import 'package:stem_jobs/data.model/stylist_detail_model.dart';
import 'package:stem_jobs/data.network/api_endpoint.dart';
import 'package:stem_jobs/network_utils.dart';

class StylistDetailBloc implements BaseBloc {
  final BehaviorSubject<StylistDetailModel> stylistDetail = new BehaviorSubject();

  void initData(String id) async {
    try {
      var response = await apiHelper.getWithAuth(endpoint: ApiEndpoint.expertsDetail + id);
      if (NetworkUtils.isReqSuccess(tag: ApiEndpoint.expertsDetail, response: response)) {
        StylistDetailModel model = StylistDetailModel.fromJson(json.decode(response.body));
        stylistDetail.sink.add(model);
      } else {
        print("Some error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    stylistDetail.close();
  }
}
