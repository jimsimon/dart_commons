library run_all_tests;

import 'package:unittest/compact_vm_config.dart';
import "package:unittest/unittest.dart";
import "dart:mirrors";

import "src/io/autocloseable_test.dart" as autocloseable_test;
import "src/language/objects_test.dart" as objects_test;
import "preconditions_test.dart" as preconditions_test;
import "src/language/strings_test.dart" as strings_test;

main() {
  useCompactVMConfiguration();
  
  //Use reflection to run all tests in any library ending with "_test"
  MirrorSystem ms = currentMirrorSystem();
  ms.libraries.forEach((Symbol libName, LibraryMirror lm) {
    if (MirrorSystem.getName(libName).endsWith("_test")) {
      group("$libName:", () {
        lm.invokeAsync(const Symbol("main"), []);
      });
    }
  });
}