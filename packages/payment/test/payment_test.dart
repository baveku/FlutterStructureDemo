import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment/payment.dart';

void main() {
  const MethodChannel channel = MethodChannel('payment');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Payment.platformVersion, '42');
  });
}
