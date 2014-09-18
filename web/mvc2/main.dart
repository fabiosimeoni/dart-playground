import 'package:polymer/polymer.dart';
import 'package:di/di.dart';
import 'package:di/annotations.dart';
import 'dart:mirrors';
//import 'dart:html';
//import 'dart:async';

ModuleInjector injector;

void main() {
  
  injector = new ModuleInjector([myServiceModule,myModule]);
  
  ControllerFactory.init(injector);
  
   initPolymer();
  
  //Timer timer = new Timer(new Duration(milliseconds:2000), () => model.msg="changed" );
  
  
}

// view ----> viewmodel <----- controller ------> app

Module myServiceModule = new Module()..bind(MyService, toImplementation: MySpecificService);

Module myModule = new Module()
                    ..bind(MyOtherController)
                    ..bind(MyModel);
                      


class ControllerFactory {
  
  static ModuleInjector injector;
  static Map<String,Type> typemap = {};
  
  static init(ModuleInjector i) {
    
    injector = i;
    
    ClassMirror controller = reflectClass(Controller);
    
    injector.types.forEach((type) {
      
      if (reflectClass(type).isSubclassOf(controller))
        typemap["pippo"]= type;
      
    });
  }
  
  static Controller resolve(String key) {
    
      return injector.get(typemap[key]);
  }
  
  
}

abstract class Controller<M> {

  M model;
  
  Controller(this.model);

}

abstract class MyService {}



@Injectable()
class MyModel extends Object with Observable {
  
  @observable String msg = "default";
  
  //abstract view of presentation: fields, methods, etc...
}

@Injectable()
class MySpecificService extends MyService {}

@Injectable()
class MyOtherController extends Controller<MyModel> { //testable
  
  MyService service;
  
  MyOtherController(MyModel model, this.service) : super(model) {
    model.msg = "other";
  }
  
}

abstract class Polybase<M extends Observable> extends PolymerElement {
  
  Controller<M> controller;
  @observable var model;
  
  Polybase.created() : super.created() {
   this.controller=newController();
   this.model = controller.model;
  }
  
  Controller<M> newController();
  
}


@CustomTag(MyPoly.name) 
abstract class MyPoly extends Polybase<MyModel> {
 
  static const name = "my-poly";
 
  MyPoly.created() : super.created();
  

}

@CustomTag(MyOnePoly.name)
class MyOnePoly extends MyPoly  {
  
  static const name = "my-one-poly";
    
  MyOnePoly.created() : super.created();
  
  Controller newController() => injector.get(MyOtherController);
  

}
