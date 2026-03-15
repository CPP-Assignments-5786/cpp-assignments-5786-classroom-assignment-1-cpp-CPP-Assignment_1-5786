# Assignment Descriptions — CPP-Assignments-5786

> Brief description of each assignment repository, what it covers, and which C++ subjects it teaches.

---

## Assignment 1 — Basic C++ Fundamentals
**Repo**: `CPP-Assignment_1-5786`

**Description**: Students implement geometric shapes (Point and Circle structs) and utility functions. This is an introductory assignment that establishes fundamental C++ concepts by having students work with simple data structures and free functions in separated header/source files.

**What students implement**: `Point.cpp`, `Circle.cpp`, `Utilities.cpp`

**C++ subjects covered**:
- Namespaces (`Geometry`, `Utils`)
- Structs
- Free functions (non-member functions operating on structs)
- Header/source file separation (`.hpp` / `.cpp`)
- I/O streams (`cout`)
- Arrays and passing arrays to functions
- Standard library (`cmath`)
- Unit testing with doctest

---

## Assignment 2 — Classes, Constructors and Destructors
**Repo**: `CPP_Assignment_2_5786`

**Description**: Students build a music library management system with three classes: Song, Playlist, and MusicLibrary. The assignment introduces object-oriented programming fundamentals — defining classes with private data, constructors (default, parameterized, copy), destructors, and managing dynamic memory with `new`/`delete`.

**What students implement**: `Song.cpp`, `Playlist.cpp`, `MusicLibrary.cpp`

**C++ subjects covered**:
- Classes with encapsulation (private members, public interface)
- Constructors: default, parameterized, copy constructor
- Destructors and resource cleanup
- Dynamic memory allocation (`new`/`delete`, dynamic arrays)
- Static members (object counting, statistics)
- Deep copy semantics
- Inline getters
- `std::string`, `int`, `bool` data types
- Namespace (`music`)

---

## Assignment 3 — Composition, References and Friend Functions
**Repo**: `CPP_assignment_3_5786`

**Description**: Students implement a library management system with Book and LibraryCard classes. The Book class contains an Author object (composition), while LibraryCard manages a dynamic array of Book pointers. This assignment deepens understanding of object relationships, reference semantics, and friend functions.

**What students implement**: `Book.cpp`, `LibraryCard.cpp`

**C++ subjects covered**:
- Composition (object containing another object — Book has-a Author)
- Dynamic arrays of pointers (`Book**`) with manual resize
- Deep copy (copy constructor with dynamic memory)
- Destructors with `delete[]` for array cleanup
- Reference parameters (`const&`) and reference return
- `const` methods
- Friend functions (cross-object comparison)
- Function overloading
- Inline vs outline method implementation
- Static members (counters)

---

## Assignment 4 — Operator Overloading
**Repo**: `CPP_assignment_4_5786`

**Description**: Students implement a grade management system with Grade and Student classes, focusing heavily on operator overloading. The Grade class demonstrates arithmetic, comparison, increment/decrement, stream output, and explicit conversion operators. The Student class adds bracket (`[]`), parentheses (`()`), and more arithmetic operators.

**What students implement**: `Grade.cpp`, `Student.cpp`

**C++ subjects covered**:
- Arithmetic operator overloading (`+`, `-`, `*`, `/`, `+=`, `-=`, `*=`)
- Comparison operators (`==`, `!=`, `<`, `>`, `<=`, `>=`)
- Prefix and postfix increment/decrement (`++`, `--`)
- Stream output operator (`<<`)
- Explicit conversion operators (`explicit operator int()`, `explicit operator double()`, `explicit operator std::string()`)
- Bracket operator (`[]`) — access by index and by string key
- Parentheses operator (`()`) — function-call syntax with multiple overloads
- Friend functions and non-member operators
- Rule of Three (copy constructor, copy assignment, destructor)
- Dynamic arrays with resize

---

