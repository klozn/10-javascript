# Codelab02 - Basic layout

## Let's get a basic layout going

When setting up our frontend, there's A LOT of things we want to get working. The best approach is to do this in small steps. Our first step was setting
up a basic, working application. We did this in codelab01. Let's extend on this by creating a basic layout. No specific logic just yet,
only a structured layout. Both in our codebase and in our browser.

- Right now, we have a general app module and component in our application. Adding all our logic into this single component is possible, but it defeats the 
purpose of the Angular framework. Working with multiple components defines the building blocks that complete our entire app and makes everything more 
  manageable and structured. Let's start by separating our layout, by making a dedicated module for this. We can generate this through the Angular CLI by typing 
  ``ng g module layout``. The ``g`` is short for ``generate``. Both short version and full word can be used and will yield the same result.
  

- Right now we have a layout module in our Angular app. We want to divide our layout in three parts. A header, a footer and the main body in between. For both header and footer,
we will create two separate components inside our layout module. Before we do this, let's take a look at the difference between a component and a module. 
  
>A **component** instance has a lifecycle that starts when Angular instantiates the component class and renders the component view along with its child views. The lifecycle continues
with change detection, as Angular checks to see when data-bound properties change, and updates both the view and the component instance as needed. The lifecycle ends when Angular
destroys the component instance and removes its rendered template from the DOM. A component must belong to an NgModule in order for it to be available to another component or application. 
> To make it a member of an NgModule, list it in the declarations field of the corresponding NgModule metadata.
> 
> **Modules**
In general, a module collects a block of code dedicated to a single purpose. Angular uses standard JavaScript modules and also defines an Angular module, NgModule.
In JavaScript (ECMAScript), each file is a module and all objects defined in the file belong to that module. Objects can be exported, making them public, and public objects can be imported for use by other modules.
Angular ships as a collection of JavaScript modules (also called libraries). Each Angular library name begins with the @angular prefix. Install Angular libraries with the npm package manager and import parts of them with JavaScript import declarations.
> 
> So in short: components are the building blocks of your Angular app. Modules are collections of these blocks dedicated to a single purpose. In this codelab, we will create the layout module which will consist of a header and footer component.

- Let's get back to our code. Now that we know what modules and components are, let's make the header and footer component in our layout module. To do so, navigate to the corresponding layout folder in your terminal. Once inside that folder, type
``ng g component header`` and do the same for ``footer`` and ``layout``. This will create three components that are tied to the layout module. Want to be sure everything is correctly configured? Head over to ``layout.module.ts`` and check the contents of that file. 
  As said before, the header and footer component should be under declarations. If they are not there, you can add them yourself. Your declarations should look like this:
  > @NgModule({ 
  > declarations: [ <br>
  LayoutComponent,<br>
  HeaderComponent,<br>
  FooterComponent<br>
  ],

- Inside your ``layout.component.html``, you'll find the tag ``<router-outlet></router-outlet>``. This has to do with us including Routing capabilities to our application. More on that later, but you'll notice it will break your application. To solve this, our layout module 
needs to know the ``RouterModule``. Make sure to import this module as well.


- Time to add some html to our html template files (don't forget to put ``heart.png`` in the right folder). Copy the html code you find in the header, footer and layout files in this codelab to the corresponding files in your application. Still serving your application? You'll no doubt have noticed everything broke.
Can you spot the errors? It includes some things we did in the previous codelab.
  
  
- The culprits are two variables we haven't declared yet. ``{{year}}`` and ``{{title}}`` (again) aren't known yet. Just like we did in the first codelab, we will have to declare them in our corresponding component file. ``{{title}}`` needs to be declared and set 
in our ``header.component.ts``. ``{{year}}`` needs to be in ``footer.component.ts``. While the header is just a title, we want the year to update automatically when we have entered a new one. We'll first guide you through adding the title. 
  * In the previous codelab, we just
  added the title variable and gave it a value. We can do this in a more encapsulated manner. Start by declaring the title as a string. Just like in Java, you can do this at the top of your class. The syntax is slightly different: 
    >private title: string;
  * Because we are using encapsulation here, we will find more similarities with Java. In order to **get** our title, we need a constructor. The syntax for this is: 
    >constructor() {<br> this.title = 'Petinder'<br> }
  * This leaves us with just a getter to be made. For this, the syntax is:
    > get title(): string {<br>
    return this._title;<br>
    }
     
- This should solve the problems with ``{{title}}``. That leaves ``{{year}}``. You can do the same actions you did for ``{{title}}``, except we want our year to automatically update so some more logic is needed. We're not gonna spoil the fun for this one, you'll have to find
it for yourself. Just a few hints to get you going:
  > a date is a number in js<br>
  > just like in Java, you can call methods on certain classes to do things (perhaps there is even a Date class?)
   
- After finishing this, make sure you are showing the right module and its components. Unless you changed it, you'll probably still seeing the original implemantation. The problem lies in the ``app.component.html`` file. This file doesn't show our layout module yet. You can change this by deleting the contents and writing
``<app-layout></app-layout>``. By doing this, you will instruct this html file to show the contents it can find under the component that is defined by the name ``app-layout``. Still not working? Make sure the ``LayoutComponent`` is being exported, otherwise our ``app.module`` can't find it.
  
> Some more info on this: app-layout is the name of our layout component. You can find it in **layout.component.ts**.
> @Component({<br>
selector: 'app-layout',<br>
templateUrl: './layout.component.html',<br>
styleUrls: ['./layout.component.css']<br>
})
> 
> Every component has a selector, making it easy to use them as building blocks for your apps. Take a moment to go through each component you made. Check the selectors, check where they are already used and how
> everything is tied together. It will help you understand Angular apps and how they work.
