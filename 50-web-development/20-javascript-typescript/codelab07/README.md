# Codelab01

Start by installing the required TypeScript tools. Using NPM execute in the CMD command `npm install -g typescript`

> This will install specific tools for typescript (such as the TypeScript compiler) globally on your computer

Then, validate you can run `tsc --version` (tsc stands for `TypeScript Compiler`)

## Your first TypeScript file

Create a file called `greetingService.ts` (mind the `.ts` extension).

Copy/paste the following JavaScript (not TypeScript) code to `greetingService.ts`:

```javascript 1.5
function generateGreeting(person) {
  return "Hello there, " + person;
}

const user = "Jimmy McJimmens";

document.getElementById("content").innerText = generateGreeting(user);
```

## Compiling our code

Although we used a `.ts` extension, this code does not use anything specific to TypeScript. It's plain old Javascript.

Now, inspect the `codelab01.html` file. We're executing the following script `<script src="greetingService.js"></script>`.

We could try to replace `<script src="greetingService.js"></script>` with `<script src="greetingService.ts"></script>`, but that won't work.

We need to 'convert' our `.ts` file to a `.js` file.

When we use TypeScripts compiler, it will transpile all of our TypeScript code to Javascript code. For every `.ts` file,
a `.js` file will be created, containing the Javascript code (transpiled from the TypeScript code).

Using the command line, compile your `.ts` file:

```
tsc greetingService.ts
```

As a result, a `greetingService.js` file will be created, containing pure Javascript.

- Sidenote: since our `greetingService.ts` contained no TypeScript specific code, both files' content will look very much alike.

Inspect the `greetingService.js` file. Then, open up your `codelab01.html` file. You should see the following output:

```
Hello there, Jimmy Jimmens
```

## Types

Let's start by adding some TypeScript code.

In the `greetingService.ts` file, provide argument `person` of method `generateGreeting(person)` with type `string`.

When done (not before), take a look at the below code. The resulting code should look like this:

- Do not copy/paste this code (get TS in your fingers by writing the code)

```typescript
function generateGreeting(person: string) {
  return "Hello there, " + person;
}

const user = "Jimmy Jimmens";

document.getElementById("content").innerText = generateGreeting(user);
```

Recompile your file, then re-run the `codelab01.html` page.
The result should be as before.

However, now we have type safety in our code. The compiler will notify us by throwing a compilation error when we
validate the intended contract of the argument.

Change the code so that variable `user` is an array:

When done (not before), take a look at the below code.

```typescript
function generateGreeting(person: string) {
  return "Hello there, " + person;
}

const user = [1, 3, 3, 7];

document.getElementById("content").innerText = generateGreeting(user);
```

Now, recompile your code. You should receive the following compilation error:

```
greetingService.ts:7:65 - error TS2345: Argument of type 'number[]' is not assignable to parameter of type 'string'.
```

Notice that although there were errors, the `greetingService.js` file is still created. You can use TypeScript even if
there are errors in your code. But in this case, TypeScript is warning that your code will likely not run as expected.

Correct your mistake, recompile your file, then re-run the `codelab01.html` page:

```
Hello there, Jimmy Jimmens
```

## Interfaces

Let’s develop our sample further. Create an interface (in the `greetingService.ts` file) that describes objects that
have a firstName and lastName field. In TypeScript, two types are compatible if their internal structure is compatible.
This allows us to implement an interface just by having the shape the interface requires, without an explicit implements clause.

- ES6(+) does not have the concept of an interface (although it does have inheritance: one class can extend another class),
  you can not create an interface which you let another class implement. - Interfaces are something exclusive to TypeScript. - Interfaces can define methods and fields (which have to be filled in upon creation an actual object) - The fact that we can define fields in interfaces is different to what you might be used in (e.g.) Java.

When done (not before), take a look at the below code. Your interface should look something like this:

```typescript
interface Person {
  firstName: string;
  lastName: string;
}
```

Then, change method `generateGreeting(person: string)` so that it no longer accepts a string as argument, but a `Person` object instead.
Furthermore, the method should use the `Person` object to get the and return the `firstName` and `lastName` fields.

Finally, call the `generateGreeting` method by calling it with an object that fits the internal structure of interface `Person`.

- (Remember how two types are equal if their structure is equal)

  ```typescript
  interface Named {
    name: string;
  }
  class Person {
    name: string;
  }
  let p: Named;
  // OK, because of structural typing
  p = new Person();
  ```

When done (not before), take a look at the below code. Your code should like something like this:

```typescript
interface Person {
  firstName: string;
  lastName: string;
}

function generateGreeting(person: Person) {
  return "Hello there, " + person.firstName + " " + person.lastName;
}

const user = { firstName: "Roger", lastName: "Rogerson" };

document.getElementById("content").innerText = generateGreeting(user);
```

