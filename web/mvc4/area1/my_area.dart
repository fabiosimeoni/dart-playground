part of area1;


@CustomTag(MyArea.name) 
abstract class MyArea extends Polybase<Area> {
 
  static const name = "my-area";
  
  MyArea.created() : super.created();
  
  attached() {
    model.activate();
  }
  
  
}


@Injectable()
class Area {
  
    EventBus bus;
    
    Area(this.bus);
    
    activate() {
      
      bus.fire(const Activation());
        
      
    }
     
}
