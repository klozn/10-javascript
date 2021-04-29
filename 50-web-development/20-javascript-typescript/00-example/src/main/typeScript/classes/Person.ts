export class Person {

    constructor(private firstName: string, private lastName: string, private hobby?) {

    }

    getFullName(): string {
        return this.firstName + ' ' + this.lastName;
    }

    printName(): void {
        console.log(this.getFullName());
    }
}

let person : Person;
