/*
 * Run these tests by running the SpecRunner.html file in your browser.
 */

describe('Exercise 01', function () {

    describe('Method sayMyName', function () {

        it('should return a string containing name Derek if I gave it as an argument', function () {
            let result = sayMyName('Derek');
            expect(result).toEqual('Hey, your name is Derek!');
        });

        it('should return a string containing the given name ', function () {
            let result = sayMyName('Suzan');
            expect(result).toEqual('Hey, your name is Suzan!');
        });

    });

    describe('Method getFirstElementOf', function () {

        it('should give the first element of an array with string elements', function () {
            let result = getFirstElementOf(['This', 'Is', 'JavaScript']);
            expect(result).toEqual('This');
        });

        it('should give the first element of an array with number elements', function () {
            let result = getFirstElementOf([5, 8 , 9, 2]);
            expect(result).toEqual(5);
        });

    });

    describe('Method splitAndLowercase', function () {

        it('should split the string into an array based on a single white-space and then lowercase every element', function () {
            let result = splitAndLowercase('YoU GoT to LOVE JavAsCriPt');
            expect(result).toEqual(['you', 'got', 'to', 'love', 'javascript']);
        });

    });

    describe('Method createPerson', function () {

        it('should create and return a Person object with the provided state', function () {
            let person = createPerson('Jimmy', 1980, 'Male');
            expect(person).toBeDefined();
            expect(person.name).toEqual('Jimmy');
            expect(person.birthYear).toEqual(1980);
            expect(person.gender).toEqual('Male');
        });


        it('should create and return a Person object that has a method calculateAge() which returns the age', function () {
            let person = createPerson('Jimmy', 1980, 'Male');
            expect(person).toBeDefined();
            expect(person.calculateAge()).toEqual(new Date().getFullYear() - 1980);
        });

    });

});
