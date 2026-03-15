# Assignment Review Notes — CPP-Assignments-5786 Organization

> **Reviewer context:** Reviewing all repos in the `CPP-Assignments-5786` organization from the perspective of a second-year (second semester) student. Checking for structure, clarity, ambiguity, and difficulty.

---

## Repository: CPP-Assignment_1-5786

**Assignment topic:** Introduction to C++ — implementing basic geometric structs (Point, Circle) and utility functions.  
**Language:** README is in Hebrew; code and comments are in English.  
**Target audience:** 2nd year CS students, 2nd semester, "Advanced C++ Programming" course.

---

### ✅ What Works Well

- **Clear file structure:** Students are told exactly which files to create (`Point.cpp`, `Circle.cpp`, `Utilities.cpp`) and which files are provided. This is very clear.
- **Header files provide complete function signatures:** The `.hpp` files have all declarations, so students know exactly what functions to implement, what parameters they take, and what they return.
- **`main.cpp` provides expected output:** Each function call in `main.cpp` has a comment with the expected output, giving students a concrete way to verify correctness.
- **Test file (`test.cpp`) is provided:** Unit tests using `doctest` give students an automated way to check their work. This is excellent for self-assessment.
- **Makefile is provided and well-documented:** `make`, `make test`, and `make clean` commands are clearly explained in the README.
- **Academic integrity policy is clear:** The section on academic integrity is well-written and explicitly addresses AI tool usage.
- **Scope is appropriate:** The functions are straightforward (distance, area, circumference, average, closest point). An average student should be able to implement all of them.
- **C++ features to demonstrate are listed:** The README lists 9 specific C++ features the assignment covers, which helps students understand the learning objectives.

---

### ⚠️ Ambiguities & Potential Confusion

#### 1. `isPointInside` — Boundary case is ambiguous
- **Issue:** The header comment says *"Check if a point is inside the circle"*. A student could reasonably interpret "inside" as strictly inside (`distance < radius`) or inside-or-on-boundary (`distance <= radius`).
- **What happens:** The test file (line 93-94) tests a point at `{3, 4}` on a circle centered at `{0, 0}` with radius `5`. The distance is exactly `5.0`, and the test expects `true`. So the intended behavior is `<=` (on boundary counts as inside).
- **Problem:** A student who implements strict `<` will pass most tests but fail the boundary test. The ambiguity in the header comment could waste debugging time.
- **Suggestion:** Change the comment in `Circle.hpp` to: *"Check if a point is inside or on the boundary of the circle"* or add a note like *"A point on the boundary is considered inside."*

#### 2. `printPoint` — Output format for doubles is unclear
- **Issue:** The comment says *"Print point - should output in format (x,y)"*. The expected output in `main.cpp` shows `(3,4)` and `(1,2)`, but the actual values are `3.0` and `4.0` (doubles).
- **Question:** Should a student print `(3,4)` or `(3.0,4.0)` or `(3.000000,4.000000)`? What about non-integer values like `{3.5, -2.5}` from the test file?
- **Problem:** The default `cout` for a `double` value of `3.0` will print `3` (no decimal), but for `3.5` it will print `3.5`. So the expected output in `main.cpp` probably works by default, but this is not explicitly stated.
- **Note:** There are **no unit tests for `printPoint`** or `printCircle`, so students have no automated way to verify the output format. They can only compare with `main.cpp` comments visually.
- **Suggestion:** Either add print tests (e.g., using `std::ostringstream` to capture output) or explicitly state: *"Use default `cout` formatting for double values."*

#### 3. `printCircle` — Same format ambiguity
- **Issue:** Comment says format should be `Circle: center=(x,y), radius=r`. Same questions as `printPoint` about decimal formatting.
- **Note:** Also no unit tests for this function.

#### 4. Edge cases not addressed — `calculateAverage` with size=0
- **Issue:** What should `calculateAverage` return when `size` is `0`? This causes division by zero.
- **Problem:** The tests don't cover this case. A student might or might not handle it, and there's no guidance.
- **Note:** For a first assignment, it may be intentional to ignore this edge case. But it would be better to explicitly state: *"You may assume size is always >= 1"* or ask students to handle it.

#### 5. Edge cases not addressed — `findClosestToOrigin` with size=0
- **Issue:** What should happen when the array is empty (size=0)?
- **Same suggestion:** Either state *"You may assume the array is non-empty"* or ask students to handle it.

#### 6. Edge cases not addressed — `createCircle` with negative radius
- **Issue:** What should happen if a negative radius is passed? Should the function reject it, take absolute value, or just accept it?
- **Problem:** Not specified anywhere. The tests only use positive radii.
- **Suggestion:** State the assumption or ask students to handle it.

---

### 🔍 Technical Observations

#### 7. No tests for `printPoint` and `printCircle`
- These two functions have no unit tests in `test.cpp`.
- Students implementing them incorrectly won't catch the error through automated testing.
- **Suggestion:** Add output-capture tests or explicitly tell students to verify these manually.

