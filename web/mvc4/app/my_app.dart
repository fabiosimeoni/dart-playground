part of app;


@CustomTag(MyApp.name) 
abstract class MyApp extends Polybase<App> {
 
  static const name = "my-app";
 
  MyApp.created() : super.created();
}

@Injectable()
class App extends Observable {
  
  @observable int area = 0;
  
  toggle() {
    area = (area == 0) ? 1 : 0;
  }
}
