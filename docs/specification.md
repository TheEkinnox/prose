# Prose Language Specification

## Built-In Types

- `i8`/`i16`/`i32`/`i64`: 8, 16, 32 and 64 bit signed integer types respectively
- `u8`/`u16`/`u32`/`u64`: 8, 16, 32 and 64 bit unsigned integer types respectively
- `iptr`/`uptr`: Signed and unsigned integer types large enough to hold a pointer.
- `byte`: single-byte unsigned integer type (alias for `u8`)
- `f32`/`f64`: 32 and 64 bit floating-point types respectively
- `bool`: Boolean type (`true` or `false`)
- `rune`: 4 byte Unicode code point type
- `string`: Immutable UTF-8 byte sequence
- `void`: 0 byte type

Notes:
- `void` may only be used as a function return type or the base type of a pointer
- `bool` has the same object representation and size as `byte`
- A `bool` whose underlying `byte` representation is `0` evaluates to `false`. Any non-zero representation evaluates to `true`.
- Boolean contexts interpret `0` as `false` and non-zero as `true`, but numeric comparisons use the numeric representation of the boolean value (i.e. `true != 2` but `true == bool(2)`).
- `rune` has the same object representation and size as `u32`

### Type Modifiers

- `*`: Pointer modifier
- `&`: Reference modifier
- `[]`: Array modifier
- `[:]`: Slice modifier

Notes:
- Type modifiers are always applied from left to right. This means reading them from right to left will provide a clear understanding of the type (e.g.: `u8[]*` is a pointer to a dynamic array of 8 bit unsigned integers)
- Type modifiers must be placed after the type (e.g.: `u8[]` is valid but `[]u8` is not) this makes code easier to parse and reason about for both the programmer and compiler

### More about pointers

A pointer is a non-owning, nullable representation of the raw memory address of an object. It can be obtained using the `@` address-of operator (e.g. `x : u8* = @y`)

Two pointers are considered equal if they are pointing to the same memory address

### More about references

A reference is a non-owning, non-nullable equivalent to a pointer with immutable binding

A reference must always be initialized

Once initialized, a reference is permanently bound. This means subsequent assignments change the value of the underlying object rather than redirecting the reference itself

Two references are considered equal if their underlying values are equal

Notes:
- Taking a pointer from a reference retrieves the address of the referenced value, not of the reference itself
- `void` has no physical memory representation. Taking a reference to `void` (i.e. `void&`) is considered ill-formed

### More about arrays

