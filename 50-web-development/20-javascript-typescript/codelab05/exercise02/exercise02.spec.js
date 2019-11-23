/*
 * Run these tests by running the SpecRunner.html file in your browser.
 */

describe('SuperHero', function () {

    let heroBatman, heroSpiderman;

    beforeEach(function () {
        heroBatman = new SuperHero('Batman', ALIGNMENT.GOOD);
        heroSpiderman = new SuperHero('Spiderman', ALIGNMENT.CHAOTIC);
    });

    describe('Method Speak', function () {

        it('should return \'I am Batman\' for a SuperHero with name Batman', function () {
            let result = heroBatman.speak();
            expect(result).toEqual('I am Batman');
        });

    });

    describe('Method Chant', function () {

        it('should return \'Na Na Na Na Na Batman\' if I call it with argument 5', function () {
            let result = heroBatman.chant(5);
            expect(result).toEqual('Na Na Na Na Na Batman');
        });

        it('should return \'Na Na Na Spiderman\' if I call it with argument 3', function () {
            let result = heroSpiderman.chant(3);
            expect(result).toEqual('Na Na Na Spiderman');
        });

    });

    describe('Method revealName', function () {

        it('should reveal the real name based on the arrow method provided as an argument concatenated with the result of the speak() method and the alignment field', function () {
            let result = heroBatman.revealName(() => 'My real name is Wayne');

            expect(result).toEqual('I am Batman. Good Alignment. My real name is Wayne');
        });

    });

    describe('Method filterAndMapWeapons', function () {

        it('should filter out all lethal weapons and return an array of only the names', function () {
            let result = heroBatman.filterAndMapWeapons([
                {name: 'Boomerang', isLethal: false},
                {name: 'Gun', isLethal: true},
                {name: 'Fist', isLethal: false},
                {name: 'Ninja star', isLethal: true},
            ]);

            expect(result).toEqual(['Boomerang', 'Fist']);
        });

    });

    describe('Method sortEnemiesDesc', function () {

        it('should sort the enemies, alphanumerically descending', function () {
            let result = heroSpiderman.sortEnemiesDesc(['Green goblin', 'Rhino', 'Doctor Octopus', 'Lizard']);

            expect(result).toEqual(['Rhino', 'Lizard', 'Green goblin', 'Doctor Octopus']);
        });

    });

});
