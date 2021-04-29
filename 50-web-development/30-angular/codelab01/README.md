# Codelab01 - Get started

## Let's fire up an Angular app

Just like setting up a new Java application, we'll have a few steps to follow to get started with a new Angular application. 
Let's see how we can do this! First things first: we'll need to install the Angular CLI. You can do this with the following command: ``npm install -g @angular/cli``.
npm install speaks for itself, the -g means it will be installed globally which makes the CLI available in your entire system.

- We will start by creating our new application folder. No need to start right clicking and making new directories straight away. 
  Angular has a nice way of doing multiple steps by issueing one single command: ``ng new``! Create a new app by typing ``ng new <appName>`` 
  in the terminal. You can choose any name, just remember we're making a dating service for pets :heart_eyes:. Be creative.
  
- You'll notice some questions being asked while generating your app. We want the default options installed: You can go for ``stricter type checking``, ``routing`` and ``Regular CSS`` as styling!
  
  
- After doing this, a new app will be created and it will even work if you fire it up. Angular applications can be started by typing
``ng-serve`` in the terminal. Doing so will compile your code and start a server. By default, you'll be be able to access it through
  http://localhost:4200. Start up your freshly made application and check what it looks like in your browser.


- For now, we have a default Angular application running. Time to start making some changes! Let's start with a baby-steps though. We're going
to do two things.
  - Remove the default template Angular is showing us right now. You can do this by deleting the html code from ``app.component.html``. Replace it with ``<h1>Petinder</h1>`` for now.

    
- We just hardcoded the title in our html code, but that feels a bit basic right? When you open up ``app.component.ts``, you can see where the title is being set. 
  Change its value to the title you chose (or just stick with our million-dollar idea: Petinder :moneybag: :moneybag: :moneybag:)
  

- You changed the title in ``app.component.ts`` but nothing is showing yet in your browser? Well, you just emptied your ``app.component.html`` file, which kinda
explains a lot. This html is your template file. It contains what you will be showing. So we'll need a small adjustment there as well. ```<h1>{{title}}</h1>``` should
  do the trick!
  * Some extra info: The double curly braces are also known as interpolation. In our app component (``app.component.ts``), we declared a variable title and gave it a value. 
We can use interpolation to display the value of this variable in the corresponding component template (``app.component.html``).


- Not necessarily Angular related, but nevertheless very important in a HTML environment. Copy the contents of the ``styles.css`` file to the ``styles.css`` file you can find in
the root dir of your app. Doing so should give already your app a different look.


We now have a working Angular application. We got rid of the default contents and replaced it with the title of the app we're going to build. For now, we only have one component in
this app, which consists of ``app.component.ts``, containing the component's logic, and ``app.component.html``, containing the template we will be showing in our browser.
Afterwards we also added some prefab styling that we will use throughout the building of our app.
