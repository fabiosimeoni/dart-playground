part of area1;

Module myPolyModule = new Module()
                    ..bind(MyModelBridge)
                    ..bind(MyModel, toInstanceOf: MyModelBridge);




@CustomTag(MyPoly.name) 
abstract class MyPoly extends Polybase<MyModel> {
 
  static const name = "my-poly";
 
  MyPoly.created() : super.created();
    
}



class MyModel extends Model with Observable {//test subject

 final Logger _log  = new Logger('my-model');
  
 @observable 
 String msg = "default";
  
  change() {
    msg = '$msg, changed';
  }
  
}

@Injectable()
class MyModelBridge extends MyModel {
  
  MyService service;
   
  MyModelBridge(this.service, EventBus bus) {
    msg = "other";
    bus.on(Activation).listen((Activation activation) {
      if (activation.firstTime)
        load();
     }
    );
  }
  
  
  load() {
    
    service.loadingthings();
  
  }
  
  
  change() {
     super.change();
     service.dothings();
  }
  
}

