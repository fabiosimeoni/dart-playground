import 'package:polymer/polymer.dart';
import 'inner.dart';
import 'dart:html';


@CustomTag('my-compo')
class MyCompo extends PolymerElement {
 
  List<String> names = toObservable(new List());
  
  MyCompo.created() : super.created();
  
  @override
  void attached() {
    
    super.attached();
    
    for (Element child in this.children)
      if (child is MyInner)
        names.add(child.attributes['name']);
    
  }
  
}