export class Person {

    constructor(private firstName: string, private lastName: string, private hobby = 'cycling') {

    }

    getFullName(): string {
        return this.firstName + ' ' + this.lastName;
    }

    printName(): void {
        console.log(this.getFullName());
    }
}

let bob = new Person('bob', 'dylan', 'singing');
let billie = new Person('billie', 'eilish');

