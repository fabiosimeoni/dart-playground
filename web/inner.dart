import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('my-inner')
class MyInner extends PolymerElement {
 
  @published String name;
  
  @override
  MyInner.created() : super.created();
  
}