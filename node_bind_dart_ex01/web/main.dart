import 'dart:html' as dom;

import 'package:observe/observe.dart';
import 'package:angular/angular.dart';
import 'package:mdv/mdv.dart' as mdv;

import 'ck_model.dart';


@NgDirective(selector: 'input[type=range][ck-model]')
class InputRangeDirective {
  dom.InputElement inputElement;
  CkModel ckModel;
  Scope scope;

  InputRangeDirective(dom.Element this.inputElement, NodeAttrs attrs, CkModel this.ckModel, Scope this.scope) {
    ckModel.render = (value) {
      inputElement.value = value == null ? "0" : "$value";
    };

    if (attrs["ckNodeBind"] == "1") {
      // TODO(chirayu): Rename viewValue to value for better efficiency
      // (consistent with polymer and special cased to avoid mirrors.)
      inputElement.bind("value", ckModel, "viewValue");
    } else {
      // Traditional way.
      inputElement.onChange.listen((value) {
        scope.$apply(() => ckModel.viewValue = int.parse(inputElement.value));
      });
    }
  }
}


main() {
  mdv.initialize();  
  var module = new AngularModule()
      ..directive(CkModel)
      ..directive(InputRangeDirective);
  bootstrapAngular([module]);
  print("ckck: Done bootstrap.");
}
