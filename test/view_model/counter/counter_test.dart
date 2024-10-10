


import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_practice/view_model/counter/counter.dart';

void main() {

  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  /// given when then

  group("Counter class -", () {

    test(
        "given counter class when it is instantiated then value of count should be zero",
            () {

          /// Arragne
          // final Counter counter = Counter();

          /// Act
          final val = counter.count;

          /// Assert
          expect(val, 0);

        }
    );

    /// increment test
    test(
        "given couner class when it is incremented then the value of count should be 1",
            () {
          /// Arrange
          // final Counter counter = Counter();

          /// Act
          counter.incrementCounter();
          final val = counter.count;

          /// Assert
          expect(val, 1);
        }
    );

    /// decrement test
    test(
        "give a counter when it is decremented then the value of count should be -1",
            (){
              /// Arrange
              // final Counter counter = Counter();
              
              /// Act
              counter.decrementCounter();
              final val = counter.count;

              /// Assert
              expect(val, -1);
            });

    /// reset test
    test(
        "give a counter class when it is reset than the value of count should be 0",
            () {
              /// Arrange
              // final Counter counter = Counter();

              /// Act
              counter.reset();
              final val = counter.count;

              /// Assert
              expect(val, 0);
            }
    );



  });



}