# Rowdy Racers

![Rowdy Racers](../../rowdy_racers.png)

## Iteration 01

This iteration should only be started (or even looked at) when finished with the original assignment.

You'll have to implement the new or changed requirements into your current solution.

Changes or new requirements are put in **bold** and are accompanied by the following icon: :warning:

(Open this file through GitHub for proper visual rendering)

### 1. Actions
The game is turn-based. During each turn, a player is allowed to perform 3 individual actions.
The kind of each action can be chosen by the player. The following kinds of actions are supported:

1. The first kind of action is to move.
2. The second kind of action is to pick up an item.
3. The third kind of action is to use an item
4. The fourth kind of action is to end the turn. In this case, an empty action is performed for
each remaining action in the turn.

#### Move action - Extra information
- During a single action, a player can move one square in any direction (vertical,
horizontal, and diagonal).
- No two players can occupy the same square at the same time.
- A player cannot occupy a square that is occupied by a wall.
- A player cannot leave the grid.
- When a player moves, he leaves a light trail behind on his previous square. The light
trail remains active during 2 additional actions. After that, the light trail disappears.
Therefore, the maximum length of the light trail is 3 squares.
- A player cannot cross any light trail: he cannot enter a square that contains a light
trail, and he cannot pass through a diagonal light trail.
    - :warning: **For this rule, a player is
considered to be part of his light trail. A player cannot pass diagonally between
another player and the most recent part (the head) of the light trail of the other
player. A player can diagonally pass behind the oldest part (the tail) of the light trail
of the other player, unless other constraints prevent this. Think of the light trail as
a chain that the player drags along.**
- A player is not allowed to end the turn on the square that he started the turn on.
- If a player cannot move **in an action of his turn**, he is trapped and loses the game.
  - :warning: **If
a player has no actions in a turn, due to the explosion of a light grenade (see further),
he skips this turn but he does not automatically lose the game.**
- If a player reaches the starting position of his opponent, he wins the game.

#### Pick up action - Extra information
- A player can only pick up an item that is placed on the same square as the player.
- A player can carry at most six items.

#### Use item action - Extra information
- A player can only use an item that is in his inventory.

### 2. The Grid
The grid on which the game is played has a rectangular shape for which the size can be configured
when the game is started. The minimum grid size is 10x10. Player 1 starts on the bottom
left corner of the grid, player 2 starts on the top right corner. The finish for each player is the
starting location of the other player.

#### 2.1 Walls
At the start of the game, walls are placed on the grid. A wall forms a barrier that a player cannot
cross.

1. Walls are placed either horizontal or vertical, and have a width of 1 square.
2. The direction of each wall is chosen randomly.
3. The minimal length of a wall is two squares.
4. The maximum length (in terms of the numbers of squares that it covers) of a vertical
(horizontal) wall is 50% of the vertical (horizontal) size of the grid, rounded up to an
integer value.
5. The number of walls is chosen randomly.
6. There is at least 1 wall.
7. At most 20% of the squares in the grid, rounded up to an integer value, is covered by a
wall.
8. A wall cannot cover the starting position of a player.

#### 2.2 Power Failure :warning:
**At random moments in the game, squares can experience a power failure. Moving through a
square affected by a power failure slows a player down. Power failures behave according to the
following rules:**


1. At the start of each turn, each square has a 5% chance of losing power.
2. When a power failure occurs on a square, the squares directly adjacent to this square lose
their power as well. The effect of that particular power failure does not spread farther
than that, but a square can be affected by multiple power failures.
3. A square that is affected by a power failure loses power for 3 turns starting from the
occurrence of that power failure.
4. Squares containing active light grenades can be lose power, and this increases the impact
of the light grenade on detonation (see further).
5. Power failures have no influence on other items (such as inactive light grenades) or the
light trail.
6. If a player enters a square without power and that square does not contain an active light
grenade, his turn ends.
7. If a player enters a square without power that contains an active light grenade, that light
grenade explodes and the player loses his next 4 actions.
8. If a player is in a square without power at the start of his turn, he can only perform 2
actions in this turn, instead of 3.

### 3. Items
Light grenades are items that can be picked up and used by a player.

1. When a player uses a light grenade, the light grenade is removed from his inventory and
placed on the current square of the player. Initially, the light grenade is inactive. The light
grenade becomes active when the player leaves the square.
2. An active light grenade is invisible and cannot be picked up.
3. A player cannot use multiple light grenades on the same square.
4. When any player enters a square with an active light grenade, it explodes. The player that
moved on the light grenade is blinded and loses his next 3 actions. :warning: **Or, his next 4 actions
if the light grenade is on a square without power.**
5. An exploded light grenade is not active.
6. Active and exploded light grenades cannot be picked up.

## Specific Use-Cases

### 1. Start new game :warning:

- Primary Actor: 
  - Any player.
- Success End Condition: 
  - A new game has been started.
- Main Success Scenario:
  1. The user indicates he wants to start a new game.
  2. The user indicates the dimensions of the grid he wants to play on.
  3. The system starts a new game with a grid of the given dimensions, according to the
rules described in Section 3.
- Alternate Flow:
  1. The user indicates he wants to start a new game.
  2. The user indicates invalid dimensions for the grid.
  3. The system notifies the user that the specified dimensions are invalid.
  4. The use case returns to step 2.