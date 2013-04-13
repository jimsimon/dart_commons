part of language;

typedef dynamic AutoCloseableAction(AutoCloseable autoCloseable);
typedef dynamic AutoCloseableOnError(e);

/**
 * Implementing this class allows the implementor to be used with the [autoClose] method.  [AutoCloseable] objects
 * must not have any side-effects when close is called.
 */
abstract class AutoCloseable {
  
  void close();
  
}

/**
 * Takes an object that implements [AutoCloseable], executes the given [action] against it, and returns the return value
 * of the [action].  This method guarrantees that [close] will be called on the [AutoCloseable] object, even if an error
 * occurs.  This method also optionally takes an [onError] handler that, if present, will be called when an error occurs.
 * If an error occurs and the [onError] handler is no specified, then the error will bubble up as normal.
 * 
 * See: Java's AutoCloseable interface
 * See: C#'s IDisposable interface
 */
dynamic autoClose(AutoCloseable autoCloseable, AutoCloseableAction action, [AutoCloseableOnError onError]) {
  checkThat(autoCloseable, isNotNull);
  
  //TODO Simplify this once Dart Issue 430 is resolved
  if (onError != null) {
    try {
      return action(autoCloseable);
    } catch(e) {
      return onError(e);
    } finally {
      autoCloseable.close();
    }
  } else {
    try {
      return action(autoCloseable);
    } finally {
      autoCloseable.close();
    }
  }
}