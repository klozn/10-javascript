# Codelab03 - Hoisting

Until now we've used `let` and `const` to declare a variable.
However originally there only was one way, namely using `var`.

- Look at index.js file and execute it.
    -> Does it work? Did you expect it to work?
- Now implement the same function with `let` or `const` and check the output again

What is happening?
Variables declared with `var` are hoisted. 
Meaning that the compiler will move (hoist) them automatically to the top of your function.
That's why you could use a variable created with `var` before it's declared.

Variables declared with `let` and `const` are not hoisted and give a behaviour the you also see with other programming languages.
