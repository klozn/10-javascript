function Person(name) {
    this.name = name;
}

const slim = new Person("Slim Shady");

Person.prototype.talk = function () {
    console.log(`I'm Slim Shady, yes, I'm the real Shady.
    All you other Slim Shadys, are just imitating.
    So won't the real Slim Shady, please stand up, please stand up, please stand up`)
}

slim.talk();

const person = Object.create(slim);

console.log(person.name);
person.name = 'Big Shady';
console.log(person.name);
delete person.name;
console.log(person.name);