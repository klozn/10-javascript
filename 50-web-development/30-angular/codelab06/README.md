# Codelab06 - Adding Routing to your app

Petinder starts looking like a real app by now. We have our list of pets. We can filter them by name. We can see our chosen pet's name and profile text. We can even
add our own pets to the app! However, there is one elementary thing missing from our app. We can't arrange a date yet!

- We've been showing all the content in just one single place until now. For this date component, we will show a new component in our application. Let's start by generating 
a new component. We want to have a ``setup-date`` component in a folder called ``date``.
  
  
- Let's assume we want to give the following behaviour to our application:  
    ``click pet -> info pops open to the right with a button date below it -> click date -> new date screen opens up.``
  
  
- We'll start off with some simple code, allowing us to focus on the routing principle at first. Open up the html template for the new ``setup-date`` component. Add the following code to it:
  ```
  <div class="col-md-3">
    <h1>Name</h1>
    <p>Info</p>
  </div>       
  ```

    Our first focus will be to show this component on our screen when we click the ``date`` button in our pet's information window. To do this, we need to use the Routing Angular offers us.
Remember how we were asked the question if we wanted to include routing in our new Angular application (seems ages ago when you typed ng new right?!). We chose to include it and this is why, we
  want to enable moving between components in our application.  
  Check out our app. You'll see a file called ``app-routing.module.ts`` in our app folder. It's in this particular module where we will add our routing configuration. Another option is to add it 
  straight into ``app.module.ts``, but it's best practice to use the ``app-routing.module.ts`` file for this. The only thing we have to do here, is add routes we want to use in our app. To do so,
  take a look at ``const routes: Routes = [];``. This Array of routes will contain the configuration of every route we want to have. The syntax looks like this:  
  ``const routes: Routes = [{path: 'your-desired-path', component: NameOfTheComponentYouWantToLoad}]``  
  You can add multiple routes, just separate them using commas. Try adding a route for our ``setup-date`` component. It should point to ``setup-date/name`` and of course load the ``SetupDateComponent``.
  You'll notice the name needs to change depending on the pet we're trying to set up a date with. This is called a ``route parameter``. Try to find out how to use name as a route parameter and make the change
  in our routing.
  
  
- With our routes configured, we of course need a way to follow this route. Add a button to the part of our html where we show the selected pet's name and profile text. It can look like this:
  ```
    <div class="dialog-centered">
        <a type="button"
            class="btn btn-primary btn-lg dialog-centered">
            Setup date
        /a>
    </div>
    ```
    This adds the button to our app, but of course this doesn't work yet. To fix this, we'll use ``routerLink``. Take a look at https://angular.io/api/router/RouterLink and see if you can get it working. Make sure 
the route corresponds to ``/setup-date/name-of-your-pet``.
  
- Once done, clicking the button will take you to the ``setup-date`` component. Let's extend this with some more functionality. You can start with copying the content of ``setup-date.component.html`` to the same file in your
app. Change this so that ``name`` and ``profileText`` of the selected pet are shown. Do not worry about the ``Let's Play`` button yet. This is an advanced functionality and will be tackled in the next codelab.
  
- 
    