By default, arrays are dynamic (think C# `List` or C++ `vector`) unless a size is specified (e.g. `u8[]` would be a dynamic array of 8 bit unsigned integers and `byte[4]` would be a fixed array of 4 bytes)

The size of a fixed array must be a constant expression evaluating to an integer

If elements of a fixed array are not specified, they will be default initialized

The object representation of a fixed array consists of the object representations of its elements, with no padding between consecutive elements.

A dynamic array value contains metadata describing separately stored element storage, conceptually including a pointer, length, and capacity.

The element storage of an array is contiguous and contains no padding between consecutive elements.

Two arrays are considered equal if their contents are equal

### More about slices

A slice is a non-owning view over a contiguous sequence of values.

A slice contains sufficient information to access a portion of another collection, such as a pointer and length

A slice may reference another slice

Two slices are considered equal if their contents are equal

Ex:
```
data : u8[] = [1, 2, 3, 4, 5]
view : u8[:] = data[1:3] // [2, 3, 4]
view2 = view
view2[0] = 6 // view[0] and data[1] are now 6
```

The beginning and end of the slice may be omitted.

Ex:
```
data[:last]  // Takes all elements from the start of the collection to `last`
data[first:] // Takes all elements from `first` to the end of the collection
data[:]      // Takes all elements in the collection
```

Note: The start and end indices of a slice are inclusive - the resulting slice contains every element from `first` through `last`, inclusively

## Custom types

Start a type definition block with `type` followed by its name and close it with `end`

Members follow the same syntax as variables

If no default value is specified use the type's default

Destroying a custom type destroys each of its members in reverse declaration order

```
type MyType
    x : u8 = 0
    y : byte[]
end
```

### Enums

An enum defines a type whose value is one of a fixed set of named values.

Enums are declared using the `enum` keyword. Each member has a unique name and an integer value.

Ex:
```
enum Color : u8
    Red
    Green
    Blue
end
```

The first member has the value `0`, and each following member increments the value by `1`.

An explicit value may be assigned to a member:

```
enum ErrorCode
    None = 0
    NotFound = 404
    InternalError = 500
end
```

When a member has an explicit value, subsequent members continue incrementing from that value:

```
enum Value
    A = 1
    B
    C = 10
    D
end
```

This results in `A = 1`, `B = 2`, `C = 10`, and `D = 11`.

Enum members are accessed using the enum type name followed by `.`:

```
color = Color.Red
```

An enum value is only implicitly compatible with its own enum type. It does not implicitly convert to or from an integer type.

An explicit cast may be used to convert between an enum and an integer type:

```
value = i32(Color.Red)
color = Color(value)
// value = color // This line would fail at compile time
```

Notes:
- Multiple members may have the same value
- The underlying integer type of an enum is implementation-defined unless explicitly specified.
- Casting an integer value to an enum with no matching member is allowed. Enums essentially behave like strongly typed integer values
- Enum values are copyable and movable according to the rules of their underlying type.

### Type aliases

To create a type alias, use the following syntax: `alias <name> = <type>`

Note: A type alias is considered equivalent to the aliased type (i.e. with `alias byte = u8` the alias `byte` is interchangeable with `u8`)

### Copyability

Types may be copyable, movable, or both

A type is copyable if and only if all its members are copyable

A type is movable if and only if all its members are movable

A type composed of both copy-only and move-only members is ill-formed

A copyable type may be copied using normal assignment or argument passing

A movable type may be transferred using `move`

A type that is not copyable must be moved when ownership needs to be transferred

Copying or moving a custom type performs the corresponding operation on each of its members

## Variables

The full variable declaration syntax is `<var_name> [: <type>] [= <value>]`. However, if the type can be unambiguously deduced at compile time, it can be omitted from the expression.

Notes:
- A variable declaration must specify a type, an initializer, or both
- If a typed variable is declared without an initializer, it is implicitly initialized with the type's default value
- If the left-hand identifier of an assignment does not exist in the current scope, the assignment is treated as an inferred variable declaration

Ex:
```
x = 255 // Defaults to i32
y : u8 = 255
z = u8(255)
```

### Mutability

By default, a variable is mutable. To make it constant (i.e. prevent future assignments), add the `const` keyword before it's declaration.

```
const x = 16
// x = 3 // This line would fail at compile time
```

Notes:
- `const` modifies the binding, not the underlying type.
- Using `const` with a reference prevents the referenced object from being modified through that reference.
- Taking a reference to a `const` object produces a `const` reference.
- When the type of an inferred reference is deduced from a `const` object, the resulting reference is `const`.

Ex:
```
const x : T
const y : T& = x
z = y               // Implicitly creates a const ref
// invalid : T& = x // Invalid since x is const
```

### Casting

Casting is always done explicitly except in specific cases.

Integer types can be implicitly converted to a larger integer type of the same signedness.

Floating-point types can be implicitly converted to a larger floating-point type.

Conversions between signed and unsigned integer types, narrowing conversions and conversions between integer and floating-point types must be explicit.

Integer literals may be implicitly converted to any integer or floating-point type capable of representing their value.

Ex:
```
a : i8 = 16
b : i32 = a
c = u8(b)
d : f32 = 0
e : f64 = d
```

Explicit conversion from an integer to `bool` produces `false` for zero and `true` for any non-zero value.

Values normally produced as `bool`, including explicit numeric conversions, use the canonical byte representations 0 and 1.

A `bool` may be directly compared with an integer value. For such comparisons, the underlying byte representation of the `bool` is treated as a u8 value.

Ex:
```
true == 1       // true
true == 2       // false
true == bool(2) // true
```

Fixed arrays may be implicitly copied or explicitly moved into dynamic arrays. Dynamic arrays cannot be converted into fixed arrays.

When a fixed array is implicitly converted to a dynamic array, its elements are copied into independent element storage.

When a fixed array is moved into a dynamic array, its elements are moved into storage owned by the resulting array. Existing storage may be reused only if ownership of that storage can be transferred.

Taking a dynamic array reference from a fixed array is ill-formed.

Ex:
```
a : u8[4] = [ 1, 2, 3, 4 ]
b : u8[] = a      // Copies the elements
c : u8[] = move a // Moves the elements
// d : u8[]& = a  // This line would fail at compile-time
```

Converting a fixed array to a dynamic array without changing its element type is a container conversion, not a representation cast. A representation cast reinterprets the underlying element storage using a different element type.

Ex:
```
a : u8[4] = [ 1, 2, 3, 4 ]
b : u8[] = a // Container conversion: element type remains u8

raw : byte[8] = [0, 1, 2, 3, 4, 5, 6, 7]
values : i32[] = move raw // Representation cast: the same byte sequence is interpreted as i32 elements
```

All pointer types may be explicitly cast to/from `uptr` or `iptr`.

#### Representation casts

See the `Memory Model` section.

##### Arrays

A representation cast involving an owning array must transfer ownership of the represented storage to the resulting array using `move`.

The implementation may reuse the original storage or relocate its bytes into storage suitable for the resulting array.

Relocation must preserve the represented byte sequence and does not constitute a numeric or element-wise conversion.

The conversion must represent the entire underlying storage. If the storage size is not an exact multiple of the target element size, the conversion is invalid.

If the incompatibility can be determined at compile time, the program is ill-formed. Otherwise, the program panics at runtime.

Ex:
```
data : byte[] = make byte[8]
values : i32[] = move data

// data is now moved-from
// values contains 2 i32 elements represented by the 8 bytes previously owned by data
```

A conversion whose size is known at compile time is checked by the compiler:

Ex:
```
data : byte[8] = [0, 1, 2, 3, 4, 5, 6, 7]
values : i32[] = move data // Valid: 8 bytes can represent 2 i32 values

// data : byte[9] = ...
// values : i32[] = move data // Compile-time error
```

When the size is only known at runtime, the conversion is checked at runtime:

Ex:
```
data : byte[] = ...
values : i32[] = move data // Panics if the size of data cannot be represented entirely as i32 values
```

Converting the resulting array back to its original element type is reversible as long as the complete storage is represented by the target type

Ex:
```
data : byte[] = make byte[8]
values : i32[] = move data
data2 : byte[] = move values

// data2 represents the same byte sequence originally represented by data
```

##### Slices

A representation cast involving a slice does not transfer ownership. The resulting slice remains a non-owning view of the same underlying storage.

When the target element type is larger than the source element type, the resulting slice contains only complete target elements. Any remaining storage that cannot form a complete element is excluded from the resulting view.

Ex:
```
data : byte[] = make byte[9]
view : i32[:] = data[:]

// view contains 2 i32 elements
// The remaining byte is not part of view
// data still owns all 9 bytes
```

Casting the slice back to bytes does not alter the underlying collection:

```
bytes : byte[:] = view

// bytes represents the 8 bytes covered by view
// The original 9th byte remains part of data but is outside of view
```

## Comments

```
// Line comment
```

```
/* Block
comment */
```

## Expressions

### Literals

- Integer literals are represented with numbers (`0-9`) and apostrophes (`'`) may be used as digit separators between digits (e.g. `42`, `1'000`)
- Floating-point literals are composed of an integer literal for the integer part, optionally followed by a dot (`.`) and another integer literal for the decimal part (e.g. `3.14`)
  - At least one of the integer part or decimal part must be set (e.g. `.14` and `3.` are valid but a single `.` is not considered a floating-point literal)
  - When lexing a numeric literal, a `.` followed immediately by another `.` does not belong to the numeric literal.
- Boolean literals are represented using the `true` and `false` keywords
- Rune literals are represented by a single UTF-8 character between apostrophes (`'`) (e.g. `'a'`)
- String literals are represented by zero or more UTF-8 characters between quotation marks (`"`) and may contain line breaks (e.g. `"hello"`, `""`)
- Array literals are represented by a potentially empty comma-separated list of expressions enclosed between brackets (`[`) (e.g. `[]`, `[var1]`, `[1, 2, 3]`)
- Null literals are represented by the `null` keyword

Note: String and rune delimiters terminate their respective literals unless escaped.

#### Escape sequences

In `string` and `rune` literals, the following sequences may be escaped with a backslash (`\`):

- `\\` represents a backslash (`\`)
- `\"` represents a quote (`"`)
- `\'` represents an apostrophe (`'`)
- `\n` represents a newline
- `\r` represents a carriage return
- `\t` represents a horizontal tab
- `\O` represents the arbitrary octal value `O`
  - `O` must be one (1) or more octal digits
- `\xH` represents the arbitrary hexadecimal value `H`
  - `H` must be one (1) or more hexadecimal digits
- `\u{...}` represents a Unicode code point using one or more hexadecimal digits
  - The value must be a valid Unicode scalar value

#### Null

`null` is a polymorphic null value that can be implicitly converted to any nullable type.

Notes:
- Currently, pointers are the only nullable types.
- `null` cannot be assigned to a reference.

### Identifiers

- Identifiers must start with an ASCII letter (`a-zA-Z`) and can contain any combination of ASCII letters, numbers and underscores (`_`)
- Reserved keywords (e.g. `type`, `alias`, `const`, etc...) are not considered identifiers
- An identifier may only exist once in its current scope

Ex:
```
x
foo
my_variable
```

### Unary operators

- `++x`: Prefix increment
- `x++`: Postfix increment
- `--x`: Prefix decrement
- `x--`: Postfix decrement
- `-x`: Negative
- `!x`: Logical not
- `~x`: Bitwise not
- `@x`: Address-of
- `move x`: Move

### Binary operators

#### Arithmetic

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulo

#### Comparison

- `==`: Equality
- `!=`: Inequality
- `<`: Less
- `<=`: Less or equal
- `>`: Greater
- `>=`: Greater or equal

#### Logical

- `&&`: Logical AND
- `||`: Logical OR

#### Bitwise

- `&`: Bitwise AND
- `|`: Bitwise OR
- `^`: Bitwise XOR
- `<<`: Bitwise LSHIFT
- `>>`: Bitwise RSHIFT

#### Assignment

- `=`: Assign/Initialize
- `+=`: Add assign
- `-=`: Subtract assign
- `*=`: Multiply assign
- `/=`: Divide assign
- `%=`: Mod assign
- `&=`: AND assign
- `|=`: OR assign
- `^=`: XOR assign
- `<<=`: LSHIFT assign
- `>>=`: RSHIFT assign

Notes:
- Assignments return a reference to the updated value
- If a value was not previously declared, it may only be initialized
- Multiple initializations may be chained

Ex:
```
x = 5       // Initializes x with value 5
y = z = 3   // Initializes z with value 3 and y as a reference to z
a : i32 = x += 2  // Assigns x + 2 to x and initializes a with the resulting value (7 in this case)
```

### Function calls

To call a function, write the name of the function followed by the comma separated list of arguments between parenthesis.
If the function has no parameters, the function name must be followed by empty parenthesis

Ex:
```
func1(arg1, arg2)
func2()
```

### Indexing

- To access the elements of an array, write the name of the array followed by the index between brackets (`[]`)
- The index must be an integer value
- The index may be any valid expression resulting in a single integer
- Indexing returns a reference to the indexed element
  - String indexing is a special case and produces a byte value rather than a reference
- Indexing a constant array returns an immutable reference
- Indexing is bound checked by default. If the index is out of range, the program panics

Ex:
```
const const_array = [1, 2, 3]
array[i] = const_array[0]
const ref : i32& = const_array[0]
// const_array[0] = array[0]        // This line would fail at compile time
// ref : i32& = const_array[0]      // This line would fail at compile time
```

Note: Strings behave like byte arrays - `string` indexing operates on UTF-8 bytes rather than Unicode code points. This means indexing a `string` returns a `byte`

### Member access

To access members of an object, use the object's identifier followed by a dot (`.`) and the member's identifier

Ex:
```
object.member
```

Note: `object` may be any expression resulting in a single object (e.g. `array[0].member`, `func().member`)

### Parenthesized expressions

An expression may be enclosed in parentheses (`(` and `)`) to explicitly control its grouping and override the default expression precedence.

The expression inside the parentheses is parsed as a single expression before being used by the surrounding expression.

Ex:
```
a * (b + c)
```

### Expression precedence

Expressions are parsed according to the following precedence rules, from highest to lowest:

- postfix
- unary
- `*` `/` `%`
- `+` `-`

- `<<` `>>`
- `<` `<=` `>` `>=`
- `==` `!=`

- `&`
- `^`
- `|`

- `&&`
- `||`

- assignment

Notes:
- Expressions with equivalent precedence are left-associative, with the sole exception of assignment expressions, which are right-associative.
- Function calls, indexing, member access and other postfix expressions have the highest precedence.
- Parenthesized expressions override the normal precedence rules by explicitly defining the grouping of an expression.

## Statements

### Variable declaration

See `Variables` section

### Expression statement

An expression statement consists of an expression

Ex:
```
x = (a + b) * 11
```

### if

The `if` statement conditionally executes a block of statements based on the value of its condition.

The condition must evaluate to a `bool`.

An `if` statement may optionally contain one or more `else if` branches and a single `else` branch.

Branches are evaluated in order. The first branch whose condition evaluates to `true` is executed. If no condition evaluates to `true`, the `else` branch is executed if one is present.

Only one branch of an `if` statement is executed.

Ex:
```
if condition
    ...
else if other_condition
    ...
else
    ...
end
```

### while

The `while` statement repeatedly executes a block of statements while its condition evaluates to `true`.

The condition must evaluate to a `bool`.

The condition is evaluated before each iteration. If the condition evaluates to `false`, the loop terminates without executing its body.

Ex:
```
while condition
    ...
end
```

### repeat

The `repeat` statement repeatedly executes a block of statements until its condition evaluates to `true`.

The condition must evaluate to a `bool`.

The condition is evaluated after each iteration, meaning the body is always executed at least once.

Ex:
```
repeat
    ...
until condition end
```

### for

The `for` statement iterates over a range or an array.

When iterating over a range, the loop variable receives each value produced by the range.

Ex:
```
for i in first..last
    ...
end
```

When iterating over an array without a reference modifier, the loop variable receives a copy of each element.

```
for value in array
    ...
end
```

When iterating over an array with the reference modifier (`&`), the loop variable refers directly to each element of the array. In this context, the loop variable is of reference type `T&` where `T` is the type of the elements of the array

Ex:
```
for value& in array
    ...
end
```

The loop variable is scoped to the `for` statement and is not accessible after the loop.

A reference obtained through `value&` does not extend the lifetime of the underlying array or its elements.

Ex:
```
array : u8[] = [1, 2, 3]

for value in array
    value++
end

// array is still [1, 2, 3]

for value& in array
    value++
end

// array is now [2, 3, 4]
```

### Range

- Use the `..` operator to create a range
- Range bounds must be integer values
- If `first` is less than `last`, the value increments by 1
- If `first` is greater than `last`, the value decrements by 1
- If `first` is equal to `last`, no iteration occurs
- If the bounds of the range have different types, implicit casting rules apply. If no implicit cast is possible, the expression is considered ill-formed and one of the values must be explicitly cast
  - If an implicit cast is made, the iteration value in a `for` loop is of the resulting common type

Ex:
```
0..10   // 0, 1, ..., 9
10..0   // 10, 9, ..., 1
10..10  // empty range
```

Notes:
- A range is a special expression used for iteration or array construction and does not produce a first-class value. As such, it may only be used in for or in array literals
- The `..` token is recognized before the `.` token.

Ex:
```
x = [0..10] // Valid

for i in 0..10 // valid
    ...
end

x = 0..10 // Invalid
x += 0..10 // Invalid
```

### switch

The `switch` statement compares a value against a sequence of `case` values and executes the block associated with the first matching case.

A `case` value must be compatible with the type of the value being switched on.

`case` expressions are evaluated in source order until a matching `case` is found.

If no `case` matches, the `default` block is executed if one is present.

If neither a `case` nor a `default` branch matches, the `switch` statement exits without executing a block.

Cases do not implicitly fall through to the following `case`. The `fallthrough` statement must be used explicitly to continue execution into the next case.

Ex:
```
switch value
    case 1
        ...
    case 2
        ...
    default
        ...
end
```

Notes:
- At least one `case` or `default` branch must be defined in each `switch` statement
- At most one `default` branch may exist in a single `switch` statement
- The `default` branch, when present, must be the final branch of the `switch`

### Function declaration

Function declarations start with the `fn` keyword followed by the function's name, an optional parameter list, an optional return type, the function's body, and the `end` keyword.

Function parameters follow the same syntax as variable declaration.

Ex:
```
fn add(a : i32, const b : i32) : i32
    return a + b
end
```

If a default value is specified for a parameter, the argument may be omitted when calling the function

If a parameter's type is omitted, its type is inferred from its default value

Setting a default value for a parameter is only valid if it is the last or if all following parameters also have default values

Ex:
```
fn foo(a : u8, optional = false)
    ...
end

foo(16) // equivalent to `foo(16, false)`
```

The default argument expression is evaluated at the call site when the argument is omitted

The default value of a parameter may use previous parameters

Ex:
```
fn bar(x : u8, y = x + 1)
    ...
end

bar(5)      // `x + 1` is evaluated here as `5 + 1` so `6`
bar(8, 12)  // `x + 1` is NOT evaluated in this case
```

#### Shortcuts

The return type and `return` keyword of void functions, the parentheses of functions with no parameters can be omitted from the declaration.

Line breaks may be omitted when doing so does not change the statement boundaries.

Ex:
```
fn noop() : void
    return
end
```

is equivalent to

```
fn noop end
```

A semicolon (`;`) can optionally be added at the end of an expression to collapse multiple statements in the same line.

Ex:
```
a = 1
a++
```

is equivalent to

```
a = 1; a++
```

A backslash (\) can be used to split a line without breaking the expression

Ex:
```
fn noop() \
    : void
end
```

### return

- Exits the current function
- Invalid if called from outside a function

Ex:
```
fn noop()
    return
end
```

### break

- The `break` statement exits the innermost loop or switch
- Invalid in all other contexts

Ex:
```
while condition
    if other_condition
        break // Exits the loop
    end

    ...
end


for i in 0..10
    switch value
        case 1
            break // exits the switch
    end

    ...
end
```

### fallthrough

`fallthrough` explicitly joins the current switch case to the next defined case

`fallthrough` transfers control, but does not make the lexical variables of the previous case visible in the next case

The current case scope is exited before control is transferred to the next case. Deferred calls and destruction for that scope therefore occur before the next case begins

`fallthrough` must be the last instruction in a switch case

Notes:
- Invalid if not in a switch case
- Invalid in the default case
  - This only applies if falling through FROM `default`, not if another `case` falls through TO `default`

Ex:
```
switch value
    case 1
        fallthrough // case 1 also executes case 2
    case 2
        ...
end
```

### continue

- Skips one iteration of the current loop
- Invalid if not in a loop

Ex:
```
while condition
    if other_condition
        continue
    end

    ...
end
```

### scope

Functions, loops, conditionals and other block constructs create a scope.

A scope is a black box whose content is only visible from the scope itself and its nested scopes.

A standalone scope can be created with the `scope` keyword.

```
scope
    a = 7

    scope
        b = a
    end

    // b doesn't exist here
end

// a doesn't exist here
```

Notes:
- Each branch (i.e. `else` and `else if` block) of an `if` statement constitutes its own scope
- Each case in a `switch` statement also constitutes its own scope

### Deferred execution

Use the `defer` keyword before a function call for it to be executed when exiting the current scope.

Notes:
- `defer` is stack based. This means if multiple deferred function calls are made, they are executed in last-in-first-out order
- Deferred function calls are executed before local values are destroyed as deferred calls may access values whose lifetime belongs to the current scope
- The function and all arguments of a deferred call are evaluated immediately; only the invocation itself is deferred.

```
scope
    defer shutdown()

    if condition
        x = 5
        defer pre_shutdown(x)
        x = 6

        // ...

        // pre_shutdown(5) is called here
        // shutdown() is called here
        return
    end

    // ...

    // shutdown() is called here
end
```

### Statement boundaries

- A statement is terminated by a newline or semicolon (`;`)
- The end keyword terminates the current block and implicitly terminates the final statement within that block.
- A newline can be escaped with a backslash (`\`)

Ex:
```
fn noop() \
    : void
end
```

is parsed as

```
fn noop() : void
end
```

## Memory model

### Object representation

Every value has an object representation consisting of a sequence of bytes.

The size of an object's representation is the number of bytes occupied by that representation.

The size of an object's representation may be accessed using the `sizeof` keyword (e.g. `sizeof(x)` or `sizeof(i32)`)

For fixed-size types, the size of the object representation is known at compile time.

The storage location of a value is not part of its type. Values of the same type may reside in automatic, static, or dynamically allocated storage.

The object representation of a fixed array consists of the object representations of its elements in order, with no padding between consecutive elements.

Dynamic arrays store their elements in separate element storage as described in the Arrays section.

Custom types may contain padding between members or after the final member.

The compiler determines the layout and amount of padding of custom types according to the alignment requirements of their members.

### Alignment

Every type has an alignment requirement.

An object's address must satisfy the alignment requirement of its type.

Dynamically allocated storage is suitably aligned for any type that can be validly represented within that storage.

Representation casts must produce storage that satisfies the alignment requirements of the target type.

If a representation cast would produce an object with an invalid alignment, the program is ill-formed if this can be determined at compile time. Otherwise, the program panics at runtime.

### Representation casts

A representation cast does not perform a value conversion or modify the represented byte sequence. It interprets that byte sequence according to the target type.

A representation cast may change the size of the elements in a storage region as long as the entire target fits within the storage region represented by the source, subject to the specialized rules below.

For collections, the length and capacity are expressed in units of the target element type.

The used element storage must exactly represent a whole number of target elements.

Any additional capacity that cannot represent a complete target element is excluded from the resulting capacity.

Representation casts do not perform numeric conversion, initialization, or validation of the represented contents.

Representation casts use the native object representation of the target platform. Their resulting numeric value may therefore be platform-dependent.

The validity of the contents according to the semantic rules of the target type is not checked by a representation cast. For example, a representation cast from `u32*` to `rune*` does not verify that the resulting represented value is a valid Unicode scalar value.

Representation casts are only valid for byte-compatible types.

A target type is byte-compatible with a represented storage region if its representation fits within that region and the storage satisfies its alignment requirement.

For arrays and slices, byte compatibility is determined using the target element type and the represented element storage.

For pointers, byte compatibility is determined using the target pointed-to type and the storage accessed through the pointer.

Representation casts are only valid for pointers, arrays and slices. Performing a representation cast on a reference is ill-formed.

Casts between scalar numeric types follow the value-conversion rules described in the `Casting` section. They are not representation casts.

A representation cast between pointer types preserves the represented address.

Access through the resulting pointer is only valid if sufficient storage exists at that address for the target type and the storage satisfies the target type's alignment requirement.

If insufficient storage can be proven at compile time, the program is ill-formed. Otherwise, accessing storage beyond the valid represented region is undefined behavior.

`void*` is treated as a polymorphic pointer type; casting a `void*` to or from any pointer type is permitted.

Notes:
- When a collection is representation-cast to a type with a different element size, its length and capacity are expressed in units of the target element type.
- Array representation casts must preserve the complete used element storage.
- Slice representation casts may exclude incomplete trailing storage from the resulting view.
- Representation casting does not extend the lifetime of the underlying storage.

### Value lifetime

By default, a value's lifetime is linked to its scope, meaning it gets destroyed when exiting said scope unless ownership has been explicitly transferred elsewhere.

Notes:
- A reference or pointer does not extend the lifetime of the underlying object
- Accessing a referenced or pointed-to value after its lifetime ends is ill-formed if statically provable by the compiler or UB otherwise
- A slice does not extend the lifetime of the collection it references
- Accessing the content of a slice after the lifetime of its underlying collection has ended is undefined behavior
- Destruction is performed in reverse order of initialization
- Destruction happens after all deferred function calls for the active scope have been processed

Ex:
```
fn getValue() : i32&
    value : i32 = 42
    return value    // This would fail at compile time - `value` is destroyed when exiting the function's scope
end
```

### Fixed values

A value is fixed when all data owned directly by the value is contained within its object representation and the size of that representation is known at compile time.

Fixed values do not require separately allocated storage by default.

A type is fixed if it fits one of these categories:
- built-in scalar types
- pointers and references
- fixed arrays whose element type is fixed
- custom types composed entirely of fixed types

Dynamic arrays and non-literal strings are not fixed because they may own separately allocated storage whose size is determined at runtime.

Notes:
- The compiler is free to place fixed-size values in registers, stack storage or globals depending on the context
- A fixed value normally has a scope-bound lifetime. Copying it creates a distinct value with its own lifetime, while moving it transfers the value according to the move semantics defined in the `Memory Model` section

### Dynamic allocation

Use the `make` keyword to dynamically allocate storage for a value of the specified type.

Notes:
- The resulting value owns the dynamically allocated storage
- The allocated value retains the specified type regardless of whether that type is fixed or dynamic
- Dynamically allocated storage follows the alignment rules defined in the `Alignment` section
- The resulting value is subject to the same ownership and lifetime rules as other owned values

Ex:
```
x : MyType = make MyType()
y : MyType& = x // y now refers to x
z : MyType* = @x // z now points to the memory address of x
```

### Move semantics

Use the `move` keyword to transfer ownership of a value.

Moving a value transfers the value and, when applicable, its ownership to the destination.

Moving a value invalidates pointers, references, and slices referring to storage owned directly by the moved value. This invalidation occurs regardless of whether the implementation reuses the original storage or physically relocates the value.

Access through an invalidated pointer, reference, or slice is undefined behavior unless the invalid access can be proven statically, in which case the program is ill-formed.

A move does not guarantee that the value retains the same storage address. The implementation may transfer ownership of the existing storage when possible or relocate the value into storage suitable for the destination.

Relocation preserves the value being moved. Any aliases to storage owned directly by the source value are invalidated by the move regardless of whether relocation actually occurs.

After a value has been moved, the source variable is considered moved-from and cannot be read, moved, or otherwise used until a new value is assigned to it.

Assigning a new value to a moved-from variable makes the variable valid again.

Returning an owned local value transfers its ownership to the caller. This is equivalent to moving the value into the return value.

Moving a `const` value is invalid.

Ex:
```
a = make MyType()
const b = move a

// a is moved-from
// b owns the value previously owned by a

// c = move b // This line would fail at compile time

a = make MyType()

// a is valid again
```

### Copy semantics

By default, assignment and argument passing creates a copy of the source value.

Copying a value performs the copy operation defined for its type:
- For custom types, each member is copied according to its own type's copy semantics
- Pointers and references are copied without copying the objects to which they refer
- Copying an array copies its elements into independent storage

Ex:
```
a = value
b = a // b is copied according to the copy semantics of its type
```

Note: `make` controls storage allocation, not whether the allocated type is fixed or dynamic

Ex:
```
a : u8[4] = [1, 2, 3, 4]
b : u8[] = make byte[4]

c = a // Creates an independent fixed array with the same content as a
d = b // Creates an independent dynamic array with the same content as b

fn func(x : u8[])
    ...
end

func(a) // Creates an independent dynamic array with the same content as a

fn func(x : u8[]&)
    ...
end

func(a) // Passes a reference to a
```

### Custom type layout

Members of a custom type are laid out in declaration order.

The compiler may insert padding between members to satisfy their alignment requirements.

The compiler may also insert trailing padding after the final member so that the size of the custom type satisfies its alignment requirement.

The size of a custom type is therefore not necessarily equal to the sum of the sizes of its members.

The alignment requirement of a custom type is at least as strict as the strictest alignment requirement of its members.

Ex:
```
type Example
    a : u8
    b : u32
end
```

The compiler may insert padding between `a` and `b` so that `b` is correctly aligned.

Custom type layout is implementation-defined except for the ordering and alignment requirements specified above.

## TODO: Error handling

### TODO: Assertions/Panic

## TODO: Module system