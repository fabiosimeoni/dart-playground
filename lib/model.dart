library playground.model;

import 'dart:collection';

part "src/model/delegates.dart";

main() {

    var data = {'a' : 1, 'b' : {'c':2}, 'd' : [4,5,6], 'e' : [{},{}] }; 
  
    var o = new A(data);
    
    print(o.a);
    print(o.b.c);
    
    print(o.d);
    o.d.add(7);
    print( o.d);
    
    print (o.e);
    o.e.add(new E());
    print (o.e);
    
    print (o.state);
  
}


class A extends Delegate {
  
  A(Map bean) : super(bean);
  
  int get a => _get('a');
  
  B get b => new B(_get('b'));
  
  List<int> get d => _get('d');
  
  List<E> get e => _all('e',(e)=>new E.from(e));

}

class B extends Delegate {
  
  B(Map state): super(state);
  
  get c => _get('c');
  
}

class E extends Delegate {
  
  E() : this.from({});

  E.from(Map state): super(state);
  
}


