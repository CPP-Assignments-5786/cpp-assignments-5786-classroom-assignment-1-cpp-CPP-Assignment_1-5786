# Review Notes: CPP-Assignments-5786 Organization — All 12 Assignments (Second Review)

> **Review date**: 2026-03-03 (second pass — after instructor modifications to assignments 2, 3, 4, 5, 7, 9)
>
> **Reviewer context**: Reviewing as if I were a second-year student (second semester) in an "Advanced C++ Programming" course at Ariel University. Evaluating structure, clarity, ambiguity, difficulty, and overall quality.

---

## Changes Made Since First Review — Summary

The instructor modified **6 assignments** (2, 3, 4, 5, 7, 9) based on the first review. Here is what changed:

| Assignment | Key Changes |
|-----------|------------|
| **2** | ✅ `.idea` directory removed; `.gitignore`+`.gitattributes` added; README rewritten with full file descriptions; Makefile updated to C++23 |
| **3** | ✅ Makefile updated from C++17 to C++23 (standardized) |
| **4** | ✅ Conversion operators made `explicit`; `operator>>` removed from both classes; `Student::operator-` removed; output format clarified (2 decimal places); weighted avg formula explained with general formula |
| **5** | ✅ **Massively reduced scope**: Complex lost ~15 methods (phase, isImaginary, epsilon, postfix ops, division/subtraction variants, input stream, multiple friends); ComplexArray lost ~12 methods (insert, min, vectorMagnitude, parentheses, subtraction, division, reverse, print, friends); conversion operators made `explicit` |
| **7** | ✅ **Massive README improvement**: Detailed format tables for pixel strings, Image::printInfo, getSummary, generateReport, printComparisonTable with exact `setw` values; brightness formula; exceptions table; reinterpret_cast usage table; stream redirection explanation |
| **9** | ✅ `Derive<Power<E,N>>` (chain rule) removed; explanatory "HOW IT WORKS" block added to Derivative.hpp; hint comments added; placeholder implementations provided; Derivative table added to README |

---

## Cross-Cutting Observations (All Assignments)

### ✅ Strengths (Across All Assignments)
- **Consistent structure**: Every repo has README.md, `.hpp` header files, `main.cpp` with expected output, `test.cpp` with unit tests, `doctest.h`, and a `Makefile`.
- **Academic integrity section**: All READMEs include a clear academic integrity policy (Hebrew), with a specific note about AI usage requiring disclosure of prompts and responses.
- **Tests provided**: Students can verify their implementation with `make test`. Excellent for self-guided learning.
- **Expected output in main.cpp**: Every `main.cpp` includes comments with expected output.
- **Progressive difficulty**: The assignments build logically from basic C++ (structs, namespaces) to advanced topics (smart pointers, move semantics).
- **Makefile provided**: All repos have working Makefiles with `make`, `make test`, and `make clean` targets.
- **C++ standard now consistent**: All assignments now use `-std=c++23` ✅ (previously repos 2-3 used C++17).
- **doctest library**: Consistent use of doctest across all assignments for unit testing.
- **`.gitignore` files**: All modified repos now have `.gitignore` files. `.idea` directory removed from repo 2.

### ⚠️ Remaining Cross-Cutting Issues

1. **Inconsistent repo naming convention** (unchanged, cosmetic):
   - Repo 1: `CPP-Assignment_1-5786` (hyphens, mixed separators)
   - Repo 2: `CPP_Assignment_2_5786` (underscores, capital "A")
   - Repos 3–12: `CPP_assignment_x_5786` (underscores, lowercase "a")
   - **Impact**: Cosmetic. Not a pedagogical issue, but looks inconsistent.

2. **Inconsistent compiler flags** (minor):
   - Assignment 4: `-std=c++23 -Werror -Wsign-conversion -Wall -Wextra` (adds `-Wall -Wextra`)
   - All others: `-std=c++23 -Werror -Wsign-conversion`
   - **Impact**: Assignment 4 is stricter. Students whose code compiles elsewhere may get warnings-as-errors on assignment 4. Not necessarily bad (teaches stricter coding) but worth being aware of.

3. **C++23 requirement**: All assignments now use C++23 consistently. Worth verifying that all student machines/environments support this (requires g++ 13+ or clang 17+). If not, C++17 would be safer.

---

