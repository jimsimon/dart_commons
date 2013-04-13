library run_all_tests;

import 'dart:io';
import 'package:unittest/compact_vm_config.dart';
import 'package:unittest/unittest.dart';
import "dart:mirrors";

import "src/language/autocloseable_test.dart" as autocloseable_test;
import "src/language/objects_test.dart" as objects_test;
import "preconditions_test.dart" as preconditions_test;
import "src/language/strings_test.dart" as strings_test;

main() {
  var args = new Options().arguments;
  var pattern = new RegExp(args.length > 0 ? args[0] : '.');
  useCompactVMConfiguration();
  
  //Use reflection to run all tests in any library ending with "_test"
  MirrorSystem ms = currentMirrorSystem();
  ms.libraries.forEach((String libName, LibraryMirror lm) {
    if (libName.endsWith("_test")) {
      lm.invoke("main", []);
    }
  });
}