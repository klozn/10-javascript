export class Person {

    constructor(private firstName: string, private lastName: string) {

    }

    getFullName() {
        return `${this.firstName} ${this.lastName}`;
    }
}
