part of area1;



Module myServiceModule = new Module()..bind(MyService, toImplementation: MySpecificService);


abstract class MyService {

  final Logger _log = new Logger("my-service");
  
  loadingthings(){
      _log.info("loading things with ${toString()}");
    }
  
  dothings(){
    _log.info("doing things with ${toString()}");
  }
}


@Injectable()
class MySpecificService extends MyService {}