## Per-Assignment Detailed Review

---

### Assignment 1 — Basic C++ (Structs, Namespaces, Free Functions)
**Repo**: `CPP-Assignment_1-5786`

**Topic**: Point/Circle structs, distance calculation, finding closest point, calculating averages.

**Files students create**: `Point.cpp`, `Circle.cpp`, `Utilities.cpp`

#### ✅ Strengths
- Very clear and simple — perfect introductory assignment.
- README lists all C++ features to demonstrate.
- `.hpp` files have clear function signatures with documentation.
- Functions are simple (distance formula, area of circle, average of array).
- `test.cpp` covers edge cases.

#### ⚠️ Remaining Issues
- None significant. This is a solid first assignment.

#### 📊 Difficulty: ⭐ (Easy) — Appropriate for first assignment

#### 🎯 Verdict: **Well-defined, clear, suitable for average students. No changes needed.**

---

### Assignment 2 — Classes, Constructors, Destructors *(MODIFIED)*
**Repo**: `CPP_Assignment_2_5786`

**Topic**: Music Library system (Song, Playlist, MusicLibrary).

**Files students create**: `Song.cpp`, `Playlist.cpp`, `MusicLibrary.cpp`

#### ✅ What Was Fixed
- `.idea` directory **removed** ✅
- `.gitignore` and `.gitattributes` **added** ✅
- README **completely rewritten** with **full file descriptions** ✅:
  - `MusicLibrary.cpp` — now described: "מימוש מתודות מחלקת MusicLibrary: בנאים, מפרק, resize..."
  - `Song.cpp` — now described: "מימוש מתודות מחלקת Song: בנאים, וולידציה..."
  - `Playlist.cpp` — now described: "מימוש מתודות מחלקת Playlist: בנאים, העתקה עמוקה..."
- Makefile **updated from C++17 to C++23** ✅

#### ⚠️ Remaining Issues
- **`Song::getFormattedDuration` zero-padding ambiguity**: The README mentions `getFormattedDuration` in the Song.cpp description but still doesn't explicitly state whether minutes are zero-padded. The `.hpp` file and tests would clarify, but it would be better stated in the README. This is a minor issue — students should be able to figure it out from the tests.
- **`MusicLibrary::incrementTotalSongs()`**: Still present as a public static method documented as "called internally." Its purpose is still somewhat ambiguous (when should students call it?). Minor.

#### 📊 Difficulty: ⭐⭐ (Medium-Easy)

#### 🎯 Verdict: **Major issues fixed. Now well-defined. Minor remaining ambiguities are unlikely to block students.**

---

### Assignment 3 — Composition, Dynamic Arrays *(MODIFIED — Makefile only)*
**Repo**: `CPP_assignment_3_5786`

**Topic**: Library system (Book with Author composition, LibraryCard).

**Files students create**: `Book.cpp`, `LibraryCard.cpp`

#### ✅ What Was Fixed
- Makefile **updated from C++17 to C++23** ✅ (standardized with other assignments)

#### ⚠️ Remaining Issues
- **`borrowBook` return value ambiguity**: Still returns `bool` but auto-resizes, so it always returns `true`. Minor and unlikely to confuse students.
- No other issues — this was already well-defined.

#### 📊 Difficulty: ⭐⭐ (Medium-Easy)

#### 🎯 Verdict: **Was already excellent. Now has consistent C++ standard. No changes needed.**

---

### Assignment 4 — Operator Overloading *(SIGNIFICANTLY MODIFIED)*
**Repo**: `CPP_assignment_4_5786`

**Topic**: Grade and Student classes with operator overloading.

**Files students create**: `Grade.cpp`, `Student.cpp`

#### ✅ What Was Fixed
- **Conversion operators made `explicit`** ✅ — Eliminates the ambiguity concern. README now explains this clearly with examples: `(int)g`, `(double)g`, `(std::string)g`. The explanation of WHY `explicit` is needed is excellent.
- **`operator>>` (input stream) removed from both classes** ✅ — Reduces scope. Only `operator<<` (output) remains.
- **`Student::operator-(double penalty)` removed** ✅ — Reduces scope. Only `+` and `*` remain for Student arithmetic.
- **Output format explicitly documented** ✅ — Now clearly states: "**תמיד שתי ספרות אחרי הנקודה** (`fixed`, `setprecision(2)`)" with examples: `Grade(90)` → `90.00 (A)`, `Grade(0)` → `0.00 (F)`.
- **Weighted average formula clarified** ✅ — General formula now given: `(grades[index] * weight + sum_of_all_other_grades * 1) / (weight + (n-1) * 1)` with explicit note that all OTHER grades get weight 1.

