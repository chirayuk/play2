import 'package:observe/observe.dart';

class MyModel extends Object with ChangeNotifierMixin {
  String _user = 'chirayu';

  String get user => _user;
  set user(String value) {
    print("CKCK: MyModel: setting user to '$value'");
    _user = notifyPropertyChange(const Symbol('user'), _user, value);
  }
}
