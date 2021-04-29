# Codelab03 - Showing our pets on the screen

## Time to show some content

With our basic layout structured and working, it's time to finally show some content. In real Tinder, it's all about the pics, so let's get
our pets on the screen! For this, we have a basic Java backend running which is connected to a PostgreSQL database, all in Heroku. This codelab will teach us
how to fetch this data from within our Angular app and show it to the world! Even though our backend app is available through Heroku, we will check it out 
locally and spin it up ourselves. This way, we can check and/or change backend code if needed (spoiler: you won't have to change a lot). It helps understanding
what is needed to enable our back- and frontend to talk to each other.

- From this point on, we will have to take our backend into account. We're not just showing pets, we're going to fetch them from a backend which has
its own peculiarities and rules. In our Java code, we have defined what a Pet object needs before it can be a real Pet object. Have a look at it and check the
  necessary fields for a Pet object.

  
- In Angular, we also need to define what a Pet object consists of. Similar to Java, we will make a Pet class that has the necessary fields. For structure, make a 
model directory in our app's root folder. Inside of that model directory, create a new file and call it Pet.ts. Inside this file, we will write the code to define
  a Pet object's contents. The syntax looks like this:
  > export interface Pet {  
variable1: type;  
  > variable2: type;  
  > and so on...<br>
  }
   
    You can fill this up with the contents you find in our backend Pet class (look at the constructor for this). Obviously you need to adjust types to the  correct syntax.
For most fields, this will be easy. There's only one field where the type uses a different naming. (pro-tip: you've used this type in the previous codelab).
  

- We will be showing our pets in some sort of profile gallery. This profile gallery calls for a new component. Start by making a new component called ``profile-gallery``. Next to 
this, we will also need a service that contains the logic that tells our app where and how to get its data. Again, the Angular CLI provides us with an easy way to do this. In your root
  directory, type ``ng g service service/pet``. You'll see that ``pet.service.ts`` has been created inside the service directory. Open it and inspect its content.
  

- There is one, very important, part in this file which we need before our service can be used. Our profile-gallery component needs to be able to use our service. We will enable this through dependency 
injection. The Angular docs describe this as follows:
  
    > Dependencies are services or objects that a class needs to perform its function. Dependency injection, or DI, is a design pattern in which a class requests dependencies from external sources rather than creating them.
     Angular's DI framework provides dependencies to a class upon instantiation. You can use Angular DI to increase flexibility and modularity in your applications.  
 
    You'll see in ``pet.service.ts`` that we use the ``export`` statement. This is used to export this service, which enables other parts of our app to find and import it. Right above this export statement,
