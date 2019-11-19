# 20-javascript

## Prerequisites
- IntelliJ
    - Or, instead: [Visual Studio Code](https://code.visualstudio.com/)
        - Extensions (install in VS Code)
            - Debugger for Chrome
- [Node / NPM](https://nodejs.org/en/download/)
    - TypeScript &rarr; `npm install -g typescript`

## Course
The JavaScript part of the course will be given with some small exercises in between the chapters. For the TypeScript part there are some Codelab exercises at the end of the chapter.

## Folders
### **interactive**
This folder can be used during class to demonstrate code examples. It's the most basic setup for a browser JS project.

### **codelabXX**
The codelabs.

### **xx-presentation**
Contains the presentation's accompanying exercises.

## Debug

Using IntelliJ
- Right click the `interactive.html` or `interactive.js` file and select `Debug`.
    - Add a breakpoint, and executing will be halted. 

Using Visual Studio Code:
- add VS Code launch configurations that open the html file for a project and attach the VS Code Debugger for Chrome. A launch config example for this is below.

````json
{
  "type": "chrome",
  "request": "launch",
  "name": "Launch interactive.html",
  "url": "file://${workspaceFolder}/switchfully-track-shared/50-web-development/20-javascript/xx-presentation-code/interactive/interactive.html"
}
````
