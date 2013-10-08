import 'dart:html' as dom;

import 'package:observe/observe.dart';
import 'package:angular/angular.dart';
import 'package:mdv/mdv.dart' as mdv;

import 'ck_model.dart';


/**
 * Wrap the polymer custom element, "hello-world", in an Angular directive.
 */
@NgDirective(selector: 'div[is=hello-world][ck-model]')
class HelloWorldDirective {
  dom.Element element;
  CkModel ckModel;
  Scope scope;

  HelloWorldDirective(dom.Element this.element,
                      NodeAttrs attrs,
                      CkModel this.ckModel,
                      Scope this.scope) {
    // Initial value with a capital C to distinguish the value set from Angular
    // from the value set in the Polymer initial binding.
    print("CKCK: HelloWorldDirective: setting scope.username='Chirayu'");
    scope.username = "Chirayu";
    ckModel.render = (name) {
      element.name = name || "";
    };

    print("CKCK: binding to 'name' on element $element[is=${attrs['is']}]");
    element.bind("name", ckModel, "viewValue");
  }
}
