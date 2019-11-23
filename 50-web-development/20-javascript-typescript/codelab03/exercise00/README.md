# Exercise 00 - Prototypes

Use the following code to create an object with prototype `Person`

```javascript
function Person(name) {
  this.name = name;
}

const slim = new Person("Slim Shady");
```

After initializing the `slim` person, add a `talk()` function that logs something to the console to the `Person` prototype.

```javascript
  Person.prototype.talk = ...
```

Now try calling this method on the `slim` object. Does this work? What does this tell you about prototypes?

Now, create a second object with `slim` as prototype. The method creates an object with its parameter as prototype.

```javascript
const person = Object.create(slim);
```

What is the value of `person.name`? Set another value for `person.name` and check that it has changed.

Now delete the value for `person.name` (you can use the `delete` keyword for this). What is the value now?

What does this tell you about prototypical inheritance?
