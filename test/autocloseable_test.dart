library autocloseable_test;

import "package:dart_commons/language.dart";
import "package:unittest/unittest.dart";

main() {
  autoClose(new CloseableTestObject(), (CloseableTestObject cto){
    print("executing");
    cto.testError();
  });
}

class CloseableTestObject implements AutoCloseable {
  CloseableTestObject() {}
  
  void testError() {
    throw new ArgumentError("test");
  }
  
  void close() {
    print("closed");
  }
}