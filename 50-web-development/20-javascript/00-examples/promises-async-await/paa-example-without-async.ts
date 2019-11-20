/**
 * 1. Compile using: tsc --target es2015 paa-example-without-async.ts
 * 2. Execute using: node paa-example-without-async.js
 */

function doStuffSync() {
    console.log('Stuck in the middle!');
}

/*
* Synchronous code. Each of these 3 statements is executed one after the other (sequential).
* This means each statement has to wait for the previous one to finish executing.
*/
console.log('Before');
doStuffSync();
console.log('After');
