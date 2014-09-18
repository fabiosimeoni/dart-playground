import 'package:polymer/polymer.dart';
//import 'dart:html';
//import 'dart:async';

void main() {

  initPolymer();
  
  //Timer timer = new Timer(new Duration(milliseconds:2000), () => model.msg="changed" );
  
  
}

// view ----> viewmodel <----- controller ------> app

abstract class Controller<M> {
  
  M model;
  
  Controller(this.model);

}

class MyOtherController extends Controller<MyModel> { //testable
  
  MyOtherController(MyModel model) : super(model) {
    model.msg = "other";
  }
  
}

abstract class Polybase<M extends Observable> extends PolymerElement {
  
  Controller<M> controller;
  @observable var model;
  
  Polybase.created() : super.created() {
   this.model=newModel();
   this.controller=newController(model);
  }
  
  M newModel();
  
  Controller<M> newController(M model);
  
}


@CustomTag(MyPoly.name) 
abstract class MyPoly extends Polybase<MyModel> {
 
  static const name = "my-poly";
 
  MyPoly.created() : super.created();
  
  MyModel newModel() => new MyModel();
  

}

@CustomTag(MyOnePoly.name)
class MyOnePoly extends MyPoly  {
 
  static const name = "my-one-poly";
    
  MyOnePoly.created() : super.created();
  
  Controller newController(model) => new MyOtherController(model);
  

}

class MyModel extends Object with Observable {
  
  @observable String msg = "default";
  
  //abstract view of presentation: fields, methods, etc...
}
