library area1;

import 'package:event_bus/event_bus.dart';

import 'package:di/di.dart';
import 'package:di/annotations.dart';

import 'package:polymer/polymer.dart';

import 'package:logging/logging.dart';

import 'common.dart';

part 'area1/my_service.dart';
part 'area1/my_area.dart';
part 'area1/my_poly.dart'; 

init() {
  
  var module = new Module()..bind(MyService, toImplementation: MySpecificService)
                                    ..bind(Area)
                                    ..bind(MyModelBridge)
                                    ..bind(MyModel, toInstanceOf: MyModelBridge);

  
  Dependencies.add(module);
}

main() {}
