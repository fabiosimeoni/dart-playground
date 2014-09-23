import 'package:di/di.dart';
import 'package:di/annotations.dart';

void main() {
  
  Module sample = new Module()
                      ..bind(A)
                      ..bind(B);
  
  ModuleInjector injector= new ModuleInjector([sample]);
  ModuleInjector recursive = new ModuleInjector([
                                            new Module()
                                                ..bind(ModuleInjector, toValue: injector)
                                                ..bind(F)
                                            
                                            ],injector);
  
  assert(identical(injector.get(A),injector.get(A)));
  assert(identical(injector.get(A),injector.get(B).a));
  
  assert(!identical(recursive.get(F).b,recursive.get(F).b));
  assert(!identical(injector.get(B),recursive.get(F).b));
}


@Injectable()
class A {
}

@Injectable()
class B {
  
  A a ;
  
  B(this.a);
}

@Injectable()
class F {

    ModuleInjector inj;

    F(this.inj);
    
    get b => new B(inj.get(A));       
    
}