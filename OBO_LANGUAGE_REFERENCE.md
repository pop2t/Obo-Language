# OBO Language Reference

> Comprehensive syntax and feature documentation for the OBO programming language.  
> Compiler version: 0.5.0

---

## Table of Contents

1. [Basics](#1-basics)
2. [Variables & Constants](#2-variables--constants)
3. [Data Types](#3-data-types)
4. [Operators](#4-operators)
5. [Strings & Interpolation](#5-strings--interpolation)
6. [Control Flow](#6-control-flow)
7. [Functions](#7-functions)
8. [Closures & Actions](#8-closures--actions)
9. [Entities (Structs)](#9-entities-structs)
10. [Actors (Classes)](#10-actors-classes)
11. [Choices (Enums/ADTs)](#11-choices-enumsadts)
12. [Traits](#12-traits)
13. [Properties](#13-properties)
14. [Operator Overloading](#14-operator-overloading)
15. [Type Extensions](#15-type-extensions)
16. [Modules & Imports](#16-modules--imports)
17. [Collections](#17-collections)
18. [Error Handling](#18-error-handling)
19. [Concurrency](#19-concurrency)
20. [Events](#20-events)
21. [Type System](#21-type-system)
22. [Attributes](#22-attributes)
23. [Bridge (FFI)](#23-bridge-ffi)
24. [Standard Library](#24-standard-library)
25. [Memory Regions](#25-memory-regions)
26. [Running OBO Programs](#26-running-obo-programs)

---

## 1. Basics

### Comments

```obo
// single-line comment
/// doc comment (attached to the next declaration)
```

### Program Structure

OBO programs consist of top-level declarations (functions, actors, entities, choices, etc.). The entry point is the `main()` function. Top-level statements and `main()` calls are both supported.

```obo
function main()
{
    show "Hello, world!";
}
```

### Semicolons & Braces

- Statements end with `;`
- Blocks use `{ }` — no semicolons after closing braces of blocks
- Entity/actor field initializations inside `{ }` constructors end with `;`

### Keywords (Reserved Words)

**Declarations:** `function`, `entity`, `actor`, `choice`, `trait`, `system`, `template`, `final`, `shared`, `public`, `property`, `extend`, `type`, `const`, `event`, `operator`, `bridge`

**Control Flow:** `if`, `else`, `while`, `forever`, `count`, `for`, `in`, `check`, `is`, `stop`, `restart`, `out`, `wait`

**Logic:** `and`, `or`, `not`

**Types:** `number`, `decimal`, `text`, `char`, `flag`, `byte`, `bits`, `pointer`, `atomic`, `null`, `list`, `map`, `set`, `bag`, `queue`, `stack`, `grid2d`, `grid3d`, `pair`, `slice`, `buffer`

**Other:** `action`, `emit`, `listen`, `override`, `use`, `from`, `of`, `as`, `to`, `step`, `safe`, `metal`, `gc`, `run`, `channel`, `possible`, `show`, `prompt`, `into`, `then`, `has`, `assert`, `inspect`

---

## 2. Variables & Constants

### Variable Declaration

Variables are declared with `=` (no `let` keyword):

```obo
x = 42;
name = "Obo";
pi = 3.14;
alive = true;
nothing = null;
```

### Type Annotations (Optional)

```obo
x = 42;               // inferred as number
name as text = "Obo";  // explicitly typed (parameter style)
```

### Constants

```obo
const MAX_SCORE = 100;
const PI = 3.14159;
```

Constants are immutable and available throughout the scope.

### Multiple Assignment (Destructuring)

```obo
val, err = divide(10, 0);
```

---

## 3. Data Types

| Type      | Description                  | Literal Examples           |
|-----------|------------------------------|----------------------------|
| `number`  | 64-bit signed integer        | `42`, `-7`, `0`            |
| `decimal` | 64-bit floating point        | `3.14`, `-0.5`             |
| `text`    | UTF-8 string                 | `"hello"`, `"line\n"`      |
| `char`    | Single character             | `'a'`, `'Z'`              |
| `flag`    | Boolean                      | `true`, `false`            |
| `null`    | Null/absent value            | `null`                     |
| `list`    | Ordered collection           | `[1, 2, 3]`               |
| `map`     | Key-value dictionary         | `["a": 1, "b": 2]`        |
| `set`     | Unique elements              | via `Set` constructor      |
| `pair`    | Two-element tuple            | via `Pair` constructor     |
| `queue`   | FIFO collection              | via `Queue` constructor    |
| `stack`   | LIFO collection              | via `Stack` constructor    |
| `bag`     | Unordered, allows duplicates | via `Bag` constructor      |
| `grid2d`  | 2D array                     | via `Grid2D` constructor   |
| `grid3d`  | 3D array                     | via `Grid3D` constructor   |
| `buffer`  | Byte array                   | via `Buffer` constructor   |
| `atomic`  | Thread-safe atomic value     | `atomic of number(0)`      |
| `channel` | Concurrency communication    | `channel`                  |

---

## 4. Operators

### Arithmetic

| Operator | Description    | Example     |
|----------|----------------|-------------|
| `+`      | Add / Concat   | `5 + 3`     |
| `-`      | Subtract       | `10 - 3`    |
| `*`      | Multiply       | `4 * 5`     |
| `/`      | Divide         | `10 / 3`    |
| `%`      | Modulo         | `10 % 3`    |
| `-`      | Unary negate   | `-x`        |

### Comparison

| Operator | Description      | Example     |
|----------|------------------|-------------|
| `==`     | Equal            | `x == 5`    |
| `!=`     | Not equal        | `x != 0`    |
| `<`      | Less than        | `x < 10`    |
| `>`      | Greater than     | `x > 0`     |
| `<=`     | Less or equal    | `x <= 100`  |
| `>=`     | Greater or equal | `x >= 1`    |

### Logical

| Operator | Description | Example            |
|----------|-------------|--------------------|
| `and`    | Logical AND | `x > 0 and x < 10` |
| `or`     | Logical OR  | `x == 0 or x == 1` |
| `not`    | Logical NOT | `not done`          |

### Identity

```obo
x is null;          // identity check
x is not null;      // negated identity check
x is 42;            // value identity
x is not 42;
```

### Pipe

```obo
value |> transform;     // pipe operator
value then transform;   // alternative pipe syntax
```

### Casting

```obo
result = (number)input;   // type cast
```

---

## 5. Strings & Interpolation

### String Literals

```obo
name = "Hello, world";
ch = 'A';              // char literal
```

### String Interpolation

Use `{expression}` inside double-quoted strings:

```obo
name = "Obo";
age = 25;
show "Name: {name}, Age: {age}";
show "Math: {2 + 3}";
```

### String Concatenation

```obo
full = "Hello" + " " + "World";
show "Count: " + 42;       // auto-converts number to text
```

### String Properties & Methods

```obo
msg = "Hello World";
msg.length;              // 11
msg.upper;               // "HELLO WORLD"
msg.lower;               // "hello world"
msg.trim;                // removes whitespace
msg.reversed;            // "dlroW olleH"
msg.empty;               // false
msg.chars;               // list of characters
msg.words;               // ["Hello", "World"]
msg.lines;               // list of lines

msg.contains("World");   // true
msg.startsWith("He");    // true
msg.endsWith("ld");      // true
msg.split(" ");          // ["Hello", "World"]
msg.replace("World", "OBO");
msg.substring(0, 5);     // "Hello"
msg.indexOf("World");    // 6
msg.repeat(3);           // "Hello WorldHello WorldHello World"
msg.padLeft(20);         // right-aligned in 20 chars
msg.padRight(20, '.');   // left-aligned, padded with dots
msg.toNumber();          // parse as integer (or null)
msg.toDecimal();         // parse as decimal (or null)
```

---

## 6. Control Flow

### If / Else

```obo
if (score >= 90)
{
    show "A";
}
else if (score >= 80)
{
    show "B";
}
else
{
    show "F";
}
```

### Inline If (Ternary)

```obo
label = "big" if x > 5 else "small";
```

### While Loop

```obo
i = 0;
while (i < 10)
{
    show i;
    i = i + 1;
}
```

### Forever Loop

```obo
forever
{
    if (done) { stop; }
    // ...
}
```

### Count Loop (C-style for)

```obo
count (i = 0, 10)
{
    show i;       // 0 through 9
}

count (i = 0, 20, step = 3)
{
    show i;       // 0, 3, 6, 9, 12, 15, 18
}
```

### For-In Loop

```obo
fruits = ["apple", "banana", "cherry"];
for (f in fruits)
{
    show f;
}
```

### Range Expression

```obo
range = 1 to 10;               // 1..9
range = 0 to 100 step 5;       // 0, 5, 10, ...95
```

### Check (Pattern Matching / Switch)

```obo
check (value)
{
    is 42       { show "The answer"; }
    is "hello"  { show "Greeting"; }
    is < 0      { show "Negative"; }
    is >= 100   { show "Big"; }
    is null     { show "Nothing"; }
}
```

#### Check with Type Patterns

```obo
check (shape)
{
    is Circle(r)             { show "Circle radius: " + r; }
    is Rectangle(w, h)       { show "Rectangle: " + w + "x" + h; }
    is Point                 { show "Just a point"; }
}
```

#### Check with Guards

```obo
check (item)
{
    is Weapon and damage > 50 { show "Powerful weapon"; }
}
```

### Stop & Restart

- `stop;` — break out of the current loop
- `restart;` — skip to the next iteration (continue)

```obo
count (i = 0, 10)
{
    if (i == 5) { stop; }                  // breaks at 5
    if (i % 2 == 0) { restart; }           // skips evens
    show i;                                 // 1, 3
}
```

---

## 7. Functions

### Declaration

```obo
function add(a, b)
{
    out a + b;
}
```

### Return Values (`out`)

`out` is the return keyword. It replaces `return`:

```obo
function greet(name)
{
    out "Hello, " + name + "!";
}
```

### Default Parameters

```obo
function greet(name, greeting = "Hello")
{
    out greeting + ", " + name;
}

greet("Obo");           // "Hello, Obo"
greet("Obo", "Hey");    // "Hey, Obo"
```

### Type-Annotated Parameters

```obo
function double(n as number)
{
    out n * 2;
}
```

### Multi-Return

```obo
function divide(a, b)
{
    if (b is 0)
    {
        out null, "Division by zero";
    }
    out a / b, null;
}

val, err = divide(10, 0);
```

### Recursion

```obo
function factorial(n)
{
    if (n <= 1) { out 1; }
    out n * factorial(n - 1);
}
```

### Named Arguments

```obo
result = func(x = 10, y = 20);
```

---

## 8. Closures & Actions

### Action (Lambda / Closure)

```obo
multiplier = 3;
triple = action(x) { out x * multiplier; };
show triple(5);    // 15
```

### Arrow Action (Short Lambda)

```obo
double = x => x * 2;
show double(7);    // 14

// Multi-param:
add = (a, b) => a + b;
```

### As Callbacks

```obo
nums = [1, 2, 3, 4, 5];
evens = nums.filter(n => n % 2 == 0);
doubled = nums.map(n => n * 2);
total = nums.reduce(0, (acc, n) => acc + n);
```

### Higher-Order Functions

```obo
function apply(f, value)
{
    out f(value);
}

result = apply(action(x) { out x * 10; }, 5);   // 50
```

---

## 9. Entities (Structs)

Entities are plain data containers (value types, no methods):

```obo
entity Vec2
{
    x;
    y;
}

entity Stats
{
    health;
    armor;
}
```

### Constructing Entities

```obo
pos = Vec2 { x = 10; y = 20; };
show pos.x;    // 10
show pos.y;    // 20
```

### Field Access & Mutation

```obo
pos.x = 50;
show pos;
```

---

## 10. Actors (Classes)

Actors are the primary object-oriented construct in OBO. They have fields, methods, properties, events, and operator overloads.

### Basic Actor

```obo
actor Animal
{
    public name;
    public sound;

    function speak()
    {
        show name + " says " + sound;
    }
}
```

### Constructor Pattern (Shared Functions)

OBO uses `shared function create(...)` as the constructor pattern:

```obo
actor Dog is Animal
{
    public tricks = 0;

    shared function create(dogName)
    {
        out Dog
        {
            name = dogName;
            sound = "Woof";
            tricks = 0;
        };
    }

    function learnTrick()
    {
        tricks = tricks + 1;
        show name + " learned trick #" + tricks;
    }
}

// Usage:
dog = Dog.create("Rex");
dog.speak();         // Rex says Woof
dog.learnTrick();    // Rex learned trick #1
```

### Field Access Inside Methods

Inside an actor method, fields are accessed by bare name (no `self.` prefix):

```obo
actor Counter
{
    public value = 0;

    function increment()
    {
        value = value + 1;    // reads and writes the field
    }
}
```

### Visibility

- `public` — accessible from outside the actor
- Default (no modifier) — private to the actor

### Inheritance (`is`)

```obo
actor Dog is Animal
{
    // inherits all fields and methods from Animal
    public tricks = 0;
}
```

### Template Actors (Abstract)

Cannot be instantiated directly — must be subclassed:

```obo
template actor Account
{
    public balance = 0;

    function deposit(amount)
    {
        balance = balance + amount;
    }
}

actor CheckingAccount is Account
{
    shared function create(initial)
    {
        out CheckingAccount { balance = initial; };
    }
}
```

### Final Actors (Sealed)

Cannot be further subclassed:

```obo
final actor VaultAccount is Account
{
    shared function create(initial)
    {
        out VaultAccount { balance = initial; };
    }
}
```

### System Actors

```obo
system actor Logger
{
    // system-level actor
}
```

### Generics

```obo
actor Container of T
{
    public item;
}
```

### Traits on Actors

```obo
actor Farmer is Character has Workable
{
    function work()
    {
        show "Working!";
    }
}
```

---

## 11. Choices (Enums / ADTs)

### Simple Enum

```obo
choice Color
{
    Red,
    Green,
    Blue
}

c = Color.Red;
```

### Algebraic Data Type (with payloads)

```obo
choice Shape
{
    Circle(radius),
    Rectangle(width, height),
    Point
}

s = Shape.Circle(5);
s = Shape.Rectangle(10, 20);
s = Shape.Point;
```

### Pattern Matching Choices

```obo
check (shape)
{
    is Circle(r)         { show "Radius: " + r; }
    is Rectangle(w, h)   { show w + "x" + h; }
    is Point             { show "Point"; }
}
```

---

## 12. Traits

Traits define interface contracts that actors can implement:

```obo
trait Workable
{
    function work();
}

trait Printable
{
    function print();
}

actor Robot has Workable
{
    function work()
    {
        show "Beep boop";
    }
}
```

---

## 13. Properties

Computed properties with getters and optional setters:

```obo
actor Circle
{
    public radius;

    property area
    {
        get
        {
            out 3.14159 * radius * radius;
        }
    }

    property diameter
    {
        get { out radius * 2; }
        set(value) { radius = value / 2; }
    }
}

c = Circle { radius = 5; };
show c.area;           // accessed like a field
c.diameter = 20;       // calls setter
```

---

## 14. Operator Overloading

```obo
actor Vec2
{
    public x;
    public y;

    operator +(other)
    {
        out Vec2 { x = x + other.x; y = y + other.y; };
    }
}
```

---

## 15. Type Extensions

Add methods to existing types:

```obo
extend number
{
    function doubled(n as number)
    {
        out n * 2;
    }

    function isEven(n as number)
    {
        out n % 2 == 0;
    }
}

// Usage:
x = 21;
show x.doubled();    // 42
show x.isEven();     // false
```

---

## 16. Modules & Imports

### Importing a Module

```obo
use helpers;            // imports everything from helpers.obo

function main()
{
    show double(21);    // function from helpers module
}
```

### Selective Import

```obo
use square from mathlib;    // import only `square` from mathlib.obo

function main()
{
    show square(7);
}
```

### Standard Library Imports

```obo
use Math;
use Collections;
```

### Module Files

Module files are `.obo` files in a `modules/` directory relative to the importing file:

```
examples/
    main.obo
    modules/
        helpers.obo
        mathlib.obo
```

---

## 17. Collections

### Lists

```obo
nums = [1, 2, 3, 4, 5];
empty = [];

// Access
nums[0];               // 1 (zero-indexed)
nums.first;            // 1
nums.last;             // 5
nums.count;            // 5

// Methods
nums.add(6);           // [1, 2, 3, 4, 5, 6]
nums.insert(0, 99);    // [99, 1, 2, ...]
nums.remove(3);        // removes first occurrence of 3
nums.removeAt(0);      // removes element at index 0
nums.contains(3);      // true
nums.indexOf(3);       // 2
nums.join(", ");       // "1, 2, 3, 4, 5"
nums.reversed;         // [5, 4, 3, 2, 1]
nums.sorted;           // ascending sort
nums.distinct;         // remove duplicates
nums.take(3);          // [1, 2, 3]
nums.skip(2);          // [3, 4, 5]
nums.slice(1, 3);      // [2, 3]
nums.flat();           // flatten nested lists

// Functional methods
nums.filter(n => n > 3);           // [4, 5]
nums.map(n => n * 2);              // [2, 4, 6, 8, 10]
nums.reduce(0, (acc, n) => acc + n);  // 15
nums.any(n => n > 4);              // true
nums.all(n => n > 0);              // true
```

### Maps

```obo
ages = ["Alice": 30, "Bob": 25];

ages["Alice"];            // 30
ages.count;              // 2
ages.keys;               // ["Alice", "Bob"]
ages.values;             // [30, 25]
ages.has("Alice");       // true
ages.get("Carol", 0);   // 0 (default)
ages.set("Carol", 28);  // new map with Carol added
ages.remove("Bob");     // new map without Bob
```

### Sets

```obo
s = set([1, 2, 3, 2, 1]);
s.add(4);
s.has(2);                // true
s.remove(1);
s.union(otherSet);
s.intersect(otherSet);
s.difference(otherSet);
s.toList;
```

### Queues (FIFO)

```obo
q = queue([1, 2, 3]);
q.push(4);       // add to end
q.pop();         // remove from front
q.peek;          // front element
q.empty;
```

### Stacks (LIFO)

```obo
s = stack([1, 2, 3]);
s.push(4);       // add to top
s.pop();         // remove from top
s.peek;          // top element
```

### Pairs

```obo
p = pair(1, "one");
p.first;         // 1
p.second;        // "one"
```

### Grid2D

```obo
g = grid2d(3, 3, 0);      // 3x3 grid filled with 0
g.get(1, 1);
g.set(1, 1, 42);
g.row(0);                  // list
g.col(0);                  // list
g.rows;                    // 3
g.cols;                    // 3
```

### Grid3D

```obo
g = grid3d(3, 3, 3, 0);   // 3x3x3 grid
g.get(0, 0, 0);
g.set(0, 0, 0, 1);
```

### Buffers

```obo
buf = buffer(1024);        // 1024-byte buffer
buf.get(0);
buf.set(0, 255);
buf.length;
```

---

## 18. Error Handling

### Possible Block (Try/Catch)

```obo
possible
{
    result = riskyOperation();
    show result;
}
else (error)
{
    show "Error: " + error;
}
```

### Inline Possible

```obo
safeVal = riskyExpr if possible else 0;
```

### Assert

```obo
assert(x > 0);
assert(x > 0, "x must be positive");
```

---

## 19. Concurrency

### Run (Spawn Task)

```obo
task = run action()
{
    show "Running in background";
};
```

### Wait

```obo
wait for task;       // wait for single task
wait for all;        // wait for all spawned tasks
```

### Channels

```obo
ch = channel;

run action()
{
    ch.send("hello");
};

msg = ch.receive();
show msg;    // "hello"
```

### Atomics

```obo
counter = atomic of number(0);
counter.add(1);
counter.add(5);
val = counter.load();
show val;    // 6
```

---

## 20. Events

Events provide a publish/subscribe mechanism within actors:

```obo
actor Button
{
    public event onClick;

    function press()
    {
        emit onClick("pressed!");
    }
}

btn = Button {};
btn.onClick.listen(action(data)
{
    show "Button event: " + data;
});

btn.press();    // triggers listener
```

---

## 21. Type System

### Type Aliases

```obo
type ID = number;
type Name = text;
type Point = Vec2;
```

### Type Annotations on Parameters

```obo
function process(data as text, count as number)
{
    // ...
}
```

### Union Types

```obo
// In type position:
// number or text
```

### Generic Types

```obo
actor Box of T
{
    public item;
}

// list of number, map of text to number
```

### Casting

```obo
n = (number)textValue;                        // cast
n = (number)textValue if possible else 0;     // safe cast
```

---

## 22. Attributes

Attributes modify declarations:

```obo
@test
function test_addition()
{
    assert(1 + 1 == 2);
}
```

### Built-in Attributes

- `@test` — marks a function as a test case

---

## 23. Bridge (FFI)

Bridge blocks declare external C functions:

```obo
bridge "libc"
{
    function puts(s as pointer) out number;
    function printf(fmt as pointer, ...) out number;
}
```

- `bridge "lib_name"` — specifies the library
- Parameters require type annotations
- `...` for variadic functions
- `out TypeExpr` for return type

---

## 24. Standard Library

### Math

```obo
use Math;

Math.pi;                    // 3.14159...
Math.e;                     // 2.71828...
Math.infinity;
Math.maxNumber;
Math.minNumber;

Math.abs(-5);               // 5
Math.floor(3.7);            // 3
Math.ceil(3.2);             // 4
Math.round(3.5);            // 4
Math.sqrt(16);              // 4.0
Math.pow(2, 10);            // 1024
Math.sin(0);                // 0.0
Math.cos(0);                // 1.0
Math.tan(0);                // 0.0
Math.log(1);                // 0.0
Math.log10(100);            // 2.0
Math.min(3, 7);             // 3
Math.max(3, 7);             // 7
Math.clamp(15, 0, 10);      // 10
Math.sign(-5);              // -1
Math.random();              // 0.0..1.0
Math.randomInt(1, 100);     // random int in [1, 100)
Math.lerp(0, 10, 0.5);      // 5.0
```

### Convert

```obo
Convert.toNumber("42");      // 42
Convert.toDecimal("3.14");   // 3.14
Convert.toText(42);          // "42"
Convert.toFlag(1);           // true
Convert.toChar(65);          // 'A'
```

### File

```obo
use File;

content = File.read("data.txt");
File.write("output.txt", "hello");
File.append("log.txt", "entry\n");
File.exists("data.txt");            // true/false
File.delete("temp.txt");
lines = File.readLines("data.txt");  // list of lines
```

### Time

```obo
use Time;

Time.now;              // epoch ms
Time.nowSeconds;       // epoch seconds
Time.sleep(1000);      // sleep 1 second
Time.startTimer();
// ... work ...
elapsed = Time.stopTimer();    // ms elapsed
Time.measure();        // high-res time for benchmarks
```

---

## 25. Memory Regions

OBO supports memory region annotations:

```obo
safe
{
    // garbage-collected, bounds-checked
}

metal
{
    // manual memory, raw pointers, no bounds checking
}
```

---

## 26. Running OBO Programs

### Interpreter Mode (Default)

```bash
cargo run -- examples/hello.obo
```

### Native Compilation (LLVM)

```bash
cargo run -- examples/hello.obo --native
# Produces: examples/hello (native binary)
./examples/hello
```

### Run Tests

```bash
cargo run -- examples/test_all.obo --test
```

### Conditional Compilation

```obo
#if target == "native"
{
    // native-only code
}
#else
{
    // interpreter-only code
}
```

---

## Syntax Quick Reference

```
Variable:       x = 42;
Constant:       const X = 42;
Function:       function name(params) { body }
Return:         out value;
Print:          show expr;
Input:          prompt "msg" into varName;
If:             if (cond) { } else { }
While:          while (cond) { }
Forever:        forever { }
Count:          count (i = start, end) { }
For:            for (item in collection) { }
Check:          check (expr) { is pattern { } }
Break:          stop;
Continue:       restart;
Entity:         entity Name { field1; field2; }
Actor:          actor Name { public field; function method() { } }
Inherit:        actor Child is Parent { }
Trait:          trait Name { function method(); }
Implement:      actor X has TraitA { }
Choice:         choice Name { Variant1, Variant2(field) }
Constructor:    shared function create(...) { out ActorName { f = v; }; }
Closure:        action(params) { body }
Arrow:          x => expr
Template:       template actor Name { }
Final:          final actor Name { }
Import:         use module;
Selective:      use func from module;
Extension:      extend type { function method(self as type) { } }
Type alias:     type Name = existing;
Bridge:         bridge "lib" { function name(p as type) out type; }
Assert:         assert(cond, "message");
Test:           @test function test_x() { }
Event:          public event onX;  /  emit onX(data);  /  obj.onX.listen(action(d) { });
Concurrency:    run action() { };  /  wait for task;  /  wait for all;
Channel:        ch = channel;  /  ch.send(v);  /  ch.receive();
Atomic:         a = atomic of number(0);  /  a.add(1);  /  a.load();
Error:          possible { } else (err) { }
Cast:           (type)expr
Safe cast:      (type)expr if possible else fallback
Interpolation:  "text {expr} more"
Pipe:           expr |> func
```