## Assignment 5 — Deep Copy and Explicit Conversion Operators
**Repo**: `CPP_assignment_5_5786`

**Description**: Students implement a complex number system with Complex and ComplexArray classes. The Complex class has full arithmetic support plus explicit conversion operators (to double, bool, and string). The ComplexArray class manages a dynamic array of Complex objects, emphasizing deep copy as the critical concept — students must implement correct copy constructor, assignment operator, and destructor.

**What students implement**: `Complex.cpp`, `ComplexArray.cpp`

**C++ subjects covered**:
- Deep copy pattern: copy constructor, `operator=`, destructor (Rule of Three)
- Explicit conversion operators (`explicit operator double()`, `explicit operator bool()`, `explicit operator std::string()`)
- Complex number arithmetic (`+`, `-`, `*`, `/` between Complex objects and scalars)
- Compound assignment operators (`+=`, `-=`, `*=`)
- Prefix increment/decrement
- Comparison operators (by value and by magnitude)
- Unary negation (`-`)
- Stream output (`<<`)
- Dynamic array management (`new[]`/`delete[]`)
- Self-assignment check in `operator=`
- Static members for object tracking
- Friend functions (`distance`, reverse-order `operator+`)
- `fromPolar` static factory method

---

## Assignment 6 — Inheritance and Pure Virtual Functions
**Repo**: `CPP_assignment_6_5786`

**Description**: Students implement a zoo management system built on a class hierarchy. Animal is an abstract base class with pure virtual functions; Mammal, Bird, and Reptile are concrete derived classes. A Zoo class manages a polymorphic collection of animals. The assignment demonstrates constructor/destructor ordering in inheritance and polymorphic behavior.

**What students implement**: `Animal.cpp`, `Mammal.cpp`, `Bird.cpp`, `Reptile.cpp`, `Zoo.cpp`

**C++ subjects covered**:
- Inheritance (single inheritance hierarchy)
- Abstract base class with pure virtual functions (`= 0`)
- Virtual destructor (required for polymorphic deletion)
- Constructor/destructor call order in inheritance chains
- Polymorphism (base class pointers, virtual dispatch)
- Dynamic allocation with polymorphic objects
- `override` keyword
- Namespaces (`zoo`)
- Exception handling (`std::invalid_argument`)

---

## Assignment 7 — RTTI, Stream Manipulation and Type Casting
**Repo**: `CPP_assignment_7_5786`

**Description**: Students implement an image processing system with RGB and Grayscale image types. The assignment covers runtime type identification (RTTI), C++ casting operators, stream manipulators for formatted output, and stream redirection (writing to cout, files, or string streams). An ImageProcessor class uses `dynamic_cast` and `typeid` to handle different image types at runtime.

**What students implement**: `Pixel.cpp`, `Image.cpp`, `GrayscaleImage.cpp`, `RGBImage.cpp`, `ImageProcessor.cpp`

**C++ subjects covered**:
- RTTI: `typeid` and `dynamic_cast` for runtime type identification
- C++ casting: `static_cast`, `dynamic_cast`, `reinterpret_cast`
- Stream manipulators: `std::fixed`, `std::setprecision`, `std::setw`, `std::left`, `std::right`
- Stream redirection: writing to `std::ostream&` (cout, ofstream, ostringstream)
- `std::ostringstream` for building strings from stream output
- File I/O with `std::ofstream`
- Inheritance hierarchy (Image → GrayscaleImage, RGBImage)
- Polymorphism with virtual functions
- Exception handling (`invalid_argument`, `out_of_range`, `runtime_error`)
- Pixel structs with raw byte manipulation

---

## Assignment 8 — Templates, Iterators and Generic Programming
**Repo**: `CPP_assignment_8_5786`

**Description**: Students implement generic container data structures — a base Container, a Stack, and a Queue — all as class templates. They also implement a custom Iterator class and free template algorithm functions (find, count, transform, etc.). All implementation is in header files since templates require visible definitions at instantiation.

