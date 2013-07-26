part of tests;

@dart
preconditions() {
  
  group("checkThat()", () {
    test("throws an error on an invalid condition", () {
      expect(() => checkThat(3, lessThan(2)), throwsA(new isInstanceOf<PreconditionError>()));
    });
    
    test("executes normally on a valid condition", () {
      expect(() => checkThat(3, greaterThan(2)), returnsNormally);
    });
    
    test("returns the checked value on a valid condition", (){
      expect(checkThat("a string", new isInstanceOf<String>()), "a string");
    });
    
    //TODO Find a better way to test custom error messages  
    test("throws an error with a specific custom message", () {
      String customMessage = "Must be over 9000!";
      expect(() => checkThat(9000, greaterThan(9000), customMessage),
          throwsA(predicate((PreconditionError e) => e.message == customMessage)));
    });
  });
}