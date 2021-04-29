# Codelab02 - ToH Extensions

## Refactor Top Heroes to a reusable component

> The **Top Heroes** component is an ideal candidate to refactor to a reusable component.

- Create a new component (using the angular CLI of course) and attach it to the SharedModule
  > You can do this in one go using the -m option and specifying the module starting at the root folder which is `/src`.
- For a reusable component it's important that we don't have any dependencies on services, so make sure to pass the heroes trough a component input parameter
  > You'll probably want to move the slice logic from the dashboard (to only show a few heroes) to the component as well, as that is the Top Heroes component responsibility
- Only pass the Observable value to the dumb component (remember the `async` pipe?)
