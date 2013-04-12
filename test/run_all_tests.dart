library run_all_tests;

import 'dart:io' show Options;
import 'package:unittest/compact_vm_config.dart';
import 'package:unittest/unittest.dart';

import "autocloseable_test.dart" as autocloseable_test;
import "objects_test.dart" as objects_test;
import "preconditions_test.dart" as preconditions_test;
import "strings_test.dart" as strings_test;

main() {
  var args = new Options().arguments;
  var pattern = new RegExp(args.length > 0 ? args[0] : '.');
  useCompactVMConfiguration();

  void addGroup(testFile, testMain) {
    if (pattern.hasMatch(testFile)) {
      group(testFile.replaceAll('_test.dart', ':'), testMain);
    }
  }

  //addGroup('autocloseable_test.dart', autocloseable_test.main);
  addGroup('objects_test.dart', objects_test.main);
  addGroup('preconditions_test.dart', preconditions_test.main);
  addGroup('strings_test.dart', strings_test.main);
}