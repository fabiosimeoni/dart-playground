library playground;


//possible, but why use a public place?
import 'package:playground/lib1.dart'; //internal appropriate

//possible but always discouraged
//import 'package:playground/src/mine.dart';

import 'lib2.dart';

part 'parts/part1.dart';
part 'parts/part2.dart';

const PLAYGROUND=1;

void main() {
  print(PART1+PART2+LIB2+PUBCONST);
}
