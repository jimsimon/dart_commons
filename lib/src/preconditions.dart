part of dart_commons;

checkNotNull(value, [String message]) {
  if (value == null) {
    if (message != null) {
      throw new ArgumentError(message);
    }
    throw new ArgumentError();
  }
  return value;
}

void checkArgument(bool expression, [String message]) {
  checkNotNull(expression, "Expression cannot be null");
  if (!expression) {
    if (message != null) {
      throw new ArgumentError(message);
    }
    throw new ArgumentError();
  }
}