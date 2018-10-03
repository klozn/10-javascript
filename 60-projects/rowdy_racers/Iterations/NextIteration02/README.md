# Rowdy Racers

![Rowdy Racers](../../rowdy_racers.png)

## Iteration 02

This iteration should only be started (or even looked at) when finished with the original assignment and Iteration 01.

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
    -  For this rule, a player is
considered to be part of his light trail. A player cannot pass diagonally between
another player and the most recent part (the head) of the light trail of the other
player. A player can diagonally pass behind the oldest part (the tail) of the light trail
of the other player, unless other constraints prevent this. Think of the light trail as
a chain that the player drags along.
- A player is not allowed to end the turn on the square that he started the turn on.
- If a player cannot move in an action of his turn, he is trapped and loses the game.
  -  If a player has no actions in a turn, due to the explosion of a light grenade (see further),
he skips this turn but he does not automatically lose the game.
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

#### 2.2 Power Failure 
At random moments in the game, squares can experience a power failure. Moving through a
square affected by a power failure slows a player down. Power failures behave according to the
following rules:

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
8. If a player is in a square without power at the start of his turn, :warning: **he loses an additional
action on top of any existing penalties.**

### 3. Items

#### 3.1 Light Grenades
Light grenades are items that can be picked up and used by a player.

1. When a player uses a light grenade, the light grenade is removed from his inventory and
placed on the current square of the player. Initially, the light grenade is inactive. The light
grenade becomes active when the player leaves the square.
2. An active light grenade is invisible and cannot be picked up.
3. A player cannot use multiple light grenades on the same square.
4. When any player enters a square with an active light grenade, it explodes. The player that
moved on the light grenade is blinded and loses his next 3 actions.  Or, his next 4 actions
if the light grenade is on a square without power.
5. An exploded light grenade is not active.
6. Active and exploded light grenades cannot be picked up.

At the start of the game a number of inactive light grenades is placed on the grid.
1. The placement of light grenades is random.
2. :warning: **At the start of the game, 2% of the squares contains a light grenade, rounded up to an
integer value. If this is impossible due to other constraints, then less than 2% of the squares
can contain a light grenade, but the number of squares having one should be as close as
possible to 2%.**
3. A light grenade cannot be placed on a wall.
4. There can be at most a single light grenade on each square.
5. The starting position of a player cannot contain a light grenade.
6. For each player, at least one light grenade is placed in the area of 3x3 squares that covers
the starting position of that player.

#### 3.2 Identity Discs :warning:

**Identity discs are items that can be picked up and used by a player to shoot at other players.**

1. When a player uses an identity disc, the disc is shot in a direction chosen by the user. The
direction can be up, down, left or right (not diagonal).
2. The maximum range of a shot is 4 squares: if there is no grid boundary, wall, or player in
the trajectory of the identity disc, it will end up on the 4th square from the player in the
direction the disc was shot. Consequently, the identity disc can hit players or walls that
are at most 4 squares away from the player that launches it.
3. If the identity disc hits a player, that player skips his next turn and the disc ends up on
the square of the player that was hit.
4. If the identity disc hits a wall or a grid boundary, it ends up on the square in front of the
wall/boundary. In this case, no player is hit by the disc.
5. If the identity disc enters a square with a teleporter (see below), it is teleported to the
square of the corresponding destination teleporter and continues on its path.
10
6. Each square without power on the trajectory of the identity disc, including the square
from which the disc was launched, decreases the total range of the identity disc by 1.
7. A previously launched identity disc that has ended up on some square of the grid can be
picked up again by any player.

At the start of the game a number of identity discs are placed on the grid.

1. The placement of identity discs is random.
2. At the start of the game, 2% of the squares contains an identity disc, rounded up to an
integer value. If this is impossible due to other constraints, then less than 2% of the squares
can contain an identity disc, but the number of squares having one should be as close as
possible to 2%.
3. An identity disc cannot be placed on a wall.
4. Initially, there can be at most a single identity disc on each square.
5. The starting position of a player cannot contain an identity disc.
6. For each player, at least one identity disc

#### 3.3 Charged Identity Discs :warning:

**Charged identity discs are items that can be picked up and used by a player to shoot at other
players.**

1. A charged identity disc behaves the same as an uncharged identity disc, except that it has
an unlimited maximum range.
At the start of the game, at most one charged identity disc is placed on the grid.
1. The charged identity disc is placed randomly on the grid.
2. The charged identity disc must be reachable in about the same number of actions by each
player. More precisely, the disc must be placed such that the length of the shortest path
from each player to the disc differs by at most 2 squares.
3. A charged identity disc cannot be placed on a wall.
4. Initially, there can be at most a single charged identity disc on each square.
5. The starting position of a player cannot contain a charged identity disc.
6. If it is impossible to place

#### 3.4 Teleporter :warning:

**Teleporters are items that can be used by a player, but they cannot be picked up.**

1. Each teleporter has a fixed destination teleporter. When a player steps onto a teleporter,
that player is relocated to the square of the destination teleporter. His light trail travels
with him trough the teleporter, so it can be partly at the source location and partly at the
destination location.
2. Since a player is immediately teleported to the destination teleporter, he has no chance
to pick up any items from the source teleporter location, but he can pick up items on the
destination teleporter location (if he has an action left in his turn).
3. The destination of a teleporter cannot be that teleporter itself.
4. If the destination of a teleporter A is teleporter B, then the destination of teleporter B is
not necessarily teleporter A.
5. A player is unable to step onto a teleporter if another player is on the square of the
corresponding destination teleporter.

At the start of the game, a number of teleporters is placed on the grid.

1. Teleporters are placed randomly on the grid.
2. The destination of each teleporter is chosen randomly.
3. At the start of the game, 3% of the squares contains a teleporter, rounded up to an integer
value. If this is impossible due to other constraints, then less than 3% of the squares can
contain a teleporter, but the number of squares having one should be as close as possible
to 3%.
4. A teleporter cannot be placed on a wall.
5. There can be at most a single teleporter on each square.
6. The starting position of a player cannot contain a teleporter.
12. 
## Specific Use-Cases

### 1. Start new game 

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

### 2. Use Item :warning:

- Whenever the User indicates he wants to use an item from his inventory, he should now be able to select which item.

### 3. Choose (Charged) Identity Disc Direction :warning:

- Primary Actor: 
  - The player whose turn it is.
- Precondition: 
  - It is the player's turn, and the player has performed less than 3 actions in the
current turn.
- Precondition: 
  - If the player has not yet moved during this turn, he must have more than one
action left.
- Success End Condition: 
  - The user has chosen a direction for a (charged) identity disc
- Main Success Scenario:
  - After the steps involved in the basic flow of using an item of the inventory, if the item to use is
an identity disc or a charged identity disc, then
    1. The player indicates the direction (up, down, left, right) in which to shoot the disc.
    2. The basic flow of using an item is resumed.
- Alternate Flow:
    1. (a) The user decides he no longer wants use an item and cancels the use case.
    2. The use case ends.