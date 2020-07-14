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


