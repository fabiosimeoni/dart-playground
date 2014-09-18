

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:math';


void main() {
  
  initPolymer();
  
  MyPoly poly = querySelector(MyPoly.name);
  ButtonElement btn = querySelector("button");
  LabelElement lbl = querySelector("label");

  //listens to internal change via "event API"
  poly.addEventListener(MyPoly.custom_event, 
      (e) { 
        lbl.text = "custom event notifies change: '${e.detail}'";
      }
  );      

  //effect change with custom API
  btn.onClick.listen(
      (_) { poly.change();}
  );
}

@CustomTag(MyPoly.name)
class MyPoly extends PolymerElement {
  
  static const name = "my-poly";
  static const custom_event = "my-poly-event";
    
  
  static final Random _generate = new Random();
  
  MyPoly.created() : super.created();

  // bound in template, hence monitored for change
  
  // ugly as it is, it's reccomended over plain field 
  // @observable String prop = "you";
  // to avoid timining issues with notifications. 
  // they're looking into ways to hide this boilerplate.
  
  @observable 
  String get prop => readValue(#prop,()=>"initial");
  set prop(String val) { writeValue(#prop,val); }
  
  //part of public API
  change() {

    prop = _generate.nextInt(1000).toString();
    
    //publih event to clients, here asynchronously
    //primitive payload (detail)
    asyncFire(MyPoly.custom_event, detail:prop);
    
  }
  
}
