import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/polymer_expressions.dart';
import 'model.dart';

import 'hello_world_directive.dart';
import 'ck_model.dart';
import 'package:angular/angular.dart';
import 'package:mdv/mdv.dart' as mdv;


main() {
  var template = query('#main_template');
  template.model = new MyModel();

  // initializeAngularApp();
  // TODO: Add DOM mutation observers to Angular so that we don't need this hack.
  //     Until then, we need to initialize Angular after Polymer has inserted
  //     the custom element into the DOM.
  var duration = new Duration(milliseconds: 1000);
  new Timer(duration, initializeAngularApp);
}
