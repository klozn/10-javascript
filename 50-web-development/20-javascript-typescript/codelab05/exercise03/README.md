# Exercise 03 
Running Jasmine tests against ES6
> ES6 is the alternative name for ES205. It included some major changes, such as the class syntax.

## Assignment

Let's remake exercise02, but this time we're going to use the ES6 (and up) Class syntax.
- Class syntax: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/class
- The tests (specs) inside of `spec/exercise03.spec.js` should not be changed, and they should all succeed when done.

Because ES6 works with modules which we can import and export, we actually had to perform some additional setup,
as Jasmine - out of the box - can not import our SuperHero class. That's why you will run your tests in a different way... (read on)

## To run the test, do the following

1. Execute (in `exercise03`) command `npm install`
    - This will install all the dependencies we need (inside of `node_modules`)
2. Then, run command `npm run babel-spec` to run the tests.
    - It will transpile our code from ES6 to ES5 (and executes `SpecRunner.js`), thus also running the tests.
    - By transpiling our ES6(+) code into ES5, we can use modules (import / export) in our source code, and yet run our 
    tests (which will run against non-module ES5 code, for which they are compatible).

## What was installed with NPM

> This is purely informational

1. `npm install jasmine`
2. `npm i babel-core babel-preset-es2015 --save`
3. `npm install --save-dev babel-cli`