#### 8. Makefile uses `-std=c++23`
- **Issue:** The assignment uses `c++23` in the compiler flags, but no C++23-specific features are used. The code is compatible with C++11 or even older.
- **Potential problem:** Students with older compilers (e.g., older GCC/Clang on Ubuntu 20.04 or macOS) might not support `c++23`, causing compilation failures unrelated to their code.
- **Suggestion:** Use `-std=c++17` or `-std=c++14` unless there's a specific reason for C++23. Alternatively, mention the required compiler version in the README.

#### 9. `-Werror -Wsign-conversion` flags may be strict for beginners
- `-Werror` turns all warnings into errors. Combined with `-Wsign-conversion`, students might get unexpected compilation failures from implicit type conversions (e.g., comparing `int` to `size_t`).
- This is actually good practice and teaches students to write clean code, but it should be mentioned in the README that the Makefile is strict about warnings.

#### 10. Structs passed by value, not by const reference
- All functions take `Point` and `Circle` by value (e.g., `double distance(Point p1, Point p2)` instead of `const Point& p1`).
- For a first assignment introducing C++ basics, this is acceptable. However, the README lists this assignment as demonstrating C++ advantages — passing by const reference is a key C++ feature.
- **Not a problem for students**, but a missed teaching opportunity. Perhaps intentional for simplicity.

#### 11. README says "classes" (מחלקות) but code uses structs
- The README mentions "מחלקות פשוטות" (simple classes), but the code uses `struct`. While structs and classes are nearly identical in C++, this terminology mismatch might confuse students who expect to write `class` with access modifiers.
- **Minor issue** — likely intentional since structs are simpler for a first assignment.

---

### 📋 Summary Assessment

| Criteria | Rating | Notes |
|---|---|---|
| **Well-structured** | ✅ Good | Clear file organization, Makefile provided, test file provided |
| **Well-defined** | ⚠️ Mostly good | Function signatures are clear, but some edge cases and boundary behaviors are not specified |
| **Not ambiguous** | ⚠️ Some ambiguity | `isPointInside` boundary behavior, `printPoint`/`printCircle` output format |
| **Clear instructions** | ✅ Good | README is detailed, expected outputs are shown, build instructions are clear |
| **Average student can solve** | ✅ Yes | Functions are straightforward math/logic. Test file helps guide implementation |

### 🎯 Overall Verdict
**The assignment is generally well-designed for a first C++ assignment.** The main areas for improvement are:
1. Clarify the `isPointInside` boundary behavior in the comment (most impactful)
2. Clarify output format expectations for print functions (or add tests)
3. State assumptions about edge cases (empty arrays, zero/negative values)
4. Consider lowering `-std=c++23` to `-std=c++17` for broader compatibility

These are relatively minor issues. An average student should be able to complete this assignment successfully, especially with the test file guiding their implementation.

---

## Repositories 2–12: `CPP_Assignment_x_5786` (x = 2..12)

### ❌ Still Unable to Access (Third Attempt — 2026-03-01)

**Naming clarification from user:** Repos 2–12 use **all underscores**: `CPP_Assignment_2_5786` through `CPP_Assignment_12_5786` (unlike repo 1 which uses hyphens: `CPP-Assignment_1-5786`).

After receiving the correct naming convention, I retried accessing all repos. **All still return 404 Not Found.**

**All naming variants attempted (all 404):**

| Format | Example | Result |
|---|---|---|
| ✅ Correct names (user-confirmed) | `CPP_Assignment_2_5786` through `CPP_Assignment_12_5786` | All 404 |
| Previous attempts (wrong names) | `CPP-Assignment_2-5786`, `CPP-Assignment_2_5786`, etc. | All 404 |
| GitHub Search API | `org:CPP-Assignments-5786`, `CPP_Assignment_5786` | Returns only repo 1 |

**Root cause (confirmed):** The Copilot Coding Agent (`copilot-swe-agent[bot]`) receives a GitHub token that is **scoped to the single repository** where the issue or PR was created. Even with the Copilot app installed on other repos, each run's token only grants access to `CPP-Assignment_1-5786`. This is a fundamental GitHub Apps limitation — installation tokens are always repository-scoped.

### ✅ How to Get Reviews of All 12 Repos

**Option A: Open an issue in each repo (recommended)**
1. Go to each repo: `CPP_Assignment_2_5786`, `CPP_Assignment_3_5786`, ..., `CPP_Assignment_12_5786`
2. Open a new issue in each (e.g., *"Review this assignment for clarity, ambiguity, and difficulty"*)
3. Assign the Copilot agent to each issue
4. Each run will automatically have a token scoped to that repo

**Option B: Copy all files into this repo**
1. Create folders `assignment_2/` through `assignment_12/` in **this** repo (`CPP-Assignment_1-5786`)
2. Copy the source files from each assignment repo into the corresponding folder
3. Re-run this task — the agent can read everything locally since it's all in one repo

**Option C: Make repos public temporarily**
1. Temporarily change visibility of repos 2–12 to public
2. Re-run this task
3. Revert to private after the review is complete

---

*Review date: 2026-03-01*  
*1 of 12 repositories reviewed. Repos 2–12 (`CPP_Assignment_x_5786`) are inaccessible due to agent token scoping.*
