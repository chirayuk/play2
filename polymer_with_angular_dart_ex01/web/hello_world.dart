import 'package:polymer/polymer.dart';

@CustomTag('hello-world')
class HelloWorldElement extends PolymerElement {

  String _name = '';

  // @published replaces attributes="" in Polymer 0.8.  It seems that it should
  // require a compile step so I haven't removed the attributes="" line.
  // Should the attribute be on the getter/setter or does it only work in
  // conjunction with the @observable annotation?
  @published String get name => _name;
  @published set name(String value) {
    _name = notifyPropertyChange(const Symbol('name'), _name, value);
  }
}
