// Verifies that you can't combine 'except' and 'only' in the same use statement
module A {
  proc foo() {
    writeln("wheeee");
  }

  type t = bool;

  var b: t;
}

module M {
  use A except b only t;

  proc main() {
    var a: t;
    writeln(a);
  }
}
