# Import / Export

Let's do a codelab that involves importing and exporting modules.

## Starship class

1. Create a file `starship.ts`. In it, create the class `Starship`.
    - `Starship` has one field, namely `_name`. Through the constructor, it should be set.
        - Since JavaScript has explicit properties (getters and setters are not just methods as is the case in Java),
        it is a (therefore not thé) convention to prefix fields with `_`, so that the get or set property can be given the name without `_`.
            - E.g. field `_name` will have accessor `get name()`
    - Create a read-only property (thus, a get, no set) for field `_name`.
    - By convention (in TS applications):
        - Name the **files** according to kebab-casing.
            - Everything lower-cased, separated by the dash / hyphen symbol (e.g. `space-weapon.ts`)
        - Name the actual classes, interfaces according to PascalCasing
            - Like in Java: `SpaceWeapon`.
2. Make sure that we can `ìmport` class `Starship` in other `.ts` files.

When done (not before), take a look at the below code.
- Your `starship.ts` file should contain something like the following code:
```typescript
export class Starship {

    constructor(private _name: string) {

    }

    get name(): string {
        return this._name;
    }
}
```

## Main file

1. Create a `main.ts` file. In it, import `Starship`. 
    - Then, create a new `Starship` object.
    - Store the object in a variable
    - Print the following message to the console `My Starship's name is <myStarship.name>`
    
When done (not before), take a look at the below code.
- Your `main.ts` file should contain something like the following code:
    
```typescript
import {Starship} from './starship'

const myStarship = new Starship('Falcon');

console.log('My starhip\'s name is: ' + myStarship.name);
```

## Compiling our code

To compile our code, we have to specify the root file / entry point of our little 'application'.
That file, is `main.ts`, as it imports the only other file we're using (`starship.ts`). 

Use the following command: 
```
tsc main.ts --target es5
```

A few remarks:
- The TS compiler will generate a `main.js` and `starship.js` file (because `starship.ts` is used by `main.ts`)
- We provide option `--target` with value `es5` to explicitly indicate that we want the compile / transpile to the 
'old javascript' code (that all browsers 100% support). 
    - Take a look at the `.js` code, pretty different from the original, right?

## Executing the code

From now on, we'll use **Node** to run our code.
- Node is a runtime for executing JavaScript code from outside of a browser.

> It's good to know that **Node** has a module loader... 
> Long story short: it loads up all the different `.js` files we have, and in the correct order 
> And, it makes sure our `import` and `export` statements work correctly and different files are actually correctly loaded into each other.  

To execute our code, run the following command:
```
node main.js
```

You should see the following result in the console / cmd / terminal:
```
My starhip's name is: Falcon
```

## Executing code from inside HTML

To execute a Javascript application that consists of multiple source files and is using JavaScript modulues 
(import / export different files for classes, interfaces,...) from inside an HTML file is not that trivial without a proper configuration. 
- The main reason: Browser (still) not yet (fully) implement ES6 modules.

Therefore, we'll stick to executing our code with **Node** for now.

 