#### ⚠️ Remaining Issues
- **Scope is still substantial** but now more manageable. Grade has ~20+ operators (arithmetic, comparison, increment/decrement, explicit conversion, stream output). Student adds bracket, parentheses, arithmetic, comparison operators. This is the heaviest single assignment — but the reductions help.
  - Previously I rated this ⭐⭐⭐⭐ (Hard). With the reductions, it's closer to **⭐⭐⭐ (Medium-Hard)**.
- **Test file still tests postfix ++ and --** for Grade. This is good — postfix operators were not removed, only the input stream and some Student operators were.

#### 📊 Difficulty: ⭐⭐⭐ (Medium-Hard) — Improved from ⭐⭐⭐⭐

#### 🎯 Verdict: **Significantly improved. The `explicit` conversion operators fix is exactly right. Output format clarity is excellent. Scope is more reasonable. An average student can handle this now.**

---

### Assignment 5 — Deep Copy and Conversion Operators *(MASSIVELY REDUCED)*
**Repo**: `CPP_assignment_5_5786`

**Topic**: Complex numbers (Complex class) and ComplexArray with deep copy.

**Files students create**: `Complex.cpp`, `ComplexArray.cpp`

#### ✅ What Was Fixed — Complex class
- **`operator int()` and `operator float()` REMOVED** ✅ — Only 3 conversion operators remain: `explicit operator double()`, `explicit operator bool()`, `explicit operator std::string()`.
- **All conversion operators made `explicit`** ✅ — Eliminates ambiguity with arithmetic operators.
- **`epsilon` static member REMOVED** ✅ — Simplifies comparison logic.
- **`phase()` method REMOVED** ✅
- **`isImaginary()` REMOVED** ✅
- **`toPolarString()` REMOVED** ✅ — Eliminates the format ambiguity.
- **`operator/(double)` REMOVED** ✅ — Only division by Complex remains.
- **Postfix `++`/`--` REMOVED** ✅ — Only prefix increment/decrement.
- **`<=`, `>=` comparison operators REMOVED** ✅ — Only `==`, `!=`, `<`, `>` remain.
- **`operator>>(istream)` REMOVED** ✅
- **Multiple friend functions reduced** ✅ — Only `operator+(double, Complex)` and `distance()` remain.
- **Several compound operators reduced** ✅ — `operator/=(Complex)`, `operator/=(double)`, `operator-=(double)` removed.

#### ✅ What Was Fixed — ComplexArray class
- **`insert()` REMOVED** ✅
- **`min()` REMOVED** ✅
- **`vectorMagnitude()` REMOVED** ✅
- **`operator()` (subarray/first-n) REMOVED** ✅
- **`operator-(Complex)`, `operator-(ComplexArray)` REMOVED** ✅
- **`operator/(Complex)` REMOVED** ✅
- **Several compound operators reduced** ✅ — `operator-=(Complex)`, `operator*=(Complex)` removed.
- **`operator>>(istream)` REMOVED** ✅
- **`reverse()` REMOVED** ✅
- **Multiple friend functions removed** ✅ — `dotProduct` and `sameSize` removed.
- **`print()` method REMOVED** ✅

