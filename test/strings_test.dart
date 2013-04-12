library strings_test;

import "package:dart_commons/language.dart";
import "package:unittest/unittest.dart";

main() {
  group("isNullOrEmpty()", () {
    test("returns true for null", () {
      expect(Strings.isNullOrEmpty(null), true);
    });
    
    test("returns true for empty string", () {
      expect(Strings.isNullOrEmpty(""), true);
    });
    
    test("returns false for non-empty string", () {
      expect(Strings.isNullOrEmpty("not empty"), false);
    });
  });
}