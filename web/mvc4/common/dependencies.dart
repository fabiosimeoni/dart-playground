part of common;

class Dependencies {
  
  static List<Module> modules = [];
  static ModuleInjector injector;
  static Map<String,Type> typemap = {};
  
  static add(Module module) {
    modules.add(module);
  }
  
  static configure() {
    
    injector= new ModuleInjector(modules);
  
    injector.types.forEach((type) {
       typemap[type.toString()]= type;
     });
    
   }
   
  instanceOf(Type type, [Type annotation]) {
    
     if (injector==null)
         throw new StateError("injector is not initialised");
     
     return injector.get(type,annotation);
  }
  
  instanceCalled(String name) {
      
       if (injector==null)
           throw new StateError("injector is not initialised");
       
       if (!typemap.containsKey(name))
         throw new ArgumentError("no registered type for $key");
     
       return instanceOf(typemap[name]);
       
    }
}
