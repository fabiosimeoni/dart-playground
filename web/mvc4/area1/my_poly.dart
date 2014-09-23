part of area1;

Module myPolyModule = new Module()
                    ..bind(MyModelBridge)
                    ..bind(MyModel, toInstanceOf: MyModelBridge);




@CustomTag(MyPoly.name) 
abstract class MyPoly extends Polybase<MyModel> {
 
  static const name = "my-poly";
 
  MyPoly.created() : super.created() {
  
    EventBus bus = instanceOf(EventBus);
    
    bus.on(Attached).listen((_) {
      
      model.load();
      
    });
    
  }
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
   
  MyModelBridge(this.service) {
    msg = "other";
  }
  
  load() {
    service.dothings();
  }
  
  change() {
     super.change();
     service.dothings();
  }
  
}

