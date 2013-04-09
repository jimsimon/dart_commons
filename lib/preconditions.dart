library preconditions;

import "package:unittest/matcher.dart";

/**
 * Checks a [value] against a [Matcher] and throws a [PreconditionError] value is not valid.  
 * 
 * The default message in the [PreconditionError] details the nature of the validation failure,
 * but can be optionally overridden with an custom [message] if desired.
 */
checkThat(value, Matcher matcher, [String message]) {
  var matchState = new MatchState();
  if (!matcher.matches(value, matchState)) {
    
    String failureMsg = message;
    if (failureMsg == null) {
      failureMsg = _getDefaultMessageForMismatch(value, matcher, matchState);
    }
    throw new PreconditionError(failureMsg);
  }
  return value;
}

String _getDefaultMessageForMismatch(value, Matcher matcher, MatchState matchState) {
  var description = new StringDescription();
  description.add('Precondition Failed!\nExpected: ').addDescriptionOf(matcher).
  add('\n     but: ');
  matcher.describeMismatch(value, description, matchState, false);
  description.add('.\n');
  return description.toString();
}

class PreconditionError implements Error {
  final String _message;
  PreconditionError(this._message);
  String toString() => _message;
}