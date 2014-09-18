
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:math';

final Random generate = new Random();

void main() {

  initPolymer().run(() {
    
   ButtonElement btn = document.querySelector("#btn");
   LabelElement lbl = document.querySelector("#lbl");
   Element poly = document.querySelector("my-poly");
      
    //listen from outside
    poly.addEventListener('changed', (e) {
      refresh(lbl,poly);
    }); 
    
    //change prop from outside
    btn.onClick.listen((event) {
     String random = generate.nextInt(1000).toString();
     poly.attributes['pub'] = random;
     poly.attributes['pub2ways'] = random;
     refresh(lbl,poly);
     
    });
       
   });
}

refresh(lbl,Element poly) {
  lbl.text = "PUB attr. is: ${poly.attributes['pub']}, PUB2WAYS is ${poly.attributes['pub2ways']}, custom is ${poly.attributes['custom2ways']}";
  
}

@CustomTag(MyPoly.name)
class MyPoly extends PolymerElement {
  
  static const name="my-poly";
  
  //bound in template, copied as public attibute
  @published String pub = "initial";
  
  MyPoly.created() : super.created();
  
  //this is for better sync
  @PublishedProperty(reflect:true) 
  String get pub2ways => readValue(#pub2ways,()=>"initial");
  set pub2ways(String val) { writeValue(#pub2ways,val); }
  
  //this is not working at the moment
  @PublishedProperty(reflect:true) 
  Custom get custom2ways => readValue(#custom2ways,()=>new Custom());
  set custom2ways(Custom val) {writeValue(#custom2ways,val);}
  
  @ObserveProperty("custom2ways") 
  observeCustom() {
    print ('called');
    
  }

  
  change() {
  
    pub = "new";
    pub2ways = "new";
   
    custom2ways = new Custom(); 
    custom2ways.b="changed";
    
    fire('changed');
  }
}

class Custom extends Observable {
  
  int a = generate.nextInt(1000);
  String b = 'hello';
  
  toString() => '${a.toString()} $b';
}