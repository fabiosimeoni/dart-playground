library lib;

import 'package:di/di.dart';
import 'package:di/annotations.dart';

import 'config.dart';



init() {
  Dependencies.add(new Module()..bind(A));
}


@Injectable()
class A {
}