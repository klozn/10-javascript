# 20-javascript

## Prerequisites

- **[Visual Studio Code](https://code.visualstudio.com/)** or **[IntelliJ](https://www.jetbrains.com/idea/download/)**
  - Extensions (install in VS Code)
    - Debugger for Chrome
- **[Node / NPM](https://nodejs.org/en/download/)**
  - TypeScript &rarr; `npm install -g typescript`

---

## Folders

### **codelabXX**

The codelabs!

### **xx-presentation-code**

Contains the presentation code snippets.

> #### **interactive**
>
> Can be used during class to demonstrate code examples. It's the most basic setup for a browser JS project. Live coding is probably easier by just using the browser DevTools.

### 00-examples

Some code examples, in our case showing asynchronous ways of programming based on the `random dog` exercise in the codelabs.

---

## Debug

### Using the browser

The easiest way to debug basic JavaScript is to open the DevTools in your browser &rarr; set a breakpoint and refresh the page

### Using IntelliJ

Right click the `interactive.html` or `interactive.js` file and select `Debug`.

- Add a breakpoint, and executing will be halted.

### Using Visual Studio Code:

Add VS Code launch configurations that open the html file for a project and attach the VS Code Debugger for Chrome. A launch config example for this is below.

```json
{
  "type": "chrome",
  "request": "launch",
  "name": "Launch interactive.html",
  "url": "file://${workspaceFolder}/track-shared/50-web-development/20-javascript/xx-presentation-code/interactive/interactive.html"
}
```
