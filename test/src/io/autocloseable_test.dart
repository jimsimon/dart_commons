import "package:unittest/unittest.dart";
import "package:dart_commons/dart_commons.dart";

main() {
  group("autoClose()", () {
    test("throws error when error handler isn't specified and error occurs", () {
      expect(() => autoClose(new _CloseableTestObject(), (_CloseableTestObject cto){
        cto.testError();
      }), throwsArgumentError);
    });
    
    test("returns result of error handler when an error occurs and an error handler is specified", () {
      expect(autoClose(new _CloseableTestObject(), (_CloseableTestObject cto){
        cto.testError();
      }, (e){ return 9001; }), 9001);
    });
    
    test("returns result of executed functions when no error occurs", () {
      expect(autoClose(new _CloseableTestObject(), (_CloseableTestObject cto){
        return cto.testNormal();
      }), 9001);
    });
  });
}

class _CloseableTestObject implements AutoCloseable {
  _CloseableTestObject() {}
  
  void testError() {
    throw new ArgumentError("test");
  }
  
  int testNormal() {
    return 9001;
  }
  
  void close() {}
}