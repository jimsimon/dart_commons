part of language;

class Objects {
  _Objects() {}
  
  /**
   * Returns the first non-null argument.  If both arguments are null, an [ArgumentError] is thrown.
   */
  static firstNonNull(first, second) {
    if (first != null) {
      return first;
    } else if (second != null) {
      return second;
    }
    
    throw new ArgumentError("Both arguments were null.");
  }
  
  /**
   * Invokes a function and returns null if the function would result in [NoSuchMethodError] due to a null value.
   * This function can be used to execute a function chain without needing to check for nulls.  For example:
   * 
   * var list = null;
   * nullSafeInvoke(() => list.reversed.isEmpty); //returns null
   * 
   * NOTE: This function does not guarrantee that a call will throw a NoSuchMethodError if a non-existent method 
   * is called on a null value.  Example:
   * 
   * var list = null;
   * nullSafeInvoke(() => list.fakeMethod());  //returns null and does not throw a [NoSuchMethodError]
   * 
   * The following example will throw a [NoSuchMethodError]:
   * var list = [];
   * nullSafeInvoke(() => list.fakeMethod());  //throws a [NoSuchMethodError] because the list is not null.
   */
  static nullSafeInvoke(Function f) {
    try {
      return f();
    } on NoSuchMethodError catch(e) {
      //Use reflection to attempt to preserve some legitimate NoSuchMethodError's -- not guarranteed
      reflect(e).getField("_receiver").then((InstanceMirror receiverMirror) {
        if (receiverMirror.hasReflectee && receiverMirror.reflectee != null) {  //Actually tried to call a non-existant method on a valid object
          throw e;
        }
      });
    }
    return null;
  }
}