import {Person} from "../src/Person";

describe('Person', function () {
    it('can have a full name', function () {
        let person = new Person('Tim', 'Vercruysse');

        expect(person.getFullName()).toEqual('Tim Vercruysse');
    })
});
