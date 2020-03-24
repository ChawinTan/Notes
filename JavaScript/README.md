## Closures

Combination of a function and it's lexical environment. Consist of any local variables that were in scope when the closure is created. Gives you access to an outer function's scope from an inner function.

Example:

```
function makeAdder(x) {
  return function(y) {
    return x + y;
  };
}

var add5 = makeAdder(5); // lexical env = x
var add10 = makeAdder(10);

console.log(add5(2));  // 7 lexical env = y
console.log(add10(2)); // 12
```


When outer function scope is also a nested function, the outer function's scope also includes the enclosing scope of the outer function - a chain of scopes.

## Var vs Const vs Let

var is function scoped while let and const is blocked scope. Function scoped means you can access the variable anywhere within the scope of the function defined. Blocked scope means you can only access it within the scope of the curly brackets.

Var also uses hoisting. It means variables declared with a var will be undfined until assigned. Let and const on the other hand, will throw a reference error.

Const is similar to let, just that once you defined it, the value cannot be changed.

## Jsx
Essentially syntatic sugar for `React.createElement`. It is compiled by Babel (or other preprocessors). Lets you write html or xml like syntax inside Javascript. Declarative syntax used to express the virtual dom.

