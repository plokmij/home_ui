import 'dart:async';
import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  final _currentIndex = BehaviorSubject<int>();

  Stream<int> get currentIndex => _currentIndex.stream;

  Function(int) get changeIndex => _currentIndex.sink.add;

  getCurrentIndex() {
    return _currentIndex.value;
  }

  dispose(){
    _currentIndex.close();
  }
}