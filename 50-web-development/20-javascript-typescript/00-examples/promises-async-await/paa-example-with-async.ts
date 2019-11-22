/**
 * 1. Compile using: tsc --target es2015 paa-example-with-async.ts
 * 2. Execute using: node paa-example-with-async.js
 */

async function doStuff() {

    // create a new promise inside of the async function
    const asyncCalculation: Promise<string> =
        new Promise((resolve) => {
            return resolve('Stuck in the middle (or not...)')
        });

    // Waits for the promise to be resolved...
    let calculationResult = await asyncCalculation;

    // Prints the received result
    console.log(calculationResult);

}

/*
 * Asynchronous code. Since doStuff() is an asynchronous method, it is 'taken outside of the main program flow',
 * allowing the code after the asynchronous call to be executed immediately without waiting.
 */
console.log('Before');
doStuff();
console.log('After');
