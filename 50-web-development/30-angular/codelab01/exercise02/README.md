# Codelab01 - Observables (extra)

The goal of this exercise is to **show the first hero when you press up** and the **last hero when you press down**. In other words, you'll need the `HeroService` for this, don't forget to inject it into the component you're writing this in first.

> Hint: make it easier on yourself by splitting streams up into small observables (stored in separate variables) with a clear responsibility that you save in local variables

- Start from an observable that emits on `keydown`

> For an example on how to start, look at the first `fromEvent` used in the `mouseDrag$` observable but change the event from `mousedown` to `keydown` and type the observable as a `KeyboardEvent` instead of a `MouseEvent`

- Create two other observables starting from the previous one

  - One that only lets events for the key `ArrowUp` pass
  - One that only lets events for the key `ArrowDown` pass
    > You can import the filter operator for this

- Map the `ArrowUp` event to the first hero from the complete hero list
- Use the `switchMapTo` operator to **map from the key observable to the getHeroes observable**
- Use the `map` operator to map this to the first or last hero depending on the pressed key
- Map the ArrowDown event to the last hero from the complete hero list
- `Merge` these two streams into one and get just the hero name
  > `Merge` is a static operator so you don't need to use it inside a `.pipe` chain, don't forget import it though
