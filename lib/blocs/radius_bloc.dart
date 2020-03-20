import 'dart:async';

class RadiusBloc {
  final _radiusStreamController = StreamController<double>();

  get radiusStream => _radiusStreamController.stream;
  set setRadiusStream(value) => _radiusStreamController.add(value);

  dispose() {
    _radiusStreamController.close();
  }
}
