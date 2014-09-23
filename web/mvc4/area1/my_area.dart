part of area1;


@CustomTag(MyArea.name) 
abstract class MyArea extends Polybase<Object> {
 
  static const name = "my-area";
  
  EventBus bus;
  
  MyArea.created() : super.created() {
    
    bus = instanceOf(EventBus);
    bus.fire(this);
    
  }
  
  
}
