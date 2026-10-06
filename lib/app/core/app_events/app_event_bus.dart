import 'dart:async';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppEventBus {
  final _controller = StreamController<AppEvent>.broadcast();

  Stream<AppEvent> get stream => _controller.stream;

  void fire(AppEvent event) {
    _controller.add(event);
  }

  Stream<T> on<T extends AppEvent>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  void dispose() => _controller.close();
}