import 'dart:html' as dom;

import 'package:observe/observe.dart';
import 'package:angular/angular.dart';


// An "ng-model" that implements observable.
@NgDirective(
    selector: '[ck-model]',
    map: const {'ck-model': '&.model'})
class CkModel extends Object with ChangeNotifierMixin {
  Scope _scope;

  Getter getter = ([_]) => null;
  Setter setter = (_, [__]) => null;

  Function render = (value) => null;

  CkModel(Scope this._scope, NodeAttrs attrs);

  set model(BoundExpression boundExpression) {
    print("CKCK: CkModel: Setting up Angular bidirectional binding to boundExpression");
    getter = boundExpression;
    setter = boundExpression.assign;
  }

  get viewValue        => modelValue;
  set viewValue(value) => modelValue = value;

  get modelValue        => getter();
  set modelValue(value) {
    print("CKCK: CkModel: changing modelValue: '${getter()}' → '$value'");
    setter(
        // We're an observable so fire a property change.
        notifyPropertyChange(const Symbol('modelValue'), getter(), value));
    // Let angular know something changed by forcing a digest.
    // TODO(chirayu): Eliminate this $digest by making Angular understand
    // observables.
    _scope.$digest();
  }
}

