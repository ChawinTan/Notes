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

## Pointers

A pointer holds the memory address of a value

`&` operand generates a pointer to the operand

`*` operand denotes the pointer's underlying value. This is know as dereferencing.

```
var p *int // declare a pointer

i := 42
p = &i // points to i variable

*p = 21 // change the value of i through pointer p

fmt.Println(*p) // prints the value of i
fmt.Println(p) // prints the address of i, eg: 0xc000002c40
```

## Structs

A struct is a collection of fields.

Struct fields are accessed using a dot.

We can also access field of a struct through a struct pointer. There is no need for explicit dereferencing however (*p.X)

Struct literal denotes a newly allocated struct value by listing the values of it's fields. You can list just some of the fields by using the `Name: Value` syntax.

```
type MyStruct struct {
    X int
    Y int
}

v := MyStruct{1, 2}
fmt.Println(v.X) // prints 1

v2 := MyStruct{X: 3} // Y = 0 is implied

p := &v   // assign v to a pointer p
fmt.Println(p.X)
```

## Arrays

An array's length is part of it's type, so it can't be resized.

```
var myArray [size]type
```

## Slices

Capable of being dynamically sized. Is of type `[]type`.

Slices do not store data but only describes a section of an underlying array. Changing the elements of a slice modifies the corresponding elements of its underlying array. Other slices that share the same array would also be affected.

```
arr := [6]int{1,2,3,4,5,6}
var s []int = arr[low: high]
```

### Slice literals

Slice literals are like arrays without length. It creates a slice that references the underlying array.

Can use slice default values too: 0 for the high bound and length of array for the low bound

eg:

```
s := []int{1,2,3}
is equivalent to
s := [3]{1,2,3}
```

A slice has a lenghth and capacity.

```
s = []int{1,2,3,4,5}
s = s[:0]

c := cap(s)  // cap of s
l := len(s)  // length of l
```

A slice without any value is `nil` It has 0 caps and 0 length

```
var s[]int
if s == nil { do something }
```

###  Creating a slice with make

Dynamically sized slices can be created using the built in function `make`

```
a := make([]int, 5 , 10) => array type, len, caps
```

A slice of slice:

```
test := [][]type {
    []type{.......}
}
```

### Appending a slice

```
var s []int
s = append(s, value .....) // can append more than one value
```

The `range` form of for loop iterates over a slice or a map. Two values are returned: first is the index and the second is a copy of the element

Can skip the index or value by assigning `_` to the value.

```
for i, v := range pow {
    do something ...
}
```

An example of implementing slice related functions

```
func Pic(dx, dy int) [][]uint8 {
	pic := make([][]uint8, dy)
	
	for x:=0; x<dy; x++ {
		pic[x] = make([]uint8, dx)
	}
	
	for y:=0; y<dy; y++ {
		for i:=0; i<dx; i++ {
			pic[y][i] = uint8((y+i)/2)
		}
	}
	
	return pic
	
}
```

## Maps

`Nil` map has no keys nor can keys be added. `make` function returns a map of the given type initialized.

Keys are required for Map literals. If the top level type of the value/key is just a type name, we can omit from the elements of the literal.

```
var m map[type]type
m[key] = value

var m map[type]type{   // map literals
    key: value,        // don't forget the comma!
}
```

Retrieving an element: `elem = m[key]`

Deleting an element: `delete(m, key)`

Test if a key is present: `elem, ok = m[key]` // will return true to ok if present, false if not

An example:

```
func WordCount(s string) map[string]int {
	temp := strings.Split(s, " ")
	res := map[string]int{}

	for _, i := range temp {
		if _, ok := res[i]; ok {
			res[i] += 1
		} else {
			res[i] = 1
		}
	}
	return res
}
```

## Function values

Functions are values and they can be used as function arguments and return values

Functions may also be closures, that is function bound to external variables.

```
func outerfunc(func innerFunc(args type) returnType) return type { return innerFunc(args) }

func closure() func(type) type {
    // external var
    return func(x type) {
        // do something with external var
        return value
    }
}

myFunc = closure()
closure(args)
```

An example 

```
func fibonacci() func() int {
	x, y, z := 0, 1, 0
	return func() int {          // inner function can modify the outer variables
		z, x, y = x, y, x + y
		return z
	}
}
```

## Methods

Can define methods on types. A method is a function with special receiver argument.

Receiver receives the method and appears in its own argumet list between func keyword and method name.

Can also declare method on non-struct types. 

```
type Vertex struct {
    X,Y float64
}

func (v vertex) Abs() float64 {  // vertex is the receiver, Abs is the method
    return // do something
}

v := Vertex{3,4}
fmt.Println(v.Abs())

type MyFloat float64  // declare your type

func (f MyFloat) Abs() float64 {
    return // do something
}

f := MyFloat(float)
f.Abs()
```

### Pointer receivers in methods

Can declare methods with pointer receivers.

Methods with pointer receivers can modify the value to which the receiver points to. A function would need a pointer argument but methods with pointer receivers can take either a value or a pointer as the receiver when they are called.

There are 2 reasons to use pointer receivers:

1) Method can modify the value that its receiver points to
2) Avoid copying the value on each method call

In general, all methods on a given type should have either value or pointer receivers but not a mixture of both.

Eg:

```
type Vertex struct {
    X, Y float64
}

func (v Vertex) method1() float64 {
    return v.X + v.Y
}

func (v *Vertex) method2(f float64) {   // pointer receiver values X and Y can be modified
    v.X = v.X*f
    v.Y = v.Y*f
}

v := Vertex{4,5}
v.method2(10)
Go interpretes this statement as &v.method2(10)
```

## Interface

Defined as a set of method signatures. A value of interface can hold any value that implement those methods. 

There is no explicit implementation for interface.

```
type Abser interface {
    Abs() float64
}

type MyFloat float64

type Vertex struct {
    X,Y float64
}

func (f MyFloat) Abs() float64 {
    // do something
}

func (v *Vertex) Abs() float64 {
    // do something
}

var a Abser
f := MyFloat()
v := Vertex{3,4}

a = f // a MyFloat implements abser
a = &v // a *Vertex implememts Abser
```