you'll notice the ``@Injectable`` annotation. This decorator specifies that Angular can use this class in its dependency injection system, allowing us to inject our PetService through the constructor in each class that
  requires this. The added metadata, ``providedIn: 'root'``, simply means that our PetService is visible throughout the entire application.
  
    > Little sidenote: it is best-practice to separate components and services. It is possible to combine a component and a service in the same file, but this doesn't help general readability of your codebase.
     However, should you decide to do so (please don't :wink:) , you have to define the component before the service. Angular will return a null reference error if you would do it the other way around.
  
- All right, now that we are up to speed with the creation of a service and what the basic look of such a service is, let's start with adding logic to it. What do we want our service to do for now? We want it to talk to
our backend through use of its api. In other words: we want our app to fetch the response one of our backend endpoints gives us. In this case, we want to get the data that we receive by going to ``http://localhost:8080/pets``.
  To do this, we need to add a few basic things.
   
    - First, we want to declare a variable which will get the value of the url we want to **get** our response from. Start by declaring a private string variable. If you're unsure how the syntax goes, take a look at previous
    codelabs.
      
    - Our PetService will need a constructor where we set this url. To this constructor, we pass on a class called ``HttpClient``. This class will enable us to perform HTTP requests. Exactly what we need here! The basic look of a
    constructor is:
      ``constructor() {...}``. As an argument, we will pass on ``private http: HttpClient``. You'll notice that HttpClient will get imported once you add this. Inside of this constructor, we want to set our newly created string variable.
      It should receive the value of the url it needs to perform a request to. We will write this as follows: ``this.yourVariableName = `${environment.backendUrl}/pets`;``. Don't worry about ``backendUrl`` not being recognized, we'll fix 
      it right now!  
      

- As you probably have guessed by yourself, backendUrl is a variable which our service will go look for in the environment class. In your app, you will notice a folder ``environments``. Inside of it, there are two files. One is being used
for production (your live app) and one for development purposes. Since we are working with localhost, let's open the one intended for development purposes: ``environment.ts``. In there, you will see the production variable which is set to
  false at the moment. Below that, add the backendUrl variable and set it to ``'http://localhost:8080'``. This should solve the problem in our service.  
  

- Back to our PetService! We're almost done here, the only thing left to add is a function which will go to this url and return the response. Let's write our ``getPets()`` function!

     - A function in TypeScript can be written as follows: ``methodName(): returnType {...}``. In the case of this method, we will call it getPets() and the return type will be an Observable. A small word on that:
    
    > Angular makes use of observables as an interface to handle a variety of common asynchronous operations. In our case, we are using the HTTP module to handle requests and responses. HTTP calls are asynchronous because we have no guarantee how
     fast the response will reach us. If this call would not be async, our app will not work the way we want it to. With the Observable, we basically tell our application to perform the call and wait until the response is received. Once that happens,
     the dependent classes, called observers, are notified, and the data is processed as needed.
     
    - Our return type will be ``Observable<any>``, enabling our Observable to deliver multiple values of any type—literals, messages, or events, depending on the context.
    - Inside our ``getPets()`` body, we will make the call to our backend and return the response. This can be simply done by typing ``return this.http.get(this.yourVariableName);``

    
- That's it for our service! It should now have all the logic required to enable our component to make a call to our backend and return the response. Let's change our focus to our component now. Go to ``profile.gallery.component.ts``. Inside of this
  component, you will notice the same structure as we saw in the previous codelab with our header and footer components. In order for our html to show us our pets on screen, we are going to add variables and functions here that can take care of this for us.
  Let's think about **what** we will be showing. On our screen, we'll see a few rows of pets, with the photo and name of each pet in our database. The styling will be done through our HTML/CSS, no need to worry about that. We'll add it later. What we are talking
  about right now is not how it looks, but **what** we will be processing under the hood. We are going to make an Array of Pet objects and show these on our screen!
  
  - You'll notice that our class name is followed by ``implements OnInit``. A small word on the OnInit method from the Angular docs:
  > A lifecycle hook that is called after Angular has initialized all data-bound properties of a directive. Define an ngOnInit() method to handle any additional initialization tasks.  
  
  Basically, the implementation of this interface will allow us to use the ngOnInit() method. The ngOnInit() method is called to handle any additional initialization tasks. So why would we have both a ngOnInit() and a constructor present? Don't they serve the same purpose?
Some clarification on this:
  
  > Construction happens when the JavaScript class is constructed. It's essentially the first thing that can happen to a class instance. Initialization, on the other hand, happens after that when the component is fully initialized. In essence, this means when Angular is done plugging all the pieces together.
   Construction is first, but happens when the component isn't really a component yet. So therefore the constructor should only contain very basic simple code relating to basic initialization of the class. You will have the injected services, but that's about it.
     
   The ngOnInit method, on the other hand fires when the component is ready to be a component and ready to get to work. Therefore, just about all startup code should be placed here by default. Whether this is making HTTP calls, making calls to dependent services, or other similar items. 
   We can even put our initial state initialization here and it's just fine. There's no drawback to putting it here instead of in the constructor.  
   
   So a quick rule of thumb is to consider code in the constructor to be a code smell, and look at it closely to make sure that it shouldn't actually be in your ngOnInit method.
  
    With that out of the way, we have a better idea of what to put in our constructor and what to put in our ngOnInit() function. Let's handle the constructor first. 
    * Just like you injected the HttpClient class before, inject our PetService class here.
  
  This is all the info we want to add to our constructor for now. Let's move to our ngOnInit() function.
    * Add a new function below the constructor, called ngOnInit(). In the function body, call the getPets() function. We will create it soon. Make sure to call it on the current instance of our component.
    * We will be working with a Pets Array. Declare one at the start of the component. Call it pets, make sure it consists of Pet objects and initialize it as an empty array.
    * Make a getPets() function. Make it return nothing (same return type as Java). Inside the function's body, call the getPets() which is present in the PetService. We can access this since we injected in into
  our constructor. As this returns an Observable, we need to ``subscribe`` to this function. You'll notice that ``subscribe`` is available when you type the . operator behind getPets(). As a parameter for subscribe(), you can declare a variable pets which gets set to your current Array of Pets.
      In TS, it translates to ``(pets => this.yourArrayOfPets = pets);``.  
      
* All right! Almost done (phew). We just need to add code to our html template to actually show what we just coded. To do this, copy the code which you find in ``profile-gallery.component.html`` in this repo and paste it into the same html file in your Angular app. Everything you need is there, except
the final parts. In the lowest level ``<div>``, we need to provide some changes for our collection of pets to be shown on the screen. To do this, we will use ``ngFor``. This is one of Angular's built-in directives. Take a look at https://angular.io/guide/built-in-directives and see if you can get it working.
  Can't get it done? Remember to **timebox** your search (not longer than 1 hour) for the solution and ask for help if needed! 
    - For the images, you can just link to heroku. ```[src]="'https://pettinder.herokuapp.com/'+ pet.image"``` should do the trick.
    - Want to show the name of each pet? Remember interpolation, we talked about it in the second codelab.

    
  > Some extra info: NgFor is used to present a list of items. The Angular doc tells us it is used for:  
  > 1. Define a block of HTML that determines how Angular renders a single item.  
  > 2. To list your items, assign the short hand let item of items to *ngFor.
  > If you want more info on this, the Angular website has a more extensive explanation. For now, know that you can compare it to a foreach in Java.- 

* Time to try out your code! Open up your localhost:4200 and see what it is you're showing on your screen. Not seeing any pets? Getting weird message about CORS and such? That is because we forgot one important thing. Our application needs to be "allowed" to talk to our 
backend. To do this, we need to add one small annotation in our backend. Go to our ``PetController``. Above the class definition, type ``@CrossOrigin(origins = "http://localhost:4200")``. Reboot your server and try again. Everything should work now!
  
  > Want some more info on CORS and some more specific use-cases? Take a look at https://www.baeldung.com/spring-cors 

- All these steps should have given you an app that now shows you each pet in the database, with the corresponding image and the pet's name. In the next codelab
we will focus on filtering this list and adding the ability to create a new pet! But don't forget to take a break first, you earned that :coffee:! :muscle: 

