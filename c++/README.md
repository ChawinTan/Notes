# C++ tutorial

## Basics

Compiling and running

```
g++ hello.cpp
a.out
```

A semicolon is a statement terminator. A block is set of logically connected statements that are surrounded by opening and closing braces.

### Typedef

Can createa new name for an existing type using `typedef`, eg `typedef type newname;`

### Enumerated Types

`enum enum-name { list of name } var-list;`

By default, the value of the first name is 0 and +1 for each subsequent value. You can however, assign a value to a name and the remaining names will follow suit.

## Variables

### Variable Declaration

Use the `extern` keyword to declare a variable at any place. Can declare a variable first and then define a variable further down the program/function only if you need to.

lvalue - expressions that refer to memory locations, can appear on the left or right, eg: variable.<br/>
rvalue - refers to data that is stored at some memory address and cannot have values assigned, eg: integers

Local variables are defined within functions and blocks. Global variables are defined outside of all functions and blocks.

### Const

Used to declare constants with a specific type. It is a good practice to define constants in CAPITAlS.

### Storage classes

`auto` storage class is the default for all local variables.

`register` storage class is used to define local variables that should be stored in a register instead of a ram.

`static` storage class instructs the compiler to keep a local variable in existence during the life time of the program instead of creating and destroying it each time it goes in and out of scope. Allows them to maintain values between function calls.

`extern` storage class is used t give a reference of a global variable that is visible to all program files.

`mutable` only applies to class objects. Mutable member can be modified by a const member function.

## Pointers

Pointer operations

```
int var = 20;
int *p // declare pointer variable

p = &var // store the address of var

count << *p << endl // print the value of var through p
```

## References

Cannot have null references and must be initialized when created and must assume it is pointing to something legitimate. It cannot be changed to refer to another obect once initialized.

```
int i = 17;
int& r = i;
```

Passing by reference and pointers in a function call affect the final value of the argument since the reference/addreess is used to access the actual argument in the call.

Pass by value copies the actual value, hence does not affect the actual argument.

```
swap(&x, &y);
```

## Structure

`struct` is a user defined data type which allows to combine data items of different kinds. 

eg:

```
struct myType {
	type definition;
	char author[50]
}
```

## Classes and objects

Data and functions within a class are called members of a class. Members are assumed to be private by default.

Friend functions - not considered members of a class and has full access to private and protected members of a class.<br />
copy constructor - a constructor which creates an object by initializing it with an object of the same class which has been created previously.<br />
this - pointer to the object itself<br />

```
class Box {
	public:
		double length;
		double width;
		double height;
}

Box box1; // declare box1 of type Box
box1.length = 5.0 // accessing member
```

## Inheritance

Allows us to define a class in terms of another class. New class is called the derive class while existing class is called the base class. The idea of inheritance implements the `Is-a` relationship.

```
class Shape {
	public: void myFunc(){...}

	protected: 
		int width;
		int height
}

class Square: public Shape {
	public:
		int getArea() { return width*height };
}
```

A derived class can access all non private members of it's base class, (public and protected).

## Overloading

Overloading allows for multiple definitions for the same function name in the same scope. They must differ from each other by the types and/or number of arguments in the argument list. Cannot overload function declarations that differ only by return type.

```
void print(int i)
void print(double i) // different type/number or argument
```
