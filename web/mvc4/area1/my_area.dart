part of area1;


@CustomTag(MyArea.name) 
abstract class MyArea extends Polybase<Object> with Area {
 
  static const name = "my-area";
  
  EventBus bus;
  
  MyArea.created() : super.created() {
    
    bus = instanceOf(EventBus);
    
  }
  
  @override
  attached() {
    
    bus.fire(const Attached());
        
  }
  
  
}
