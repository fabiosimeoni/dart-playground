part of area1;


@CustomTag(MyArea.name) 
abstract class MyArea extends Polybase<Area1> {
 
  static const name = "my-area";
  
  MyArea.created() : super.created();
  
  attached() {
    model.activate();
  }
  
  
}


@Injectable()
class Area1 extends Area {
  
    EventBus bus;
    
    bool firstActivation = true;

    Area1(this.bus);
    
    activate() {
      
      if (firstActivation==true) {
        
        bus.fire(const Activation.first());
        
        firstActivation=false;
      
      }
      else
        bus.fire(const Activation());
        
      
    }
     
}
