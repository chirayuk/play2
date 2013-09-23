import 'package:polymer/polymer.dart';

@CustomTag('hello-world')
class HelloWorldElement extends PolymerElement with ObservableMixin {

  String _name = '';

  String get name => _name;
  set name(String value) {
    _name = notifyPropertyChange(const Symbol('name'), _name, value);
  }
}
