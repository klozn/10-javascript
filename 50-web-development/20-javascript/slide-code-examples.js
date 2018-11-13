/* CODE SAMPLES */

var variable = 5;​
var hello = 'hello';​

function hoist() {
  // is hoisted: 'var h = undefined;'
	for (var i = 0; i < 3; i++) {
    var h = 3;
    // becomes: 'h = 3'
  }
  console.log(h); 
  // prints out 3 because h is still known here
}

var 1 = 'one';​
var _$ = 'omg';​

let variable = 5;​
const hello = 'hello';​

let a;​
a === undefined​

let a = null;​
a === null

let a = parseInt('granny');​
a === NaN

let a = 1/0;​
a === Infinity

const hello = 'hello';​
typeof hello === 'string'​

null == undefined​
[] == false​
0 == false​
'' == false​
0 == ''​
0 == '0'

'a b c'.split(' ');    // returns ["a", "b", "c"]​
'abc'.indexOf('b');          // returns 1​
'abcd'.replace(/[ab]/g,'x'); // returns "xxcx"​
'ABC'.toLowerCase();         // returns "abc"​
'A' + 'BC'                   // returns "ABC"

const first = 'Hello';​
const last = 'world!';​
`${first} ${last}`     // returns "Hello world!"

const location = {
	x: 3,​
	y: 5,​
	distanceTo: function(x, y) {​
		const dx = this.x - x;​
		return Math.sqrt(dx);​
	}​
}

console.log(location.x);
console.log(location['x']);

for (let key in location) {
	console.log(location[key]);
}

location.z = 1;
location['z'] = 1;

location.x = 43;
location['x'] = 43;

delete location.z;
delete location['z'];

let location = {};
let location2 = new Object();


let person = {
	lastName: 'Who',
	firstName: 'Doctor'
};

Object.keys(person); 
// returns ["lastName", "firstName"]


let person = {
	'first name': 'Doctor'
};

person['first name']; 
// person.first name not possible!


function createPoint(x,y) {
	return {
		x: x,
		y: y,
		distanceTo: function (otherPoint) {
			return Math.sqrt(...);
		}
	};
}

function createPoint(x,y) {
	return {
		x,
		y,
		distanceTo(otherPoint) {
			return Math.sqrt(...);
		}
	};
}

function aFunction(name) {
	console.log('Hello, ' + name);
}

let aFunction = function(name) {
	console.log('Hello, ' + name);
}

function wow() {
	console.log(arguments[1]);
} 

wow('matt', 'smith'); // prints "smith"


function wow(firstName, ...lastNames) {
	for (let lastName of lastNames) {
		console.log(lastName)
	}
} 

wow('matt', 'alberto', 'smith'); 


function wow(firstName, ...lastNames) {
	for (let lastName of lastNames) {
		console.log(lastName)
	}
} 

wow('matt', 'alberto', 'smith'); 


const arr = [1, 2, 3];

arr.forEach(function(i) {
	console.log(i);
});
for(let i = 0; i < arr.length; i++) {...}

arr.filter(function(i) {
	return i <= 2;
}); 
// returns [1, 2];

arr.map(function(i) {
	return i + 1;
}); 
// returns [2, 3, 4];

arr.forEach(i => console.log(i));

arr.filter(i => i <= 2); 
// returns [1, 2];

arr.map(i => i + 1); 
// returns [2, 3, 4];

const x = (a, b, c) => c;

// same as
const x = function(a, b, c) {
	return c;
	// automatic return
}


const y = (a, b, c) => {
	console.log(a);
	console.log(b);
};

// same as
const y = function(a, b, c) {
	console.log(a);
	console.log(b);
	// no automatic return
}


const arr = [ 'dog', 'cat' ];

Object.keys(arr);   // returns ["0", "1"]
arr['1'];           // returns "cat", same as arr[1]

for (let a in arr) {
	console.log(a);
}

'This is a string'.includes('is'); // returns true
[1, 2, 3].filter(number => number % 2 === 0); // returns [2]

Object.create(person1);
// creates a new object with person1 as prototype

const person2 = Object.create(person1);
person2.age; // 32
person2.age = 20;
person2.age; // 20
person1.age; // 32
delete person2.age;
person2.age; // 32 (back to parent prototype)

const person2 = Object.create(person1);
person2.isMature = function() {
	return this.age > 18;
}
person2.isMature() // true
person1.isMature(); 
// Uncaught TypeError: person1.isMature is not a function

function summer(a, b) {
	return a + b;
}

function Person(name) {
	this.name = name;
}

new Person("Matt the Bat");

const matt = {
	__proto__: Person.prototype
};
Person.call(matt, "Matt the Bat");

function funcX(x) {
	let y = 4;
	y++;
	return x + y;
}

let count = 0;

function increment() {
	count++;
}


function createIncrementer(start) {
	let count = start;
	function increment() {
		count++;
		return count;
	}
	return increment;
}


function Person(name) {​
  this.name = name;​
}​

const slim = new Person('Slim Shady');​

Person.prototype.talk = function() {​
  return 'Hi! My name is ... ' + this.name;​
}​

console.log(slim.talk());​


class Person {
	constructor(firstName, lastName) {
		this.firstName = firstName;
		this.lastName = lastName; 
	}

	get fullName() {
		return `${this.firstName} ${this.lastName}`;
	}

	talk() {
		return `Hi! My name is ... ${this.fullName}`;
	}
}


class Primate {
	constructor(hasTail) {
			this.hasTail = hasTail;
	}
}

class Person extends Primate {
	constructor(firstName, lastName) {
			super(false);
			this.firstName = firstName;
			this.lastName = lastName; 
	}
	...
}

const slim = new Person('Slim', 'Shady');
slim instanceof Person;   // true
slim instanceof Primate;  // true
slim instanceof Object;   // true

slim.talk();
slim.hasTail === false;

class Person {
	constructor(firstName, lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	}

	talk() {
		console.log(`Hi! My name is ${this.firstName}`);
	}

	delayedTalk() {
		setTimeout(() => this.talk(), 500);
	}
}

new Person('Gilliam', 'Flebus').delayedTalk();

function setTimeout(myCallback, millis) {
	// wait for millis
	myCallback();
}

fetchFromUrl((result, headers) => doSomethingWith(result), url);

fetchFromUrl(doSomethingWith, url);

!person // person == false?
!!person // person == true?

const name = person && person.getName(); 
// only executes getName() if person is truthy

const name = cachedName || (cachedName = getName());
// only gets a new cached name when cachedName is falsy