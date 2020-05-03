import 'dart:async';

class TickerController {
  int _ticker;

  final StreamController<int> _waterController = StreamController<int>();
  Stream<int> get streamWater => _waterController.stream;
  StreamSink<int> get sinkWater => _waterController.sink;

  final StreamController<int> _firstDurationController =
      StreamController<int>();
  StreamSink<int> get streamFirstDuration => _firstDurationController.sink;

  final StreamController<int> _secondDurationController =
      StreamController<int>();
  StreamSink<int> get streamSecondDuration => _secondDurationController.sink;

  TickerController() {
    _ticker = 0;
    _waterController.add(_ticker);
    _firstDurationController.stream.listen(firstDuration);
    _secondDurationController.stream.listen(secondDuration);
  }

  void firstDuration(int time) {
    time++;
    sinkWater.add(time);
  }

  void secondDuration(int time) {
    if (time > 0) {
      time--;
    }
    sinkWater.add(time);
  }

  void dispose() {
    _waterController.close();
    _firstDurationController.close();
    _secondDurationController.close();
  }
}

/*
int _ticker;

  final StreamController<int> _tickerController = StreamController<int>();
  Stream<int> get tickerStream => _tickerController.stream;
  StreamSink<int> get tickerSink => _tickerController.sink;

  final StreamController<int> _incrementController = StreamController<int>();
  StreamSink<int> get increment => _incrementController.sink;

  final StreamController<int> _decrementController = StreamController<int>();
  StreamSink<int> get decrement => _decrementController.sink;

  final StreamController<int> _restoreController = StreamController<int>();
  StreamSink<int> get restore => _restoreController.sink;

  TickerController() {
    _ticker = 0;
    _tickerController.add(_ticker);
    _incrementController.stream.listen(_incrementTicker);
    _decrementController.stream.listen(_decrementTicker);
    _restoreController.stream.listen(_restore);
  }

  void _incrementTicker(int ticker) {
    ticker++;
    tickerSink.add(ticker);
  }

  void _decrementTicker(int ticker) {
    ticker--;
    tickerSink.add(ticker);
  }

  void _restore(int ticker) {
    ticker = 0;
    tickerSink.add(ticker);
  }

  void dispose() {
    _tickerController.close();
    _incrementController.close();
    _decrementController.close();
    _restoreController.close();
  }
}
*/
