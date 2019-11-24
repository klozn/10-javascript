# Codelab01 - Observables

In your `Tour of Heroes` application, inside the `ngOnInit` in `app.component.ts` (if it doesn't exist yet, implement the `OnInit` interface and add the `ngOnInit` lifecycle hook), add the following TypeScript code:

```typescript
const mouseDrag$ = fromEvent<MouseEvent>(document, "mousedown").pipe(
  mergeMapTo(
    fromEvent<MouseEvent>(document, "mousemove").pipe(
      takeUntil(fromEvent<MouseEvent>(document, "mouseup"))
    )
  )
);
```

Hard to read, `true`, but no matter! This `mouseDrag$` variable gives you an observable that fires mouse events whenever you're dragging the mouse. The `$` stands for `stream` in the context of observables.

- `subscribe` to it and log whatever you're getting to the console!

> `subscribe` will take a function as the first argument, this function will get executed for every event at unknown times and you define what happens with them `(event) => { ... }`

- Before the `subscribe`, add the `.pipe` method which allows you to chain **rxjs operators**
- In this `pipe`, `map` the pointer events to the following string: `“Position = ${clientX}px on the X axis and ${clientY}px on the Y axis”`

> (import and use the rxjs `map` from `rxjs/operators` operator)

- Check to see that after implementing this `map` the string gets logged instead of the plain MouseEvents.

> Using the `tap` operator you can execute a function anywhere in the sequence of operators in the `pipe`

- Use the `tap` operator to also log the MouseEvents again by adding it before the `map` operator that transforms your MouseEvents into a string

That's it, we'll continue building upon this observable chain in the next exercise!
