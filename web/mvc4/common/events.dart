part of common;

class Activation {
  
  final bool _first;
  
  const Activation() : _first = false;
  
  const Activation.first() : _first = true;
  
  bool get firstTime => _first;
}