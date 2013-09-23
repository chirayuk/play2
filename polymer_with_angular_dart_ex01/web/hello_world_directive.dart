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
    scope.username = "Chirayu";
    ckModel.render = (name) {
      element.name = name || "";
    };

    element.bind("name", ckModel, "viewValue");
  }
}


initializeAngularApp() {
  mdv.initialize();
  var module = new AngularModule()
      ..directive(CkModel)
      ..directive(HelloWorldDirective);
  bootstrapAngular([module]);
  print("ckck: Done bootstrap.");
}