**What students implement** (all in `.hpp` files): `Container.hpp`, `Stack.hpp`, `Queue.hpp`, `Algorithms.hpp`

**C++ subjects covered**:
- Class templates (`template<typename T>`)
- Function templates (generic free functions)
- Custom iterators with `begin()` and `end()` (enabling range-based for loops)
- Iterator operators: `*` (dereference), `++` (prefix), `!=` (comparison)
- Template code in headers (why templates can't be in `.cpp` files)
- Dynamic arrays within template classes
- Exception handling (`std::out_of_range`, `std::underflow_error`)
- Namespace (`containers`)

---

## Assignment 9 — Template Specializations and Metaprogramming
**Repo**: `CPP_assignment_9_5786`

**Description**: Students work with advanced template features: full and partial specializations, compile-time metaprogramming, `decltype`, and `constexpr`. The highlight is a symbolic derivative engine that computes derivatives at compile time using template type aliases. Other parts include type-info specializations, custom swap specializations, a Formatter class with type-specific behavior, and physics unit conversions.

**What students implement** (all in `.hpp` files): `TypeInfo.hpp`, `MySwap.hpp`, `Formatter.hpp`, `Derivative.hpp`, `PhysicsUnits.hpp`, `DecltypeUtils.hpp`

**C++ subjects covered**:
- Full template specialization (`template<> struct Foo<int>`)
- Partial template specialization (e.g., for pointer types `T*`)
- Template metaprogramming: type aliases (`using type = ...`), compile-time computation
- Symbolic derivatives as types: `Const<N>`, `Var`, `Add<L,R>`, `Mul<L,R>`, `Power<E,N>`
- Derivative rules (constant, variable, sum, product) as template specializations
- `constexpr` functions for compile-time evaluation
- `decltype` for automatic type deduction
- `static_assert` for compile-time checks
- Physics unit conversions at compile time

---

## Assignment 10 — STL Containers, Tuples and Type Traits
**Repo**: `CPP_assignment_10_5786`

**Description**: Students use STL containers to build a student/course registration system and solve programming riddles. The assignment covers vectors, maps, sets, tuples, string processing, and compile-time type traits. The "Riddles" component includes classic algorithmic problems (two-sum, anagrams, longest consecutive sequence) solved with STL containers.

**What students implement**: `StudentRecord.cpp`, `CourseManager.cpp`, `StringUtils.cpp`, `Riddles.cpp`, and edit `TypeTraitsUtils.hpp`

**C++ subjects covered**:
- `std::vector` — dynamic arrays with `push_back`, iterators
- `std::map` — sorted key-value mapping
- `std::set` — unique sorted elements
- `std::tuple` / `std::tie` / `std::get` — heterogeneous fixed-size collections
- `std::string` — string operations and processing
- `std::type_traits` — `is_integral`, `is_floating_point`, `is_same` (compile-time type checking)
- Range-based for loops
- `static_cast` for sign-conversion safety with `-Wsign-conversion`

---

## Assignment 11 — STL Algorithms
**Repo**: `CPP_assignment_11_5786`

**Description**: Students use STL algorithms (from `<algorithm>` and `<numeric>`) to implement data processing, text analysis, set operations, and algorithm showcases. The key constraint is that students must use STL algorithms — not manual loops — for all operations. This covers the full breadth of STL algorithm categories.

**What students implement**: `DataProcessor.cpp`, `TextAnalyzer.cpp`, `SetOperations.cpp`, `AlgorithmShowcase.cpp`

**C++ subjects covered**:
- Query algorithms: `find`, `find_if`, `count`, `count_if`, `all_of`, `any_of`, `none_of`
- Transformation: `for_each`, `transform`
- Copy/move: `copy`, `copy_if`, `move`, `replace`, `replace_if`, `fill`, `generate`
- Sorting: `sort`, `stable_sort`, `partial_sort`, `nth_element`
- Structure modifiers: `remove`, `remove_if`, `unique`, `reverse`, `rotate`, `partition`, `stable_partition`
- Set algorithms: `set_union`, `set_intersection`, `set_difference`, `set_symmetric_difference`, `merge`, `includes`
- Numeric: `accumulate`, `inner_product`, `partial_sum`, `iota`
- Permutations: `next_permutation`, `prev_permutation`
- Erase-remove idiom
- IO iterators: `ostream_iterator`, `istream_iterator`
- `back_inserter` for output

---

## Assignment 12 — Smart Pointers and Move Semantics
**Repo**: `CPP_assignment_12_5786`

**Description**: Students implement a game engine entity system using modern C++ memory management. This capstone assignment covers smart pointers (`unique_ptr`, `shared_ptr`, `weak_ptr`), move semantics (move constructor, move assignment), and rvalue references. A key constraint is that raw `new`/`delete` is forbidden — only `make_unique` and `make_shared` are allowed.

**What students implement**: `Entity.cpp`, `Resource.cpp`, `Scene.cpp`, `Playground.cpp`, and parts of `SmartStack.hpp`

**C++ subjects covered**:
- `std::unique_ptr` — exclusive ownership, `std::make_unique`, transfer with `std::move`
- `std::shared_ptr` — shared ownership, `std::make_shared`, `use_count()`
- `std::weak_ptr` — non-owning references, `lock()`, `expired()`
- Move constructor (`Entity(Entity&& other) noexcept`)
- Move assignment operator (`Entity& operator=(Entity&& other) noexcept`)
- `std::move` — casting lvalue to rvalue
- Rvalue references (`&&`)
- `noexcept` specification on move operations
- Linked-list stack with `unique_ptr` (no raw pointers)
- No raw `new`/`delete` — `make_unique`/`make_shared` only

---

## Summary Table

| # | Topic | Key C++ Subjects | Difficulty |
|---|-------|-----------------|------------|
| 1 | Basic C++ (Structs, Namespaces) | Structs, namespaces, free functions, header/source separation | ⭐ Easy |
| 2 | Classes, Constructors, Destructors | Classes, constructors, destructors, dynamic memory, static members | ⭐⭐ Easy-Med |
| 3 | Composition, References, Friends | Composition, dynamic arrays, deep copy, friend functions, references | ⭐⭐ Easy-Med |
| 4 | Operator Overloading | Arithmetic/comparison/conversion operators, `[]`, `()`, explicit casts | ⭐⭐⭐ Med-Hard |
| 5 | Deep Copy, Conversion Operators | Rule of Three, explicit conversions, complex arithmetic, dynamic arrays | ⭐⭐⭐ Med-Hard |
| 6 | Inheritance, Virtual Functions | Abstract classes, pure virtuals, virtual destructor, polymorphism | ⭐⭐⭐ Medium |
| 7 | RTTI, Streams, Type Casting | `typeid`, `dynamic_cast`, `static_cast`, `reinterpret_cast`, manipulators | ⭐⭐⭐ Med-Hard |
| 8 | Templates, Iterators | Class/function templates, custom iterators, generic containers | ⭐⭐⭐ Med-Hard |
| 9 | Specializations, Metaprogramming | Full/partial specialization, compile-time derivatives, `constexpr`, `decltype` | ⭐⭐⭐⭐ Hard |
| 10 | STL Containers, Type Traits | `vector`, `map`, `set`, `tuple`, `string`, `type_traits` | ⭐⭐⭐ Medium |
| 11 | STL Algorithms | `<algorithm>`, `<numeric>`, set algorithms, erase-remove, IO iterators | ⭐⭐⭐ Medium |
| 12 | Smart Pointers, Move Semantics | `unique_ptr`, `shared_ptr`, `weak_ptr`, move constructor/assignment, `noexcept` | ⭐⭐⭐⭐ Hard |
