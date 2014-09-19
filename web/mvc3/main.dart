import 'package:polymer/polymer.dart';
import 'package:di/di.dart';
import 'package:di/annotations.dart';
import 'dart:mirrors';
import 'package:event_bus/event_bus.dart';

ModuleInjector injector;

void main() {
  
  
  injector = new ModuleInjector([appModule,myServiceModule,myModule]);

  MyModelContext ctx = injector.get(MyModelContext);
  
  ControllerFactory.init(injector);
  
  initPolymer();
  

}

// view ----> viewmodel <----- controller ------> app
Module appModule = new Module()..bind(EventBus, toValue: new EventBus());


Module myServiceModule = new Module()..bind(MyService, toImplementation: MySpecificService);

Module myModule = new Module()
                    ..bind(MyModelContext)
                    ..bind(MyModel);




//////////////////////// 'app'

abstract class MyService {
  
  dothings(){
    print("doing things with ${toString()}");
  }
}



@Injectable()
class MySpecificService extends MyService {}



//////////////////////// 'framework'


abstract class Model {
  
  
}

class ControllerFactory {
  
  static ModuleInjector injector;
  static Map<String,Type> typemap = {};
  
  static init(ModuleInjector i) {
    
    injector = i;
    
    ClassMirror model = reflectClass(Model);
    
    injector.types.forEach((type) {
      
      if (reflectClass(type).isSubclassOf(model))
        typemap[type.toString()]= type;
      
    });
  }
  
  static Model resolve(String key) {
    
      if (!typemap.containsKey(key))
        throw new ArgumentError("unknown controller $key");
    
      return injector.get(typemap[key]);
  }
  
  
}

abstract class Polybase<M> extends PolymerElement {
  
  static final String model_attr = 'model';
  
  @observable var model;
  
  Polybase.created() : super.created() {
    
    String modelname = attributes[model_attr];
    
    if (modelname==null)
      throw new ArgumentError("missing '$model_attr' attribute on $nodeName");
    
    this.model = ControllerFactory.resolve(modelname);
  }
  
  newModel();
  
}


//////////////////////// component

@CustomTag(MyPoly.name) 
abstract class MyPoly extends Polybase<MyModel> {
 
  static const name = "my-poly";
 
  MyPoly.created() : super.created();
}

@Injectable()
class MyModel extends Model with Observable {//test subject
  
 EventBus bus;
  
 MyModel(this.bus);
 
 @observable 
 String msg = "default";
  
  change() {
    print("acting on data");
    bus.fire(new MyModelEvent());
  }
  
}

class MyModelEvent {
  
  
  process(MyModelContext ctx) {
    ctx.service.dothings();
  }
  
}


typedef void MyEvent(MyModelContext t);

@Injectable()
class MyModelContext {
  
  MyService service;
  
  MyModelContext(EventBus bus, this.service) {
    bus.on(MyModelEvent).listen((MyModelEvent e) {e.process(this);});
  }
}
