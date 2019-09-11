import 'package:equatable/equatable.dart';

abstract class HelloInitialState extends Equatable {}

class AppStarted extends HelloInitialState {
  @override
  String toString() => 'AppStarted';
}

class AppLoaded extends HelloInitialState {
  @override
  String toString() => 'AppLoaded';
}

void test() {
  AppStarted();
  AppLoaded();
}

void main() {
  test();
  print(HelloInitialState);
}
