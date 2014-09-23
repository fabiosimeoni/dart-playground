part of app;


@CustomTag(MyApp.name) 
abstract class MyApp extends Polybase<App> {
 
  static const name = "my-app";
 
  MyApp.created() : super.created();
}

@Injectable()
class App extends Observable {
  
  @observable String area = "myarea";
  
  toggle() {
    area = (area == "myarea") ? 'other' : 'myarea';
  }
}
