See [**demo**](http://polymer_with_angular_dart_ex01.play2.ant.c-k.me/) 
*(Requires the latest Dartium.)*


## Goal
Consume a Polymer component in Angular.dart.


## Requirements
-   *latest Dartium* - v0.8.1+
-   *patched Angular.Dart* that [changes](https://github.com/chirayuk/angular.dart/commit/f3033eb6fd68a6bd5f963f1e429ed6a1eef95cc5)
    Angular's interpolation expressions from `{{`/`}}` to `«`/`»`.
    -   get it from my branch <https://github.com/chirayuk/angular.dart/tree/alt_interpolation_symbols>
    -   fyi, if you visit the [demo](http://polymer_with_angular_dart_ex01.play2.ant.c-k.me/),
        you're automatically pulling in this version.  You
        need it only if you want to run it locally by
        cloning this repo.


## Notes
- Bootstrapping issue
  - Polymer compiles the `<polymer-element>` after document
    load.  Custom elements are inserted into the DOM at some
    point.  Angular's bootstrap walks the DOM looking for
    directives.  To make Angular see the Polymer custom
    components, Angular should be bootstrapped after Polymer
    has created the component.  This is done via a timeout.
    - In real life, Angular should probably use DOM mutation
        observers to detect when Polymer has added a
        component and process it.  (Assuming that we want to
        use both in this way.  Some dragons lurk along this
        path.)
- Both Polymer and Angular define an expression language
  inside `{{` / `}}` pairs.  Which one should interpret it?
- Sharing "scope":  For DRY, there needs to be some way for
  the developer to share the bindings on the Polymer
  template element (at least on the top level) with
  Angular's scope (at least the rootScope.)
- There are existing bugs with bidirectional bindings in
  Polymer.
- The `Node.bind` binding with the Polymer element appears
  not to work.  (The last binding to `{{username}}` in the
  example.)
