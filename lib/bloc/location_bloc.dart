import 'package:rxdart/rxdart.dart';
import 'package:stem_jobs/api_helper.dart';
import 'package:stem_jobs/bloc/base_bloc.dart';

class LocationBloc extends BaseBloc {
  final ApiHelper apiHelper;
  BehaviorSubject _dataController;

  LocationBloc(this.apiHelper) {
    _dataController = new BehaviorSubject();
    initData();
  }

  @override
  void dispose() {
    _dataController.close();
  }

  void initData() {
    apiHelper.getLocationData();
  }
}
