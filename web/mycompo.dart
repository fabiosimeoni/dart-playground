import 'package:polymer/polymer.dart';

@CustomTag('my-compo')
class MyCompo extends PolymerElement {
 
  MyCompo.created() : super.created() {
    print("created");
  }
  
  @override
  void attached() {
    super.attached();
    print("here");
  }
  
}