#### ⚠️ Remaining Issues
- **Scope is now MUCH more reasonable**: Complex has roughly ~25 methods (constructors, getters/setters, properties, conversions, arithmetic, compound, prefix inc/dec, comparisons, assignment, stream output, friend). ComplexArray has roughly ~20 methods (constructors, getters, static, array ops, math, bracket, arithmetic, compound, assignment, comparison, stream output, sort). Total is about **~45 methods** (down from ~70+). This is feasible for a single assignment.
- **`Complex::operator=(const Complex&)`**: Still explicitly declared. Students need to implement this (even though the compiler-generated one would work for this class since there's no dynamic memory). It's there for pedagogical reasons, which is fine.
- **README now mentions `explicit` clearly** ✅ — with explanation that `double d = (double)c;` works but `double d = c;` does not.

#### 📊 Difficulty: ⭐⭐⭐ (Medium-Hard) — Massively improved from ⭐⭐⭐⭐⭐

#### 🎯 Verdict: **Excellent improvement. Scope reduced by ~40%. Conversion ambiguity eliminated. This is now a reasonable assignment for average students. The focus on deep copy is clear and the operator set is manageable.**

---

### Assignment 6 — Inheritance, Pure Virtual Functions *(UNCHANGED)*
**Repo**: `CPP_assignment_6_5786`

**Topic**: Zoo system with Animal (abstract), Mammal, Bird, Reptile, Zoo.

**Files students create**: `Animal.cpp`, `Mammal.cpp`, `Bird.cpp`, `Reptile.cpp`, `Zoo.cpp`

#### Assessment (same as first review)
- Excellent README with detailed tables for constructors/destructors, virtual function return values, and output formats.
- Good difficulty level for inheritance topic.
- No changes needed.

#### 📊 Difficulty: ⭐⭐⭐ (Medium)

#### 🎯 Verdict: **Excellent. No changes needed.**

---

### Assignment 7 — RTTI, Streams, Manipulators, Image Processing *(SIGNIFICANTLY IMPROVED)*
**Repo**: `CPP_assignment_7_5786`

**Topic**: Image processing with Pixel, Image hierarchy, ImageProcessor with RTTI.

**Files students create**: `Pixel.cpp`, `Image.cpp`, `GrayscaleImage.cpp`, `RGBImage.cpp`, `ImageProcessor.cpp`

#### ✅ What Was Fixed — README now has DETAILED format tables:
- **Pixel string format table** ✅ — `RGBPixel::toString()` → `(R, G, B)`, `GrayPixel::toString()` → `[I]`, `getBrightnessFormatted(n)` → `XX.XX%` with `setprecision(n)`, `printPixelBytes` → `Bytes: [R] [G] [B]`.
- **Brightness formula** ✅ — `(R + G + B) / (3.0 * 255) * 100` with `static_cast<double>` note.
- **RGB-to-grayscale conversion formula** ✅ — `static_cast<unsigned char>(0.299*R + 0.587*G + 0.114*B)` with example.
- **`Image::printInfo` format** ✅ — Labels with `setw(12)` and `left`, dimension format `<W>x<H>`.
- **`Image::getSummary` format** ✅ — `"<name> (<type>, <W>x<H>)"` with examples.
- **`ImageProcessor::generateReport` format** ✅ — Labels with `setw(14)` and `left`, separator characters (30 `=` and 30 `-`), dimension format with spaces `<W> x <H>`, avg intensity/brightness for different image types using `dynamic_cast`.
- **`printComparisonTable` column widths** ✅ — Name(13), Type(10), Size(9), Data(12) all with `left`.
- **`ImageProcessor` functions table** ✅ — All functions listed with descriptions and return types.
- **Exceptions table** ✅ — width/height ≤ 0 → `invalid_argument`, out-of-bounds pixel → `out_of_range`, file open failure → `runtime_error`.
- **Stream redirection explanation** ✅ — Now explains that functions take `std::ostream& os` and can output to cout, ofstream, or ostringstream. `getInfoString()` and `generateReportString()` use `ostringstream` internally.
- **`reinterpret_cast` usage table** ✅ — Lists exactly which functions use it and what they do. Plus safety warning: "only use between RGBPixel*/GrayPixel* and unsigned char*".

#### ⚠️ Remaining Issues
- **None significant**. The README is now on par with Assignment 6's quality. Students have all the format specifications they need.
- The only minor note: `imageCount` static member behavior is documented in a tip ("goes up by 1 in every constructor including copy constructor, down by 1 in every destructor"). This is clear.

#### 📊 Difficulty: ⭐⭐⭐ (Medium-Hard) — Unchanged, but now much clearer

#### 🎯 Verdict: **Massively improved. The format tables are exactly what was needed. Students now have complete specifications without needing to reverse-engineer from tests. This is now a well-defined assignment.**

---

### Assignment 8 — Templates, Iterators, Stack, Queue *(UNCHANGED)*
**Repo**: `CPP_assignment_8_5786`

**Topic**: Generic Container<T>, Stack<T>, Queue<T>, template algorithm functions.

**Students implement within**: `Container.hpp`, `Stack.hpp`, `Queue.hpp`, `Algorithms.hpp`

#### Assessment (same as first review)
- Clear structure with recommended implementation order.
- Exception messages specified.
- Iterator interface clearly documented.
- Templates must be in header files — clearly stated.

#### 📊 Difficulty: ⭐⭐⭐ (Medium-Hard)

#### 🎯 Verdict: **Well-structured. No changes needed.**

---

### Assignment 9 — Template Specializations, Metaprogramming *(SIMPLIFIED)*
**Repo**: `CPP_assignment_9_5786`

**Topic**: TypeInfo, MySwap, Formatter specializations, Derivative metaprogramming, PhysicsUnits, DecltypeUtils.

**Students implement within**: 6 `.hpp` files

#### ✅ What Was Fixed
- **`Derive<Power<E, N>>` (chain rule) REMOVED** ✅ — Only Const, Var, Add, Mul derivatives remain. This eliminates the hardest derivative rule (chain rule with Power), making the metaprogramming section more accessible.
- **"HOW THE DERIVATIVE SYSTEM WORKS" explanatory block added** ✅ — Provides a clear step-by-step explanation:
  - What `using type = ...` means
  - A complete worked example for `Derive<Const<N>>`
  - Explanation of `Derivative<Expr>` as a convenience alias
  - Explicit hints for `Derive<Var>`, `Derive<Add<L,R>>`, `Derive<Mul<L,R>>`
- **Hint comments added to each Derive specialization** ✅ — e.g., `// Hint: using type = Const<0>;`
- **Placeholder implementations added to expression types** ✅ — `eval` returns 0, `toString` returns "" — students know what methods to fill in.
- **README now has Derivative.hpp table** ✅ — Lists each part with description and the exact `using type = ...` syntax to use.

#### ⚠️ Remaining Issues
- **Still challenging**: Even without Power/chain rule, the Derivative section requires understanding template metaprogramming, type aliases, and compile-time type recursion. The improvements make it much more accessible, but it's still the conceptually hardest assignment.
  - However, with the hints and explanations, an average student who carefully reads the comments should be able to implement it. The product rule (`Derive<Mul<L,R>>`) is the hardest part remaining, but the hint gives the exact type alias.
- **PhysicsUnits and other files**: I didn't see changes to these files, but they were already less problematic than Derivative.

#### 📊 Difficulty: ⭐⭐⭐⭐ (Hard) — Improved from ⭐⭐⭐⭐⭐

#### 🎯 Verdict: **Significant improvement. Removing the chain rule and adding extensive explanations/hints makes this much more achievable. The "HOW IT WORKS" block is excellent pedagogical material. An attentive student can now work through this systematically.**

---

### Assignment 10 — STL Containers *(UNCHANGED)*
**Repo**: `CPP_assignment_10_5786`

**Topic**: StudentRecord, CourseManager, StringUtils, TypeTraitsUtils, Riddles.

#### Assessment (same as first review)
- Practical and engaging with well-defined riddles.
- Good STL container coverage.

#### ⚠️ Remaining Issue
- **Missing `.gitignore`**: This repo still doesn't appear to have a `.gitignore` file. Should be added.

#### 📊 Difficulty: ⭐⭐⭐ (Medium)

#### 🎯 Verdict: **Well-defined. Add `.gitignore`.**

---

### Assignment 11 — STL Algorithms *(UNCHANGED)*
**Repo**: `CPP_assignment_11_5786`

**Topic**: DataProcessor, TextAnalyzer, SetOperations, AlgorithmShowcase.

#### Assessment (same as first review)
- Comprehensive STL algorithm coverage.
- Good practical tips (erase-remove, sorted input for set ops, etc.).

#### 📊 Difficulty: ⭐⭐⭐ (Medium)

#### 🎯 Verdict: **Well-structured. No changes needed.**

---

### Assignment 12 — Smart Pointers, Move Semantics *(UNCHANGED)*
**Repo**: `CPP_assignment_12_5786`

**Topic**: Entity, Resource, Scene, SmartStack, Playground.

#### Assessment (same as first review)
- Excellent capstone assignment.
- Clear constraint: no raw new/delete.
- Move semantics and smart pointers well-covered.

#### 📊 Difficulty: ⭐⭐⭐⭐ (Hard) — Appropriate for final assignment

#### 🎯 Verdict: **Well-defined. No changes needed.**

---

## Updated Summary Table

| # | Assignment | Difficulty | Well-Defined? | Status |
|---|-----------|-----------|---------------|--------|
| 1 | Basic C++ (Structs) | ⭐ Easy | ✅ Yes | No changes needed |
| 2 | Classes, Constructors | ⭐⭐ Easy-Med | ✅ Yes | ✅ **Fixed**: file descriptions, `.idea` removed, C++23 |
| 3 | Composition, Dynamic Arrays | ⭐⭐ Easy-Med | ✅ Yes | ✅ **Fixed**: C++23 standardized |
| 4 | Operator Overloading | ⭐⭐⭐ Med-Hard | ✅ Yes | ✅ **Fixed**: explicit conversions, scope reduced, format clarified |
| 5 | Deep Copy, Conversion Ops | ⭐⭐⭐ Med-Hard | ✅ Yes | ✅ **Fixed**: scope cut ~40%, explicit conversions |
| 6 | Inheritance, Virtual | ⭐⭐⭐ Medium | ✅ Yes | Unchanged — already excellent |
| 7 | RTTI, Streams, Images | ⭐⭐⭐ Med-Hard | ✅ Yes | ✅ **Fixed**: detailed format tables added |
| 8 | Templates, Iterators | ⭐⭐⭐ Med-Hard | ✅ Yes | Unchanged — already good |
| 9 | Specializations, Metaprog | ⭐⭐⭐⭐ Hard | ✅ Yes | ✅ **Fixed**: chain rule removed, extensive hints added |
| 10 | STL Containers, Riddles | ⭐⭐⭐ Medium | ⚠️ Mostly | ⚠️ Missing `.gitignore` |
| 11 | STL Algorithms | ⭐⭐⭐ Medium | ✅ Yes | Unchanged — already good |
| 12 | Smart Pointers, Move | ⭐⭐⭐⭐ Hard | ✅ Yes | Unchanged — already good |

---

## Remaining Recommendations (Priority Order)

### 🟡 Minor Issues

1. **Assignment 10 — Missing `.gitignore`**: Add a `.gitignore` file to prevent students from committing build artifacts.

2. **Repo naming inconsistency**: Three different naming patterns. Cosmetic but worth standardizing if convenient.

3. **Assignment 4 Makefile has `-Wall -Wextra`** while others don't. Students moving code between assignments may be surprised by stricter warnings. Consider either adding `-Wall -Wextra` to all assignments or removing it from assignment 4.

4. **C++23 support**: Verify all student environments support C++23. If any don't, C++17 would be a safer fallback since none of the assignments appear to use C++23-specific features.

### 🟢 Nice-to-Have

5. **Assignment 2 — Song format**: Consider explicitly stating in README whether minutes are zero-padded in `getFormattedDuration`.

6. **Assignment 3 — `borrowBook` return**: Consider documenting that it always returns true (since it auto-resizes).

---

## Overall Assessment

**The assignment series is now in excellent shape.** All critical issues from the first review have been addressed:

- ✅ Conversion operator ambiguity → Fixed with `explicit` (assignments 4, 5)
- ✅ Assignment 5 excessive scope → Reduced by ~40%
- ✅ Assignment 2 missing descriptions / `.idea` → Fixed
- ✅ Assignment 7 missing format specs → Comprehensive tables added
- ✅ Assignment 9 difficulty → Chain rule removed, hints and explanations added
- ✅ C++ standard inconsistency → All standardized to C++23

The difficulty progression is now smooth: ⭐ → ⭐⭐ → ⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐ → ⭐⭐⭐⭐

An average second-year student should be able to complete all 12 assignments with reasonable effort.

---

## Notes for Instructor

- I verified the file listings, READMEs, header files, test files, and Makefiles for all 12 repos.
- The remaining issues are all minor (`.gitignore`, naming convention, formatting details).
- The `explicit` conversion operator fix in assignments 4 and 5 is pedagogically valuable — students learn WHY `explicit` matters.
- The Derivative.hpp improvements in assignment 9 (especially the "HOW IT WORKS" block) are excellent teaching material.
- Assignment 7's format tables are now as detailed as assignment 6's — consistent quality.
