// ===================
// null and undefined
// ===================

// When something hasn't been initialized, it is undefined
let myUndefinedVariable;
console.log(myUndefinedVariable === undefined);

// When something is currently 'unavailable', it should be null
let myNullVariable;
myNullVariable = null;
console.log(myUndefinedVariable === null);

// null and undefined are equal (==, not ===) to each other.
console.log(null == null); // true (of course)
console.log(undefined == undefined); // true (of course)
console.log(null == undefined); // true

if(!myUndefinedVariable) {
    console.log('This will be printed');
}

if(!myNullVariable) {
    console.log('This will be printed as well');
}

// ===================
// NaN and Infinity
// ===================

const myAge = parseInt('sixteen');
console.log('My Age ' + myAge);

const divideByZero = 50 / 0;
console.log('Divided by zero: ' + divideByZero);
