/*
 * Run these tests by running the SpecRunner.html file in your browser.
 */

describe('Exercise 01', function () {

    describe('Method sayMyName', function () {

        let sayMyNameMethod;

        beforeEach(function() {
            sayMyNameMethod = new sayMyName();
        });

        it('should return a string containing name Derek if I gave it as an argument', function () {
            let result = sayMyNameMethod.call('Derek');
            expect(result).toEqual('Hey, your name is Derek!');
        });

        it('should return a string containing the given name ', function () {
            let result = sayMyNameMethod.call('Suzan');
            expect(result).toEqual('Hey, your name is Suzan!');
        });

    });

    describe('Method getFirstElementOf', function () {

        let getFirstElementOfMethod;

        beforeEach(function() {
            getFirstElementOfMethod = new getFirstElementOf();
        });

        it('should give the first element of an array with string elements', function () {
            let result = getFirstElementOfMethod.call(['This', 'Is', 'JavaScript']);
            expect(result).toEqual('This');
        });

        it('should give the first element of an array with number elements', function () {
            let result = getFirstElementOfMethod.call([5, 8 , 9, 2]);
            expect(result).toEqual(5);
        });

    });

    describe('Method splitAndLowercase', function () {

        let splitAndLowercaseMethod;

        beforeEach(function() {
            splitAndLowercaseMethod = new splitAndLowercase();
        });

        it('should split the string into an array based on a single white-space and then lowercase every element', function () {
            let result = splitAndLowercaseMethod.call('YoU GoT to LOVE JavAsCriPt');
            expect(result).toEqual(['you', 'got', 'to', 'love', 'javascript']);
        });

    });

    describe('Method createPerson', function () {

        let createPersonMethod;

        beforeEach(function() {
            createPersonMethod = new createPerson();
        });

        it('should create and return a Person object with the provided state', function () {
            let person = createPersonMethod.call('Jimmy', 1980, 'Male');
            expect(person).toBeDefined();
            expect(person.name).toEqual('Jimmy');
            expect(person.birthYear).toEqual(1980);
            expect(person.gender).toEqual('Male');
        });


        it('should create and return a Person object that has a method calculateAge() which returns the age', function () {
            let person = createPersonMethod.call('Jimmy', 1980, 'Male');
            expect(person).toBeDefined();
            expect(person.calculateAge()).toEqual(new Date().getFullYear() - 1980);
        });

    });

});
