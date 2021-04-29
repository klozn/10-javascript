class Person {
    constructor(firstName, lastName, hobby = 'cycling') {
        this.firstName = firstName;
        this.lastName = lastName;
        this.hobby = hobby;
    }

    getFullName() {
        return this.firstName + ' ' + this.lastName;
    }

    printName() {
        return console.log(this.getFullName());
    }
}

let bob = new Person('bob', 'dylan', 'singing');
let billie = new Person('billie', 'eilish');
