library objects_test;

import 'package:dart_commons/language.dart';
import 'package:unittest/unittest.dart';
import "dart:mirrors";

main() {  
  
  var someValue = null.toString();
  
  group("firstNonNull()", () {
    test("returns first argument when first is not null and second is null", () {
      expect(Objects.firstNonNull("first", null), "first");
    });
    
    test("returns first argument when first is not null and second is not null", () {
      expect(Objects.firstNonNull("first", "second"), "first");
    });

    test("returns second argument when first is null and second is not null", () {
      expect(Objects.firstNonNull(null, "second"), "second");
    });
    
    test("throws error when both arguments are null", () {
      expect(() => Objects.firstNonNull(null, null), throwsArgumentError);
    });
  });
  
  group("nullSafeInvoke()", () {
    test("returns null if initial variable is null", () {
      var list = null;
      expect(Objects.nullSafeInvoke(() => list.reversed.isEmpty), isNull);
    });
    
    test("returns null if chained call results in a null part way through", () {
      var simpleTest = new _SimpleTestClass();
      expect(Objects.nullSafeInvoke(() => simpleTest.nested.nested), isNull);
    });
  });
}

class _SimpleTestClass {
  _SimpleTestClass nested = null;
}