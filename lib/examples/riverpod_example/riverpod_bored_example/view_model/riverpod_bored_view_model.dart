import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sh_flutter_code/examples/riverpod_example/riverpod_bored_example/model/activity_model.dart';

import '../../../../framework/utility/http/http_wrapper.dart';

final activityFutureProvider = FutureProvider.autoDispose((_) async {

  final Map<String, dynamic> data = await HttpWrapper.get("http://www.boredapi.com/api/activity/");
  return activityModelParser(data);
});

// 基于流
final activityStreamProvider = StreamProvider.autoDispose((_) async* {

  final Map<String, dynamic> data = await HttpWrapper.get("http://www.boredapi.com/api/activity/");
  yield activityModelParser(data);
});