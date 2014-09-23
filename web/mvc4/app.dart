library app;


import 'package:event_bus/event_bus.dart';

import 'package:di/di.dart';
import 'package:di/annotations.dart';

import 'package:polymer/polymer.dart';

import 'package:logging/logging.dart';

import 'common.dart';
import 'area1.dart';

part 'app/my_app.dart';



final Logger _log = new Logger('app');

Module app_module = new Module()
                    ..bind(App)
                    ..bind(EventBus, toValue: new EventBus());


init() {
  
   Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    _log.info("init app");
      
    Dependencies.init([app_module,area1_module]); 
    
    initPolymer();

  
}

main() {}
