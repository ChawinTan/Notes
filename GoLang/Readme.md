Golang

Mostly documentation for tutorials that I can refer to. Some tips and tricks here and there.

## Basic structure of go

[This](https://golang.org/doc/code.html) document describes how you should architect your golang code in terms of modules and packages. It also teaches several basic go commands and testing modules.

## Packages

Programs run in `package main`. Package name is the same as the last element of the import path, eg: "math/rand" -> comprises of packages that begin with `package rand`.

## Exported names

An exported name begins with a capital letter. When importing a package, you can only refer to it's exported names.

## Functions

```
func myfunction(varName type) return type {

}

When two or more function inputs share the same type, we can omit the typing from previous ones, eg:

`func add(x, y int) int { ... }`
```

A function can return multiple results.

eg:

```
func myfunc(x, y string) (string, string) {
    return y, x
}

a, b = myfunc("hello", "world")
a = world
b = hello
```

### Named return values

An empty statement is used to return the values of variables defined at the top of the function.

eg:

```
func myfunc(x int) (y, z int) {
    y = x*4
    z = x+3
    return
}
```

## Variables

`var` statement declares a list of variables. Once a type has been declared, it is considered end of statement. It can be at the package or function level.

If an initializer value is present, it will take the type of the initializer.

eg:

`var i, j = 1, "NO"`

Inside a function, short assignment statement can be used in place of `var`.

eg:

`i := 9`

Outside, all statement begins with `var, func` or other keywords

Variables declared without an explicit initial value are given their zero value.

## Type conversion

You can convert between different types by wrapping the variable around the type

eg:

```
var i int = 5;
var f float64 = float64(i)
```

## Constants

Are like variables but declared with the `const` keyword.

eg:

`const x = "hello"`

Once declared, it cannot be re-assigned.

Numeric constants are high precision values.

eg:

```
const (
    Big = 1 << 100
    Small = Big >> 99
)
```

The above means shift the bit 100 places left for Big and 99 places right for small.

## For loop

Go has only one way to loop - the for loop.

```
for i:=0; i<10; i++ {
    // do something
}
```

You can use the for loop like a while loop:

```
for sum < 1000 {
    // do something
}
```

An infinite loop:

```
for {

}
```

## If statements

Similar to for loops, the expression (condition to be evaluated) does not need to be surrounded by paranthees ()

If statement can start with a short statement to execute before the condition like a for loop:

```
if v:= math.pow(x, n); v < lim {
    return v
}
return lim

// This code returns v if v is smaller than lim. Else, it returns lim
```

Can only return v within the scope of the if statement.

V is also accessible within the else block.

## Switch statement

Switch statements also can have an expression within the `switch`. It does not need to `break` unlike other languages as the break statement is provided. Also, switch cases need not be constants and values involved does not need to be integers.

```
switch i=expression; i {
    case '...':
        do something
    default:
        do something
}
```
Evaluates the statements from top to bottom and stop when a case succeeds.

Switch without a condition is the same as `switch true`

## Defer

Defer statement defers the execution of a function till the surrounding returns

```
defer fmt.Println("world")

fmt.Println("hello)

This function would print "hello" first followed by "world" as the first statement is deferred till the rest of the statements are executed.
```

Deferred function calls are pushed into a stack. Deferred calls are executed in the last in first out order.

```
fmt.Println("counting")

for i:=0; i < 10; i++ {
    defer fmt.Println(i)
}

fmt.Println("done")

results:

counting
done
9
8
.
.
.
1
```