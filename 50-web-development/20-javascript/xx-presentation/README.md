# Exercises
> These are some small exercises that will accompany the JavaScript part of the presentation

The easiest way to start writing JavaScript (including newer ES specs) is to open a browser that's as up-to-date as possible like **Chrome**, open the console and write your code in there.

You could also create a very simple `html` file, open and close a `<script> </script>` tag and write your JS code between them (then open it with a browser to calculate the result).

---
## Hoisting
Write the hoist function from the _Variable declaration_ slide and check what output you get for `h`. Implement the same function with `let` or `const` and check the output again.

---
## Typing
Create a variable `foo` with value `5`. Check the type with `typeof foo`. Assign `'bar'` to this value. Check the type again. What happens if you check the type of a variable that never got a value? (`let foo;`)

---
## Equality
Try to find out which values for each type are falsy and which are truthy. For example `'' == false`. How many can you find (without Google)?

---
## String & Array
Using the `string` and `array`'s prototype functions, write a function that accepts a string, converts it to an array, removes the vowels and counts how many characters are left (no, you can't just count the consonants or we'll throw an `An-Sophie` at your implementation).

You can do this with one method chain thanks to the built-in `string` and `array` methods.

---
## Objects
Write a function that accepts an `object` and prints a summary of its properties.

For example, for the following object
````javascript
const obj = {
  x: 2,
  y: 5
};
````

`'This object has 2 properties, x and y'`. Make it easy on yourself and use a **template string** (see `Strings` chapter).

---
## Functions
Write two `'Hello world!'` functions `helloOne()` and `helloTwo()`. Leave one Assign one of them to a variable. Try to call both functions at the top of your file / before declaring them.

---
## Callbacks, Promises and Async Await
Start out with this code (put in inside a html file and open it with a browser) with a callback. 
Then, refactor it to use `promises` by making the `fetchRandomDog` function return a new promise. Then use the `async await` syntax. 
> **Hint:** you can use the getJSON method with await and remove the success and error callbacks, it actually also returns a promise. Try to build a promise yourself first though, by manually calling `resolve` and `reject` in the success and error callbacks.

````html
<html>
  <head><script src="https://code.jquery.com/jquery-3.3.1.min.js"></script></head>
  <body>

    <img id="doggo"></img>

    <script>
      function updateImage(result) {
        document
          .getElementById('doggo')
          .setAttribute('src', result.message);
      }

      function fetchRandomDog(callback) {
        $.getJSON({
          url: `https://dog.ceo/api/breeds/image/random`,
          success: callback,
          error: console.error,
        });
      }

      fetchRandomDog(updateImage);
    </script>
  </body>
</html>
````
---
## Prototypes
Use the following code to create an object with prototype `Person`

````javascript
function Person(name) {
  this.name = name;
}

const slim = new Person('Slim Shady');
````

After initializing the `slim` person, add a `talk()` function to the `Person` prototype.

````javascript
  Person.prototype.talk = ...
````

Now try calling this method on the `slim` object. Does this work? What does this tell you about prototypes?

---

Now, create a second object with `slim` as prototype. The  method creates an object with its parameter as prototype.

````javascript
  const person = Object.create(slim);
````

What is the value of `person.name`? Set another value for `person.name` and check that it has changed.

Now delete the value for `person.name` (you can use the `delete` keyword for this). What is the value now?

What does this tell you about prototypical inheritance?

---
## `this`

Execute the following code and call the `delayedLog()` method

````javascript
const scope = {
  x: 5,
  log: function() {
    console.log(`x is ${this.x}`);
  },
  delayedLog: function() {
    setTimeout(this.log, 1000);
  }   
};
````

Did you expect this result? Replace the `this.log` method reference in `setTimeout()` with an arrow function that calls `this.log`.