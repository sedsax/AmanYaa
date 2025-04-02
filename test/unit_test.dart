import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Logic Tests', () {
    test('Initial counter value should be 0', () {
      int counter = 0;

      // Assert that the initial value is 0.
      expect(counter, 0);
    });

    test('Counter should increment by 1', () {
      int counter = 0;

      // Increment the counter.
      counter++;

      // Assert that the counter is now 1.
      expect(counter, 1);
    });

    test('Counter should decrement by 1', () {
      int counter = 1;

      // Decrement the counter.
      counter--;

      // Assert that the counter is now 0.
      expect(counter, 0);
    });
  });
}