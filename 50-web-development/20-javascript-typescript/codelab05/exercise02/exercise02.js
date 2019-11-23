/*
 * Inspect the tests of exercise02.spec.js to know how you should implement these methods!
 */

const ALIGNMENT = {
    CHAOTIC: 'Chaotic Alignment',
    NEUTRAL: 'Neutral Alignment',
    GOOD: 'Good Alignment'
};

function SuperHero(name, alignment) {
    this.name = name;
    this.alignment = alignment;
}

/* This method is already provided */
SuperHero.prototype.speak = function () {
    return `I am ${this.name}`;
};
