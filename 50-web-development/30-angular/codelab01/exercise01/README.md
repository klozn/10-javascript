# Codelab01 - Observables

We'll continue from the code you wrote in the previous exercise.

We want to get rid of this manual boilerplate labour of having to save the subscription and manually unsubscribe when our component gets destroyed. To automate this Angular has the `async` pipe (remember the `|` pipes?).

The `async` pipe automatically waits for an event coming from an observable before displaying anything. It will automatically `subscribe` and `unsubscribe` when a component it's used in is created or destroyed!

---

- Instead of saving the subscription in your component, remove the `.subscribe` and save the `observable` instead. Remember to postfix this variable with `$` as is thee convention.
- Use this variable somewhere in the view (html) of your component with the `async` pipe.

```html
<p>{{pointerPosition$ | async}}</p>
```

> The string we return now is very specific and should not really be part of our logic but should be inside our view.

- Fix this by changing our `map` operator to map to an object instead of a string, using the following structure:

```json
{
  "x": clientX,
  "y": clientY
}
```

- Change the view to use the data from this object, effectively moving the string to the view itself, where it belongs

```html
<p>
  Position = {{(pointerPosition$ | async).x}}px on the X axis and
  {{(pointerPosition$ | async).y}}px on the Y axis
</p>
```

> There are two problems with this approach
>
> - We subscribe to the observable twice, which isn't very efficient
> - We might get errors when no event has been fired yet (the async will emit `null` as its first value, before any event has arrived)

> We can fix this by using `async` in conjunction with `ngIf`!

- Refactor your template to the following:

```html
<div *ngIf="pointerPosition$ | async as pointerPosition">
  <p>
    Position = {{pointerPosition.x}}px on the X axis and {{pointerPosition.y}}px
    on the Y axis
  </p>
</div>
```

> This way, we don't even show the template before an event has arrived, circumventing the problem with `null`-errors. We also only subscribe only once, nice!

> There's another cool trick we can pull with this. A lot of times you'll be using this `async` pipe to wait for an http request. In other words, your data is still loading. If we also use `ng-template` in combination with `ngIf` we can show the user that something is still happening while they're waiting.

- One last refactor:

```html
<div *ngIf="pointerPosition$ | async as pointerPosition; else loadingTemplate">
  <p>
    Position = {{pointerPosition.x}}px on the X axis and {{pointerPosition.y}}px
    on the Y axis
  </p>
</div>

<ng-template #loadingTemplate>
  Waiting for first mousedrag...
</ng-template>
```

How cool is that!
