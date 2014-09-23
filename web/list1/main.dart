import 'package:polymer/polymer.dart';
import 'dart:async';

void main() {

  initPolymer();
  
}


@CustomTag(MyPolyItem.name) 
class MyPolyItem extends PolymerElement {
 
  static const name = "my-poly-item";
 
  MyPolyItem.created() : super.created();
  
  @published
  Object item;
  
}

@CustomTag(MyPoly.name) 
class MyPoly extends PolymerElement {
 
  static const name = "my-poly";
  
  @observable
  List<MyListItem> data = toObservable([new MyListItem("hello"),new MyListItem("world"), new MyListItem("you")]);
  
  
  MyPoly.created() : super.created();
  
  
  attached() {
    
    
    Timer timer = new Timer(new Duration(milliseconds:4000), () => data.add(new MyListItem("extra")));
    
  }
  

}

class ListItem {
  
  bool selected;
  
  dynamic get self => this;
}

class MyListItem extends MyItem with ListItem {
  MyListItem(String val) : super(val);
}

class MyItem extends Observable {

    final String val;
    
    MyItem(this.val);
    
}