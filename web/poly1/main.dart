

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:collection/equality.dart';


Function equals = const ListEquality().equals;
List expectedStates = ['created','attached'];
List states = [];

void main() {

  initPolymer();
  
  assert(equals(states,expectedStates));
   
  //can see the light
  assert(querySelector(MyPoly.name)!=null);
   
  //not the shadow
  assert(querySelector("#shadow")==null);
  
  //default attributes
  assert(querySelector(MyPoly.name).attributes.containsKey('mydefault'));
    
}

@CustomTag('my-poly')
class MyPoly extends PolymerElement {
 
  static const name = "my-poly";
  
  MyPoly.created() : super.created() {
    
   states.add('created');
    
   //can see the light
   assert(querySelector(MyPoly.name)!=null);
    
    //can see the shadow
   //can see the light
   assert(this.$['shadow']!=null); //$ is "automatic node finding" (by id), dart's own porting
    
    //normally, we'd use attached. ordering is unclear. 
   
  }
  
  attached() {
    
    super.attached();
    
    states.add('attached');
  }
  
}
