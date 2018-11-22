# 30-angular 

## Prerequisites
- All JS course prerequisites
- Angular CLI &rarr; `npm install -g @angular/cli`
- [Augury](https://chrome.google.com/webstore/detail/augury/elgalmkoelokbchhkhacckoklkejnhcd) (Chrome extension)

## Tour of Heroes - Extensions

### Refactor the modules to a more maintainable structure
- Create a CoreModule that contains all the core services and types. Things like the BrowserModule, FormsModule, can also go here.
> Make sure services are actually attached to the CoreModule and not registered using the _providedIn_ option of **Injectable**. Stuff from from the CoreModule that has to be available to the rest of the application will also need to be exported. Providers (services) are automatically available in the rest of your application.
- Create a SharedModule that contains all the dumb / reusable components
> If you inspect the existing components, there are no dumb / reusable components in the ToH app yet, so this module will remain empty for now. A SharedModule is in fact a reusable component library, so normally you'll export every declared component from this module.
- Create a FeatureModule that contains all the smart / non-reusable components
- Make sure everything still works and tests still succeed
> The goal is to keep the AppModule as clean as possible and only import the **CoreModule**, **SharedModule**, **FeatureModule** and root **RouterModule** there.

### Reactive forms
- Import the ReactiveFormsModule in CoreModule
- Check the [Reactive Forms documentation](https://angular.io/guide/reactive-forms)
- Replace the input field from the hero-search component with a Reactive Form Control that you declare in the search component
- Since a Reactive Form Control value can be fetched as an Observable stream of values, we don't need the search terms Subject anymore and we don't need to manually push values on it anymore. We can now use the `.valueChanges` property on the form control to get an Observable for this input field.
- **Extra** (but useful): check the [Reactive Form Validation docs](https://angular.io/guide/form-validation#built-in-validators) and show an error message when the name is not filled in and shorter than 3 characters

### Refactor Top Heroes to a reusable component
> The **Top Heroes** component is an ideal candidate to refactor to a reusable component.
- Create a new component (using the angular CLI of course) and attach it to the SharedModule
> You can do this in one go using the -m option and specifying the module starting at the root folder which is `/src`.
- For a reusable component it's important that we don't have any dependencies on services, so make sure to pass the heroes trough a component input parameter
> You'll probably want to move the slice logic from the dashboard (to only show a few heroes) to the component as well, as that is the Top Heroes component responsibility
- Only pass the Observable value to the dumb component (remember the `async` pipe?)

### Get the arch enemy for a hero
> A new API endpoint appears! By querying `/api/archEnemies/byHero/{hero_id}` you can fetch the arch enemy for a certain hero.
- Create a new service (arch enemy service for example)
- Try fetching the villain for a hero of your choosing, subscribe to the observable and log the result in the console to see what data you get
- Now create a new arch enemy component that gets a hero id as input and displays the arch enemy information by fetching it from the new service
- Use this new component on the hero detail component

### Http interceptor
- {duplication}
- Check the [HttpInterceptor documentation](https://angular.io/guide/http#write-an-interceptor)
- Write a HttpInterceptor to prefix the url of each request with the backend base url (the `http://{ip_address}:3001/api` part)
> You'll have to clone the request, and set a new url, made from the base url and the request url. Don't forget to change the heroesUrl to just `/heroes`.
