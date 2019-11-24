# Codelab02 - ToH Extensions

## Reactive forms

- Import the ReactiveFormsModule in CoreModule
- Check the [Reactive Forms documentation](https://angular.io/guide/reactive-forms)
- Replace the input field from the hero-search component with a Reactive Form Control that you declare in the search component
- Since a Reactive Form Control value can be fetched as an Observable stream of values, we don't need the search terms Subject anymore and we don't need to manually push values on it anymore. We can now use the `.valueChanges` property on the form control to get an Observable for this input field.
- **Extra** (but useful): check the [Reactive Form Validation docs](https://angular.io/guide/form-validation#built-in-validators) and show an error message when the name is not filled in and shorter than 3 characters