recompile your file, then re-run the `codelab01.html` page. You should see the following result

```
Hello there, Roger Rogerson
```

## Classes

Finally, let’s extend the example one last time with classes. TypeScript supports the latest features in Javascript,
like support for class-based object-oriented programming.

In your `greetingService.ts` file, create a `Student` class with a constructor and a few public fields.
A `Student` has 4 fields, of which 3 are provided as constructor arguments (`firstName`, `lastName` and `middleInitial`).
Field `fullName` is the combination of the other 3 fields.

When done (not before), take a look at the below code. Your `Student` class could look like this:

```typescript
class Student {
  public fullName: string;
  public firstName: string;
  public lastName: string;
  public middleInitial: string;

  constructor(firstName: string, middleInitial: string, lastName: string) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.middleInitial = middleInitial;
    this.fullName = firstName + " " + middleInitial + " " + lastName;
  }
}
```

or, like this:

```typescript
class Student {
  public fullName: string;

  constructor(
    public firstName: string,
    public middleInitial: string,
    public lastName: string
  ) {
    this.fullName = firstName + " " + middleInitial + " " + lastName;
  }
}
```

Notice that the use of `public` (or any other access modifier) on arguments to the constructor is a shorthand that
allows us to automatically create fields with that name.

Notice that classes and interfaces play well together, letting the programmer decide on the right level of abstraction.

Now, change variable `user` so that it now holds a `Student` object: `const user = new Student('Roger', 'R.', 'Rogerson');

When done (not before), take a look at the below code. Your code should now look like this:

```typescript
class Student {
  public fullName: string;

  constructor(
    public firstName: string,
    public middleInitial: string,
    public lastName: string
  ) {
    this.fullName = firstName + " " + middleInitial + " " + lastName;
  }
}

interface Person {
  firstName: string;
  lastName: string;
}

function generateGreeting(person: Person) {
  return "Hello there, " + person.firstName + " " + person.lastName;
}

const user = new Student("Roger", "R.", "Rogerson");

document.getElementById("content").innerText = generateGreeting(user);
```

Notice how method `generateGreeting(person: Person)` still uses a `Person` object, although we're passing in a `Student` object.
This is however, in Javascript (and TypeScript) allowed, because they share (part-of) a similar structure (`lastName` and `firstName`).

recompile your file, then re-run the `codelab01.html` page. You should see the following result

```
Hello there, Roger Rogerson
```

There's still one little problem. Update your code to change the `user` object's `firstName` to value `Bob` and then show the `fullName` instead of `generateGreeting(user)` on the page.

```typescript
const user = new Student("Roger", "R.", "Rogerson");
// on this line --> change the firstname of user to Bob.

document.getElementById("content").innerText = generateGreeting(user);
// change to above line so that no longer generateGreeting(user) is called, but instead the user object's fullName is used.
```

Think about what you'd expect to be shown on the screen before you recompile and run it!

- When done (not before), take a look at the below code, your code should look similar:

```typescript
class Student {
  public fullName: string;

  constructor(
    public firstName: string,
    public middleInitial: string,
    public lastName: string
  ) {
    this.fullName = firstName + " " + middleInitial + " " + lastName;
  }
}

interface Person {
  firstName: string;
  lastName: string;
}

function generateGreeting(person: Person) {
  return "Hello there, " + person.firstName + " " + person.lastName;
}

const user = new Student("Roger", "R.", "Rogerson");
user.firstName = "Bob";

document.getElementById("content").innerText = user.fullName;
```

After recompiling and running the code, did you expect this result?

- `user.fullName` does still contain the old value, right? Without 'Bob'...

The reason why this happens is that `fullName` is only set in the `constructor`, when the object is created.

- Once generated, it is not regenerated when the firstName changes.
  It's actually `metadata` and should be generated based on the other properties instead of having its own state.

Update `fullName` to be a `getter` (property) instead of a field, make sure it still returns the `fullName` in the form it does right now.

> This time, you'll have to compile with the `tsc` option `--target es5`. What this means will be explained a bit more in `codelab02`.

- First, try to compile as normal using `tsc greetingService.ts`, it will fail.
- Then, correctly compile using `tsc --target es5 greetingService.ts`

When done (not before), take a look at the below code. In the end, your code should look like this:

```typescript
class Student {
  constructor(
    public firstName: string,
    public middleInitial: string,
    public lastName: string
  ) {}

  get fullName() {
    return this.firstName + " " + this.middleInitial + " " + this.lastName;
  }
}

interface Person {
  firstName: string;
  lastName: string;
}

function generateGreeting(person: Person) {
  return "Hello there, " + person.firstName + " " + person.lastName;
}

const user = new Student("Roger", "R.", "Rogerson");
user.firstName = "Bob";

document.getElementById("content").innerText = user.fullName;
```

Now, `fullName` returns what we expected it to return!
