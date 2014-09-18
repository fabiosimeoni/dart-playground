import 'package:polymer/polymer.dart';
import 'dart:html';

void main() {

  initPolymer();
      
}

@CustomTag('my-poly')
class MyPoly extends HtmlElement with Polymer, Observable {
 
  static const name = "my-poly";
  
  MyPoly.created() : super.created() {
    polymerCreated();
  }
  
  
}
