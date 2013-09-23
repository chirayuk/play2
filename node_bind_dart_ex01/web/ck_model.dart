import 'dart:html' as dom;

import 'package:observe/observe.dart';
import 'package:angular/angular.dart';


// An "ng-model" that implements observable.
@NgDirective(
    selector: '[ck-model]',
    map: const {'ck-model': '&.model'})
class CkModel extends Object with ChangeNotifierMixin {
  Scope _scope;
  bool _useNodeBind = false;

  Getter getter = ([_]) => null;
  Setter setter = (_, [__]) => null;

  Function render = (value) => null;

  CkModel(Scope this._scope, NodeAttrs attrs) {
    _useNodeBind = (attrs["ckNodeBind"] == "1");
    // If not using Node.bind(), we need to set up a watcher as currently done
    // in ngModel.
    if (!_useNodeBind) {
      _scope.$watch(() => getter(), (value) => render(value) );
    }
  }

  set model(BoundExpression boundExpression) {
    getter = boundExpression;
    setter = boundExpression.assign;
  }

  get viewValue        => modelValue;
  set viewValue(value) => modelValue = value;

  get modelValue        => getter();
  set modelValue(value) {
    setter(
        // We're an observable so fire a property change.
        notifyPropertyChange(const Symbol('value'), getter(), value));
    if (_useNodeBind) {
      // Let angular know something changed by forcing a digest.
      // TODO(chirayu): Eliminate this $digest by making Angular understanding
      // observables.
      _scope.$digest();
    }
  }
}
