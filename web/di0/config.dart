library config;

import 'package:di/di.dart';
import 'package:di/annotations.dart';

import 'lib.dart' as lib;

void main() {
  
  lib.init();
  
  Dependencies.add(new Module()
                          ..bind(B));
  
  Dependencies.init();
  
  

}


class Dependencies {
  
  static List<Module> modules = [];
  static ModuleInjector injector;
  
  static add(Module m) {
    print('add $m');
    modules.add(m);
  }
  
  static init() {
    injector= new ModuleInjector(modules);
  }
  
  get(Type t) {
    return injector.get(t);
  }
}



@Injectable()
class B {
  
  B();
}