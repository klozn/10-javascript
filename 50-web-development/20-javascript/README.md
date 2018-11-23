# 20-javascript

## Prerequisites
- [Visual Studio Code](https://code.visualstudio.com/)
- Extensions (install in VS Code)
  - Debugger for Chrome
  - VS Live Share
- [Node / NPM](https://nodejs.org/en/download/)
- TypeScript &rarr; `npm install -g typescript`

## Course
The JavaScript (/ ES / TS) course will be given with an interactive session with the students. With Visual Studio Code Live Share it's possible to attach the debugger to Chrome and have a shared debug session with all the students. This way the teacher can ask students to enter commands or write code in the shared session and everyone can join / take over and see the ouput on the big screen.

## Folders
### **interactive**
This folder will be used during class to demonstrate examples in the shared session. It's the most basic setup for a browser JS project.

### **codelabXX**
The codelabs.

## Debug
A nice way to step trough code on screen is to add VS Code launch configurations that open the html file for a project and attach the VS Code Debugger for Chrome. A launch config example for this is below.

````json
{
  "type": "chrome",
  "request": "launch",
  "name": "Launch interactive.html",
  "url": "file://${workspaceFolder}/switchfully-track-shared/50-web-development/20-javascript/xx-presentation-code/interactive/interactive.html"
}
````