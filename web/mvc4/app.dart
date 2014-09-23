library app;


import 'package:event_bus/event_bus.dart';

import 'package:di/di.dart';
import 'package:di/annotations.dart';

import 'package:polymer/polymer.dart';

import 'package:logging/logging.dart';

import 'common.dart';
import 'area1.dart' as area1;

part 'app/my_app.dart';



final Logger _log = new Logger('app');



init() {
  
   Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    _log.info("init app");
    
    area1.init();

    Module module = new Module()
                        ..bind(App)
                        ..bind(EventBus, toValue: new EventBus());

    
    Dependencies.add(module);
      
    Dependencies.init(); 
    
    initPolymer();

  
}

main() {}
