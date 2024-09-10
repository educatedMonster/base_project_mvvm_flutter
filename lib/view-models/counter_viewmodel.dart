import 'package:flutter/material.dart';

import '../repos/response.dart';
import '../services/counter_services.dart';

class CounterViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  String _dummyData = '';

  String get dummyData => _dummyData;

  void setIncrementCounter() async {
    _count++;
    notifyListeners();
  }

  Future<void> onGetDummyData() async {
    var res = await CounterServices.onGetDummyData();

    if (res is Success) {
      var model = res.response as String;
      debugPrint('onGetDummyData: SUCCESS - ${model}');

      _dummyData = model;
      notifyListeners();
    }

    if (res is Failure) {
      debugPrint('onGetDummyData: FAILURE - ${res.response}');
    }
  }
}
