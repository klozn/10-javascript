/*
Try to guess what the result will be of the following functions
 */

//**********************************************************

function sayHi(firstName, lastName) {
    console.log(`Hi my name is: ${firstName} ${lastName}`);
}
sayHi('Unde');

//**********************************************************

function helloWorld(callBack){
    console.log('Hello world! I am so happy to see you.');
    callBack();
    console.log('How are yoy doing?');
}
helloWorld('Patrick');

//**********************************************************

function sayHiWithCallback(firstName, lastName, callback){
    const message = `Hi ${firstName} $ {lastName}`;
    callback(message);
}
function printMessage(message) {
    console.log(message);
}
sayHiWithCallback('Bob', 'Dylan', printMessage());

//**********************************************************

let object = {
    firstName:'Jos',
    lastName: 'Vanderwiel',
    getFullName: function(){return firstName + ' ' + lastName}
}
let firstName = 'Sophie';
let lastName = 'Dupont';
console.log(object.getFullName());

//**********************************************************


function sayHiWithCallback(firstName, lastName, callback){
    const message = `Hi ${firstName} $ {lastName}`;
    callback(message);
}
function printMessage() {
    console.log();
}
sayHiWithCallback('Bob', 'Dylan', printMessage);

//**********************************************************

class Person {
    let firstName;
    let lastName;

    constructor(fName, lName){
        this.firstName = fName;
        this.lastName = lName;
    }

    getFullName(){
        return this.firstName + ' ' + this.lastName;
    }
}

let cat = new Person('Catherine', 'Stark');
console.log(getFullName());
