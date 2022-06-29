import 'package:flutter_project/future_provider/data.dart';

Future<Data> loadDataFuture() async {
  await Future.delayed(const Duration(seconds: 3));
  return Data(data: 'New Data From ::: Server by::: Future Provider...');
}
