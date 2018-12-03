# Codelab: Remote branches 02

## 1. Setup

1. Start by creating a fork of [https://github.com/switchfully/git-starter-02](https://github.com/switchfully/git-starter-02)
    - This repository contains the exact same history as the final result of the previous codelab (Remote branches 01).
    - A fork is a full copy of a repository. _Forking a repository allows you to freely experiment with changes without affecting the original project._
    - To create a fork, read the following resource (we recommend you use your GitHub account)
        - GitHub: https://help.github.com/articles/fork-a-repo/
2. On your own GitHub account, you should see a new repository which is the fork.
3. Locally, create a new directory in which you **clone** your fork.
    - `git clone https://github.com/<your-username>/git-starter-02`
        - `<username>` should not be `switchfully`. If it is, you're not cloning your own fork!
    ```
    Cloning into 'git-starter-02'...
    remote: Enumerating objects: 12, done.
    remote: Counting objects: 100% (12/12), done.
    remote: Compressing objects: 100% (6/6), done.
    remote: Total 12 (delta 4), reused 10 (delta 2), pack-reused 0
    Unpacking objects: 100% (12/12), done.
    ```
4. After cloning, navigate to subdirectory `git-starter-02`.
5. Then, inspect the following:
    1. Your local branches (+ showing the tracking branches): `git branch -vv`
        ```
        * master ed8d73c [origin/master] Commit D: Tank ammunition 8 -> 10
        ```
    2. Your remote-tracking branches: `get branch -r`
        ```
        origin/HEAD -> origin/master
        origin/feature-tank-movable
        origin/master
        ```
    3. Your project history: `git log --all --decorate --oneline --graph`
        ```
        * ed8d73c (HEAD -> master, origin/master, origin/HEAD) Commit D: Tank ammunition 8 -> 10
        | * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
        | * 3720274 Commit B: Tank movable feature - partially implemented
        |/
        * f2ce81d Commit A: Tank added
        ```
6. What we see is the following:
    - We have one local branch (`master`). This branch is a tracking branch. It's upstream branch is set to`origin/master`. This is all created and configured automatically upon cloning.
    - We have 2 remote-tracking branches: `origin/feature-tank-movable` and `origin/master`. At the remote.
        - Reference `origin/HEAD` points to `origin/master`. The `origin/HEAD` is used (i.e.) to determine what branch to check out by default upon cloning (that's why we already have a local branch `master`).
    - The full project history was downloaded. 
    
## 2. Create a local branch from a remote branch

Currently we don't yet have a local branch of `origin/feature-tank-movable`. Remember how remote-tracking branches such as `origin/feature-tank-movable` in our local repository are read-only, we can't directly move its pointer. 

When we want to work on - and make changes to - the remote `feature-tank-movable` branch, we need have a local version of the branch. Any new changes can then be pushed back onto the remote branch, from the local branch. 

In the current situation, the easiest way to create a local branch out of the remote branch `feature-tank-movable` is the following:
```
git checkout feature-tank-movable
```
Resulting in:
 ```
Switched to a new branch 'feature-tank-movable'
Branch 'feature-tank-movable' set up to track remote branch 'feature-tank-movable' from 'origin'.
```
- We have done this before:
    - Normally, this command checks-out (switches to) a specific branch (ref). If it does not exist, an error will be thrown.
    - However, if the branch does not yet exist locally (e.g. `feature-tank-movable`) **AND** there is a remote-tracking-branch 
    with the same name (e.g. `origin/feature-tank-movable`), it will create a new local tracking branch (e.g. `feature-tank-movable`) 
    which has the remote-tracking branch (e.g. `origin/feature-tank-movable`) set as its upstream branch. Then, it switches to this branch.
    
Finally, assert your local branches (with tracking information) looks like this:
```
* feature-tank-movable 68b4b53 [origin/feature-tank-movable] Commit C: Tank movable feature - completely done
  master               ed8d73c [origin/master] Commit D: Tank ammunition 8 -> 10
```
    
_**Alternatively**, we could use the following three commands to achieve the same result (you don't have to do this):_
1. Command `git branch feature-tank-movable` to create the local branch
2. Followed by command `git checkout feature-tank-movable` to switch (to the existing) branch. 
3. Followed by command `git branch -u origin/feature-tank-movable` which lets local branch `feature-tank-movable` track remote (`origin`) branch `feature-tank-movable`

## 3. Code review finished

Remember how - in the previous codelab - we pushed our branch `feature-tank-movable` to the remote repository so that another developer could perform a code review?

Well, the feedback's in! Apparently, we need to make one small fix, and then we can merge our changes from our feature back into the the master branch.

Let's first add the required change to our `tank.txt` file.
1. Make sure you're on the `feature-tank-movable` branch
2. Open up the `tank.txt` file, it should look like this:
    ```
    Class Tank {
        
        int ammunition = 8;
        
        void shootMainGun(Target target) {
            target.getsShotAt();
            --ammunution;
        }
    
        int drivenMeters = 0;
            
        void move(int amountToMoveInMeters) {
            drivenMeters += amountToMoveInMeters;
        }
        
    }
    ```
3. Our code-reviewing college requests us to use type `float` instead of `int` for the `move` method. Let's make that change!
    ```
    Class Tank {
        
        int ammunition = 8;
        
        void shootMainGun(Target target) {
            target.getsShotAt();
            --ammunution;
        }
    
        float drivenMeters = 0f;
            
        void move(float amountToMoveInMeters) {
            drivenMeters += amountToMoveInMeters;
        }
        
    }
    ```
4. Save the file, add the changes to the stage and commit them with message `Commit E: Tank movable feature - code is reviewed`
5. Your history should look like this:
    ```
    * 9eaafde (HEAD -> feature-tank-movable) Commit E: Tank movable feature - code is reviewed
    * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
    * 3720274 Commit B: Tank movable feature - partially implemented
    | * ed8d73c (origin/master, origin/HEAD, master) Commit D: Tank ammunition 8 -> 10
    |/
    * f2ce81d Commit A: Tank added
    ```
    - Local branch `feature-tank-movable` consists of 4 commits: 
        - `9eaafde` (Commit E)
        - `68b4b53` (Commit C)
        - `3720274` (Commit B)
        - `f2ce81d` (Commit A)
    - Remote branch `feature-tank-movable` consists of 3 commits _(it's 1 commit behind of its local counterpart)_: 
        - `68b4b53` (Commit C)
        - `3720274` (Commit B)
        - `f2ce81d` (Commit A)
    - Local (and Remote) branch `master` consist of 2 commits:
        - `ed8d73c` (Commit D)
        - `f2ce81d` (Commit A)
6. Our tank feature revolving around moving is completely finished (the feature is fully implemented on local branch `feature-tank-movable`). Thus, we want to incorporate those changes back into our 'main' branch, which is branch `master`. Once these changes are incorporated, we're going to delete both local and remote branch `feature-tank-movable`.

## 4. Merge changes into master

So, we want to incorporate the changes of local branch `feature-tank-movable` into branch `master`.

- Local branch `feature-tank-movable` consists of 4 commits: 
    - `9eaafde` (Commit E)
    - `68b4b53` (Commit C)
    - `3720274` (Commit B)
    - `f2ce81d` (Commit A)
- Local (and Remote) branch `master` consist of 2 commits:
    - `ed8d73c` (Commit D)
    - `f2ce81d` (Commit A)
    
In the end, `master` should contain (on top of its own commits) commits B, C and E _(well, their changes to be precise)_.

Let's get started:
1. Make sure you're on branch `feature-tank-movable`
    - execute a `git pull` to make sure the branch is up to date (that no other changes have been made to the remote branch `feature-tank-movable`)
2. Switch to branch `master`
    - execute a `git pull` to make sure the branch is up to date (that no other changes have been made to the remote branch `master`)
3. Merge branch `feature-tank-movable` into the current (`master`) branch using `git merge feature-tank-movable`
    ```
    Auto-merging tank.txt
    Merge made by the 'recursive' strategy.
     tank.txt | 6 ++++++
     1 file changed, 6 insertions(+)
    ```
    - There shouldn't be any merge conflicts. Yes, there were changes in the same file (`tank.txt`) on both branches, but in different parts of that file. Therefore Git should be able to resolve the merge without any conflicts.
4. Inspect your project's history: `git log --all --decorate --oneline --graph`
    ```
    *   6002ce8 (HEAD -> master) Merge branch 'feature-tank-movable'
    |\
    | * 9eaafde (feature-tank-movable) Commit E: Tank movable feature - code is reviewed
    | * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    * | ed8d73c (origin/master, origin/HEAD) Commit D: Tank ammunition 8 -> 10
    |/
    * f2ce81d Commit A: Tank added
    ```
    - Commit `6002ce8` is created as a result of the three-way merge git applied. 
    It's a so called merge commit that, as you can see, has 2 parents instead of 1 (commit `ed8d73c` and `9eaafde`).
    - Branch `master` now points to merge commit `6002ce8` which allows us to traverse all previous made commits (by using both its parent commits) (thus it contains all of the changes).
    - Branch `feature-tank-movable` still points to commit `9eaafde` (Commit E) and can traverse (in order) commit C, B and A. It can't traverse commit D and thus is still unaware of changes made in that commit.
5. Local branch `master` now contains all the changes of local branch `feature-tank-movable`.
6. Push branch master: `git push`
7. Inspect the project's history again. Both `master` and `origin/master` should now point to the same commit.
    ```
    *   6002ce8 (HEAD -> master, origin/master, origin/HEAD) Merge branch 'feature-tank-movable'
    |\
    | * 9eaafde (feature-tank-movable) Commit E: Tank movable feature - code is reviewed
    | * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    * | ed8d73c Commit D: Tank ammunition 8 -> 10
    |/
    * f2ce81d Commit A: Tank added
    ```
    
## 5. Remove feature branch

All of our changes in our feature branch have been merged into our `master` branch. They are now fully incorporated in our _main development branch_.

It's time to clean up that `feature-tank-movable` branch, both locally and remotely.


**First, clean up the local branch**
1. Switch to the `master` branch
2. Delete the local branch `feature-tank-movable` using `git branch -D feature-tank-movable`
    ```
    Deleted branch feature-tank-movable (was 9eaafde).
    ```
    - We need the `-D` option and not `-d` since `feature-tank-movable` is ahead of `origin/feature-tank-movable`
3. Inspect that is is deleted:
    ```
    *   6002ce8 (HEAD -> master, origin/master, origin/HEAD) Merge branch 'feature-tank-movable'
    |\
    | * 9eaafde Commit E: Tank movable feature - code is reviewed
    | * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    * | ed8d73c Commit D: Tank ammunition 8 -> 10
    |/
    * f2ce81d Commit A: Tank added
    ```
4. Now, delete the remote branch: `git push origin --delete feature-tank-movable`
    ```
    To https://github.com/<username>/git-starter-02.git
     - [deleted]         feature-tank-movable
    ```
5. Inspect that is is deleted:
    ```
    *   6002ce8 (HEAD -> master, origin/master, origin/HEAD) Merge branch 'feature-tank-movable'
    |\
    | * 9eaafde Commit E: Tank movable feature - code is reviewed
    | * 68b4b53 Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    * | ed8d73c Commit D: Tank ammunition 8 -> 10
    |/
    * f2ce81d Commit A: Tank added
    ```
6. Local branches: `git branch`
    ```
    * master
    ```
7. Remote branches: `git branch -r`
    ```
    origin/HEAD -> origin/master
    origin/master
    ```

## 6. Final words
The idea of developing new features on separate git branches follows the idea behind Feature Branch Workflow.

> all feature development should take place in a dedicated branch instead of the master branch. This encapsulation makes it easy for multiple developers to work on a particular feature without disturbing the main codebase. It also means the master branch should never contain broken code, which is a huge advantage for continuous integration environments. [https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)