# Codelab 04 - `this`

- After declaration of the scope variable, call the `delayedLog()` method on `scope`

> Did you expect this result?

What is happening?
Well some interesting stuff with this binding and scopes. You can find an in depth explanation [here](https://www.codementor.io/@dariogarciamoya/understanding-this-in-javascript-with-arrow-functions-gcpjwfyuc)
The trick to solve this problem is either:
- bind the function to the current object with `bind()`
- use the [arrow function](https://zendev.com/2018/10/01/javascript-arrow-functions-how-why-when.html) `() => {}`. 

The latter is the more generally accepted way.

Now let's fix our problem:
- Replace the `this.log` method reference in `setTimeout()` with an arrow function that calls `this.log` and run again
