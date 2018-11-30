# Codelab: Branch

## 1. Setup

Locally, we're going to create the following directory in which we **initialize** a new git repository.

It should look like this:
```
|-- toys
    |-- furby.txt
    |-- .git  
```

Now, do the following:
1. Add the following line of text to `furby.txt`: `19,99 EUR`.
2. Start tracking `furby.txt`.
3. Make a snapshot of the current (tracked) state of your repository by committing (use `furby.txt created and initial price added` as the commit's message)
4. Make sure there are no changes present (check with git's status command), and that your history has one commit (git's log command). 

Your commit history should look similar to this:
```
commit bccbff381ab507eba49031b4d18e9f472be2b750 (HEAD -> master)
Author: nielsdelestinne <hiding-my-mail@nospam.org>
Date:   Fri Nov 30 14:47:06 2018 +0100

    furby.txt created and initial price added

```

## 2. Create a branch

Create a new branch called `experimental`, it will contain some experimental toys (not yet suited for our main (master) branch).

To create a new branch called `experimental`, use the following command: 
```
git branch experimental
```
> the new branch will point to the current HEAD. At the moment, HEAD is pointing to commit bccbff... (see your commit history)

Branch `experimental` should be created, but currently, we're still on branch `master`. 
Validate this by using the following command:
```
git branch
```

Which should show the following (the (*) asterisk symbol indicates the currently checked out branch (HEAD)):

```
  experimental
* master
```

Using `git log`, you should see the following (mind the branch experimental. HEAD is still pointing at master):
```
commit bccbff381ab507eba49031b4d18e9f472be2b750 (HEAD -> master, experimental)
Author: nielsdelestinne <hiding-my-mail@nospam.org>
Date:   Fri Nov 30 14:47:06 2018 +0100

    furby.txt created and initial price added

```

Now, switch to the experimental branch using command:
```
git checkout experimental
```

again, use command `git branch` to show the local branches:

```
* experimental
  master
```

Using `git log`, you should see the following (mind the branch experimental. HEAD is now pointing at it):
```
commit bccbff381ab507eba49031b4d18e9f472be2b750 (HEAD -> experimental, master)
Author: nielsdelestinne <hiding-my-mail@nospam.org>
Date:   Fri Nov 30 14:47:06 2018 +0100

    furby.txt created and initial price added

```

> Sidenote: Creating a new branch and switching to it can be combined into one commando: `git checkout -b experimental`

## 3. Make changes to the branch

Start by inspecting the directory `toys`. It should still hold only one file (`furby.txt` with content `19,99 EUR`).

Now, when still on the `experimental` branch, add a new file called `killerRobot.txt` (which is a rather experimental toy). To the file, add the following content `4950 EUR`.

Start tracking the new file and commit it using message `killerRobot added with initial price set`.

Using `git log`, check your commit history. It should look similar to this:
```
commit 1039ffc539796c15a712da6f7d56eb1ec5032536 (HEAD -> experimental)
Author: nielsdelestinne <hiding-my-mail@nospam.org>
Date:   Fri Nov 30 14:59:22 2018 +0100

    killerRobot added with initial price set

commit bccbff381ab507eba49031b4d18e9f472be2b750 (master)
Author: nielsdelestinne <hiding-my-mail@nospam.org>
Date:   Fri Nov 30 14:47:06 2018 +0100

    furby.txt created and initial price added

```
 
Now our branch experimental is ahead of branch master by one commit!
We can add some extra options to `git log` to get a very nice graph overview of our history (one very similar to the visual representation we have in our slides):

Execute the following command:
```
git log --all --decorate --oneline --graph
```

it should show something like this:
```
* 3a562a9 (HEAD -> experimental) killerRobot added with initial price set
* bccbff3 (master) furby.txt created and initial price added
```
Which can we really read as the visual representation from our slides (see example below)
```
                            (HEAD)
     [master]           [experimental]
        |                     |
        |                     |
   -----------           ----------- 
   | bccbff3 | <-------- | 3a562a9 |
   -----------           -----------

```

## 4. Switching branches

Our `experimental` branch currently contains 2 commits (we start from the commit to which our branch points and then traverse every child)
- `3a562a9`: introduced the new file `killerRobot.txt` with some content
- `bccbff3`: introduced the new file `furby.txt` with some content

Our `master` branch currently contains just 1 commit
- `bccbff3`: introduced the new file `furby.txt` with some content 

> You will have different hashes.

Currently, `HEAD` is pointing at branch `experimental` (thus this branch is the active branch). 
Every file created (and all of its changes) made in one of these commits, will be shown in your file explorer!

```
|-- toys
    |-- furby.txt
    |-- killerRobot.txt
    |-- .git  
```

Now, let us switch back to our `master` branch.

```
git checkout master
```

inspect the current history (`git log --all --decorate --oneline --graph`):

```
* 3a562a9 (experimental) killerRobot added with initial price set
* bccbff3 (HEAD -> master) furby.txt created and initial price added
```

Now, HEAD is pointing at master.

```
      (HEAD)                    
     [master]           [experimental]
        |                     |
        |                     |
   -----------           ----------- 
   | bccbff3 | <-------- | 3a562a9 |
   -----------           -----------

```

The only commit to traverse is `bccbff3`. That commit created file `furby.txt` with some initial content. There was no trace of `killerRobot.txt` back then.
Therefore, if you now inspect your file explorer, you'll see that file `killerRobot.txt` is gone.

```
|-- toys
    |-- furby.txt
    |-- .git  
```

So, the only thing you see in your file explorer, is the (snapshot of the) state as it was up until that point (branch) in history.

By switching back to branch `experimental`, you'll see that the file `killerRobot.txt` is again being shown in your file explorer.

## 5. Diverging histories

Switch back to branch `master`. Validate that this is your current history (and active state):
```
* 3a562a9 (experimental) killerRobot added with initial price set
* bccbff3 (HEAD -> master) furby.txt created and initial price added
```

Now, when on `master`, create a new file `drone.txt` to which you add as content `95,90 EUR`.
- Then, start tracking it
- Commit it with message `adding drone.txt with initial price`

Execute the following command (to visually, as a graph, show the commit history):
```
git log --all --decorate --oneline --graph
```

The result should look like this:
```
* fd08822 (HEAD -> master) adding drone.txt with initial price
| * 3a562a9 (experimental) killerRobot added with initial price set
|/
* bccbff3 furby.txt created and initial price added
```

Our branches now have a diverged history!

Our `experimental` branch currently contains 2 commits (we start from the commit to which our branch points and then traverse every child)
- `3a562a9`: introduced the new file `killerRobot.txt` with some content
- `bccbff3`: introduced the new file `furby.txt` with some content

Our `master` branch currently contains 2 commits (we start from the commit to which our branch points and then traverse every child)
- `fd08822`: introduced the new file `drone.txt`  with some content
- `bccbff3`: introduced the new file `furby.txt` with some content 

_'checking out'_  branch `master` will show file `drone.txt` and file `furby.txt` in your file explorer.
- try this!

_'checking out'_  branch `experimental` will show file `killerRobot.txt` and file `furby.txt` in your file explorer.
- try this!



