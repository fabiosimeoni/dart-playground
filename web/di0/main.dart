import 'package:di/di.dart';
import 'package:di/annotations.dart';

void main() {
  
  Module sample = new Module()..bind(Dep);
  
  Dependencies.init([sample]);
  
  assert(new Client().dep!=null);
  
}


class Dependencies {
  
  static ModuleInjector injector;
  
  static init(List<Module> mods) {
    injector= new ModuleInjector(mods);
  }
  
  _dep(Type type, [Type annotation]) {
    
     if (injector==null)
         throw new StateError("injector is not initialised");
     
     return injector.get(type,annotation);
  }
}

class Client extends Object with Dependencies {
  
  Dep dep;
  
  Client() {
    
    this.dep = _dep(Dep);
  }
}


@Injectable()
class Dep {}