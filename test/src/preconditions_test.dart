part of tests;

@dart
preconditions() {
  
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
      String customMessage = "Must be over 9000!";
      expect(() => checkThat(9000, greaterThan(9000), customMessage),
          throwsA(predicate((PreconditionError e) => e.message == customMessage)));
    });
  });
}