# Exercise 00 - Callbacks, Promises and Async Await

We're working with inline JavaScript, no separate `index.js` this time. Inside `index.html` there's code to fetch random doggo's with callbacks. This was acceptable until 2011, so

- Refactor this code to use `promises` by making the `fetchRandomDog` function return a new
- _Does it still work? refresh the page for a new doggo_
- Refactor it again to use the `async await` syntax.

> **Hint:** you can use the `getJSON()` method with await and remove the success and error callbacks, `getJSON()` actually also returns a promise. Try to build a promise yourself first though, by manually calling `resolve` and `reject` in the success and error callbacks!
