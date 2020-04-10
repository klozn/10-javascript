# Pets

You're contracted to write a small application.
- It should be written in TypeScript.
- It should be compiled / transpiled to ES5.
- The output should be printed to the console (no .HTML required)
- Use ES6+ modules to split up your code in separate source files.

# Functional requirements

1. A Pet has a name and an age.
2. A Pet can make a sound, when it does, it returns its name concatenated with `is my name and I'm a pet`.
3. A Cat is a pet
    - Additionally, it has an amount of lives. By default it has 9 lives.
    - Additionally, a cat can die. When it does, its lives is reduced by one. A cat's lives can not go below 0.
    - Additionally, we can ask a cat if it's alive. It returns true when its lives are bigger than 0. Else, false.
4. A Dog is a pet
    - Additionally, we can ask a dog if he/she's been a good boy/girl. A dog is a good boy/girl when it has a name that starts with letter a, b or c, OR, if its name contains exactly 5 characters.
5. A Human has a name and multiple pets.
    - On a human, we should be able to call a method to let all of its pets make a sound.
    - Furthermore, we should be able to add new pets (one by one) to the pets of a human.
    
Lastly, create special class that creates some pets, both cats and dogs and interacts with them. 
It should print the results to the console. Also create a human to which you add pets. As well, interact with it and print the results to the console.

Then, execute the code.
