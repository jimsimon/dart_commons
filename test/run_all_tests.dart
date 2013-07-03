library tests;

import 'package:unittest/compact_vm_config.dart';
import "package:unittest/unittest.dart";
import "package:darter/darter.dart";
import "package:dart_commons/dart_commons.dart";

part "src/io/autocloseable_test.dart";
part "src/language/objects_test.dart";
part "src/language/strings_test.dart";
part "src/preconditions_test.dart";

main() {  
  new Darter();
}