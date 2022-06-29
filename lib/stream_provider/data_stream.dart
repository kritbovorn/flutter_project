import 'package:flutter_project/stream_provider/data.dart';

Stream<ModelStream> loadedStream() {
  return Stream<ModelStream>.periodic(
    const Duration(seconds: 1),
    (computationCount) => ModelStream(number: computationCount),
  ).take(10);
}
