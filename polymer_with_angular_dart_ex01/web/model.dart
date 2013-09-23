import 'package:observe/observe.dart';

class MyModel extends Object with ObservableMixin {
  String _user = 'chirayu';

  String get user => _user;
  set user(String value) {
    _user = notifyPropertyChange(const Symbol('user'), _user, value);
  }
}
