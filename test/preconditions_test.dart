library preconditions_test;

import "package:dart_commons/preconditions.dart";
import "package:unittest/unittest.dart";

main() {
  
  group("checkThat()", () {
    test("throws error on invalid condition", () {
      expect(() => checkThat(3, lessThan(2)), throwsA(new isInstanceOf<PreconditionError>()));
    });
    
    test("executes normally on valid condition", () {
      expect(() => checkThat(3, greaterThan(2)), returnsNormally);
    });
    
    test("returns checked value on valid condition", (){
      expect(checkThat("a string", new isInstanceOf<String>()), "a string");
    });
    
    //TODO Find a better way to test custom error messages  
    test("throws error with custom message", () {
      try {
        checkThat(9000, greaterThan(9000), "Must be over 9000!");
      } on PreconditionError catch(e) {
        expect(e.toString(), equals("Must be over 9000!"));
      } catch(e) {
        fail("Expected a PreconditionError but got ${e.runtimeType}");
      }
    });
  });
}