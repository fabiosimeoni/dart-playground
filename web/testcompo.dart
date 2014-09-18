import 'package:polymer/polymer.dart';


@CustomTag('test-compo')
class TestCompo extends PolymerElement {
 
  @published String txt = "hello";
  
  @published int num = 10;
  
  @published SomeObject obj = new SomeObject();
  
  TestCompo.created(): super.created();
 
  toString() => obj.toString();
  
  attached() {
    num++;
    print(attributes.keys);
    attributes['num']="20";
    print(attributes.keys);
  }
}

class SomeObject{
  
  int a=3;
  String b="hello";
}