library playground;

import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';
import 'mycompo.dart';

import 'dart:html';

//possible, but why use a public place?
import 'package:playground/lib1.dart'; //internal appropriate

//possible but always discouraged
//import 'package:playground/src/mine.dart';

import 'lib2.dart';

part 'parts/part1.dart';
part 'parts/part2.dart';

const PLAYGROUND=1;

void main() {

  initPolymer().run(() {

//    accessPolymer();
//    revealPolymer();
//    addPolymer();
//    print("main: ${PART1+PART2+LIB2+PUBCONST}");
  
  });
}

accessPolymer() {


  document.querySelector('#sel')
                                ..attributes['label']='changed by a script to float'
                                ..attributes['floatingLabel']='true';

}

addPolymer() {
  
  MyCompo e = new Element.tag('my-compo');
  
  document.querySelector('#mydiv').children.add(e);
}

revealPolymer() {

  assert(document.querySelector('#sel') is PaperInput);

}
