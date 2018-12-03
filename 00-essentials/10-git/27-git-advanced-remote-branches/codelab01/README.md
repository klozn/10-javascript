# Codelab: Remote branches 01

## 1. Setup

**Let's first set up our remote repository:**

1. On GitHub, or any other service that offers a Git server on which you can create remote repositories, create a new repository.
2. Make sure you have read and write access to it.
3. We'll use this repository later on, to push our changes **and** local branches to.

**Now, locally:**
1. Create a new directory in which you **initialize** a new git repository.

**Lastly, create the following project history:**
1. On branch `master`, create a file `tank.txt` that contains the following pseudo code:
    ```
    Class Tank {
        
        int ammunition = 8;
        
        void shootMainGun(Target target) {
            target.getsShotAt();
            --ammunution;
        }
        
    }
    ```
2. Track `tank.txt` and commit the changes with message `Commit A: Tank added`
3. Create and check-out branch `feature-tank-movable`
4. On branch `feature-tank-movable`, edit file `tank.txt` so that it contains the following pseudo code:
    ```
    Class Tank {
        
        int ammunition = 8;
        
        void shootMainGun(Target target) {
            target.getsShotAt();
            --ammunution;
        }
        
        int drivenMeters = 0;
        
        void move(int amountToMoveInMeters) {
            // TODO: implement
        }
    }
    ```
5. Stage the changes (of `tank.txt`) and commit the changes with message `Commit B: Tank movable feature - partially implemented`
6. Finally, edit the `tank.txt` file so that it has an implementation for its `move` method:
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
7. Stage the changes (of `tank.txt`) and commit the changes with message `Commit C: Tank movable feature - completely done`

Validate, using `git log --all --decorate --oneline --graph`, that you have a similar project history:
```
* 68b4b53 (HEAD -> feature-tank-movable) Commit C: Tank movable feature - completely done
* 3720274 Commit B: Tank movable feature - partially implemented
* f2ce81d (master) Commit A: Tank added
```

## 2. Inspect your branches

1. Let's start by showing our local branches: `git branch`
    ```
    * feature-tank-movable
      master
    ```
2. Now, inspect the remote-tracking branches: `git branch -r`
    ```
    (none)
    ```
    - Since we haven't even specified a remote yet, it's impossible to already have remote-tracking branches.
3. Then, if we would inspect if any of our local branches are tracking branches, we will see they aren't: `git branch -vv`
    ```
    * feature-tank-movable 68b4b53 Commit C: Tank movable feature - completely done
      master               f2ce81d Commit A: Tank added
    ```
    
## 3. Remote and Tracking branch

We're going to add a new remote (the remote repository you created in [**1. Setup**], then we're going to push our master branch to that remote.

1. Add your remote repository as a new remote, call it `origin`.
    ```
    git remote add origin https://github.com/<username>/<repo-name>.git
    ```
2. Inspect that the remote is successfully configured: `git remote -v`:
    ```
    origin  https://github.com/<username>/<repo-name>.git (fetch)
    origin  https://github.com/<username>/<repo-name>.git (push)
    ```
3. Now, push your local branch master to the remote repository (origin): `git push origin master`
    ```
    Enumerating objects: 3, done.
    Counting objects: 100% (3/3), done.
    Delta compression using up to 8 threads
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (3/3), 322 bytes | 322.00 KiB/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    remote:
    remote: Create a pull request for 'master' on GitHub by visiting:
    remote:      https://github.com/<username>/<repo-name>/pull/new/master
    remote:
    To https://github.com/<username>/<repo-name>.git
     * [new branch]      master -> master
    ```
    - By executing command `git push origin master`, we pushing our changes from local branch `master` to the remote repository called `origin` on which a remote branch with the same name (thus `master`) will be created if it doesn't yet exist.
        - (Sidenote: by executing the above command, it doesn't matter that locally the current checked-out branch is still `feature-tank-movable` and not `master`) 
4. Validate, using `git log --all --decorate --oneline --graph`, your project history:
     ```
     * 68b4b53 (HEAD -> feature-tank-movable) Commit C: Tank movable feature - completely done
     * 3720274 Commit B: Tank movable feature - partially implemented
     * f2ce81d (origin/master, master) Commit A: Tank added
     ```
     - A remote-tracking branch has been added, namely `origin/master`, it represents the state of the `master` branch of the remote `origin`. Currently our local branch is 'in sync' with our remote branch `master`.
5. Inspect the remote-tracking branches: `git branch -r`
    ```
    origin/master
    ```
6. Inspect if our local branch `master` is tracking remote branch `master`: `git branch -vv`:
    ```
    * feature-tank-movable 68b4b53 Commit C: Tank movable feature - completely done
      master               f2ce81d Commit A: Tank added
    ```
    - our local branch `master` is not tracking branch `origin/master`...
7. Let's make our local branch `master` a tracking branch of `origin/master`
    1. First, checkout branch `master`: `git checkout master`
    2. Check its status: `git status`
        ```
        On branch master
        nothing to commit, working tree clean
        ```
    2. Then, let it track `origin/master`: `git branch -u origin/master`
        ```
        Branch 'master' set up to track remote branch 'master' from 'origin'.
        ```
        - `master` became a tracking branch
        - `origin/master` became an upstream branch
    3. Now, again, let's see which local branches are tracking remote branches: `git branch -vv`
        ```
          feature-tank-movable 68b4b53 Commit C: Tank movable feature - completely done
        * master               f2ce81d [origin/master] Commit A: Tank added
        ```
        - `master` became a tracking branch!
    4. Finally, check the status again. It should now show the (last-known) status of the upstream branch as well: `git status`
        ```
        On branch master
        Your branch is up to date with 'origin/master'.
        
        nothing to commit, working tree clean
        ```
8. Because our local branch `master` is now a tracking branch, we could (when we are on the `masteer` branch) push to the `master` branch of `origin` by simply executing command `git push` instead of `git push origin master`. 

_**Remark:** Instead first pushing using `git push origin master` and then making `master` a tracking branch using `git branch -u origin/master`, you could combine both commands using `git push -u origin master`_.

## 4. Local versus Remote

1. Make sure you're on branch `master`.
2. Get youself the current situation of your project's history: `git log --all --decorate --oneline --graph`:
    ```
    * 68b4b53 (feature-tank-movable) Commit C: Tank movable feature - completely done
    * 3720274 Commit B: Tank movable feature - partially implemented
    * f2ce81d (HEAD -> master, origin/master) Commit A: Tank added
    ```
3. Edit the `tank.txt` file, increase the initial ammunition to value 10:
    ```
    Class Tank {
        
        int ammunition = 10;
        
        void shootMainGun(Target target) {
            target.getsShotAt();
            --ammunution;
        }
        
    }
    ```
4. Add the changes to the stage and commit them with message `Commit D: Tank ammunition 8 -> 10`
5. Now, get yourself the status of your `master` branch: `git status`
    ```
    On branch master
    Your branch is ahead of 'origin/master' by 1 commit.
      (use "git push" to publish your local commits)
    
    nothing to commit, working tree clean
    ```    
    - Git detects we're one commit ahead of the `master` branch on remote `origin` (although its possible some other developers pushed changes to the `master` repository on `origin` of which our local git is not yet aware. Its basing itself on information it received from our last network contact with the remote repository `origin`)
6. How does this translate to our project history? `git log --all --decorate --oneline --graph`
    ```
    * ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
    | * 68b4b53 (feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    |/
    * f2ce81d (origin/master) Commit A: Tank added
    ```
    - Observation 1: `master` is ahead of `origin/master` by one commit (ed8d73c).
    - Observation 2: `master` and `feature-tank-movable` now have diverged histories. Upon merging, a Fast-Forward merge will no longer be possible, a Three-way merge (resulting in a new merge commit) will be performed.
    
For now, we won't yet push to the remote (`origin`) branch `master`. We'll do this in [**7. Push to Master**].
    
## 5. Feature branch

Our `feature-tank-movable` branch contains the movable feature of our tank. The implementation is done but not yet integrated in the 'main' branch `master`. Image that before we're allowed to merge it into our `master`, another developer needs to code-review it. 

Currently, our `feature-tank-movable` branch is still just a local branch. It doesn't exist on the remote repository.
- We can validate this by executing `git branch -r` (there is no `origin/feature-tank-movable` yet):
    ```
    origin/master
    ``` 
    
Let's **push** our branch `feature-tank-movable` to our remote `origin`. simultaneously, let's also make a tracking branch out of `feature-tank-movable` that tracks upstream (remote) branch `origin/feature-tank-movable` the moment it is created.

1. Execute the following command: `git push -u origin feature-tank-movable`
   ```
   Enumerating objects: 8, done.
   Counting objects: 100% (8/8), done.
   Delta compression using up to 8 threads
   Compressing objects: 100% (4/4), done.
   Writing objects: 100% (6/6), 700 bytes | 700.00 KiB/s, done.
   Total 6 (delta 1), reused 0 (delta 0)
   remote: Resolving deltas: 100% (1/1), done.
   remote:
   remote: Create a pull request for 'feature-tank-movable' on GitHub by visiting:
   remote:      https://github.com/<username>/<repo-name>/pull/new/feature-tank-movable
   remote:
   To https://github.com/<username>/<repo-name>.git
    * [new branch]      feature-tank-movable -> feature-tank-movable
   Branch 'feature-tank-movable' set up to track remote branch 'feature-tank-movable' from 'origin'.
   ```
    - Remark: when executing the above command, it doesn't matter which local branch is currently checked-out.
2. Before pushing, your project history looked like this:
    ```
    * ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
    | * 68b4b53 (feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    |/
    * f2ce81d (origin/master) Commit A: Tank added
    ```
3. Now, it should look like this (mind remote-tracking branch `origin/feature-tank-movable`):
    ```
    * ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
    | * 68b4b53 (origin/feature-tank-movable, feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    |/
    * f2ce81d (origin/master) Commit A: Tank added
    ```
4. Inspect your remote-tracking branches again: `git branch -r`
    ```
    origin/feature-tank-movable
    origin/master
    ```
5. Then, inspect which local branches are tracking remote branches: `git branch -vv`
    ```
      feature-tank-movable 68b4b53 [origin/feature-tank-movable] Commit C: Tank movable feature - completely done
    * master               ed8d73c [origin/master: ahead 1] Commit D: Tank ammunition 8 -> 10
    ```
    
Cool! All we have to do now is wait for our code-review. Once it's done, we can merge our feature branch into the 'main' (`master`) branch.
If we have to make any changes, we can simply push them using command `git push` (when on branch `feature-tank-movable`).

# 6. Delete branch (accidentally)

Normally, you delete a branch when all of its changes are merged into a different, more long-lived branch (generally your `master` or `develop` branch).

Our local branch `feature-tank-movable` is not yet merged into our `master` branch, yet we're still going to delete it (by "accident", for the sake of the exercise).

Imagine the following scenario: 
> You fall asleep while behind your laptop. 
Your head falls onto your keyboard. On impact, 
the following command gets typed in `git branch -D feature-tank-movable` 
and executed. You have accidentally deleted your local branch `feature-tank-movable`. Such...bad...luck... 

So, if you haven't already, delete branch `feature-tank-movable` using command `git branch -D feature-tank-movable`.
```
Deleted branch feature-tank-movable (was 68b4b53).
```
- Remark 1: option `-D` deletes the branch even if there are unmerged changes. (Normally, you should use `-d` to protect you against deleting a branch when there are still unmerged changes)
- Remark 2: You can't delete the current checked-out branch (you should be on branch `master` to delete branch `feature-tank-movable`)
  
The previous project history (before deleting your branch) looked like this:
```
* ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
| * 68b4b53 (origin/feature-tank-movable, feature-tank-movable) Commit C: Tank movable feature - completely done
| * 3720274 Commit B: Tank movable feature - partially implemented
|/
* f2ce81d (origin/master) Commit A: Tank added
```

The new project history should look like this:
```
* ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
| * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
| * 3720274 Commit B: Tank movable feature - partially implemented
|/
* f2ce81d (origin/master) Commit A: Tank added
```
- Remark 1: Our local `feature-tank-movable` is deleted, thus no longer pointing to commit 8b4b53. The remote branch `feature-tank-movable` on `origin`is unaffected and still exists.
- Remark 2: If we would have never pushed our local branch `feature-tank-movable` to the remote repository (thus, there would be no branch pointing to commit 8b4b53 anymore), 
that wouldn't mean any (committed) data was lost. The commits remain unchanged. Remember how branches are just simple pointers, references pointing to a specific commit. _(But be careful with uncommitted changes)_
    - To demonstrate this, create a new branch called `temp-tank-movable` using the following command: `git branch temp-tank-movable 68b4b53`
        - Remark 1: You will have to use your own hash (the one of Commit C)
        - Remark 2: The command creates a new branch (called `temp-tank-movable`) which points to commit 68b4b53 (instead of the commit to which HEAD points)
    - Viewing your project history, you'll see the new local branch pointing to the same commit as `origin/feature-tank-movable`
        ```
        * ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
        | * 68b4b53 (origin/feature-tank-movable, temp-tank-movable) Commit C: Tank movable feature - completely done
        | * 3720274 Commit B: Tank movable feature - partially implemented
        |/
        * f2ce81d (origin/master) Commit A: Tank added
        ```
    - Now, simply remove branch `temp-tank-movable` as it was just for demonstrational purposes: `git branch -D temp-tank-movable`
        ```
        Deleted branch temp-tank-movable (was 68b4b53).
        ```

So, again, the current situation is as follows:
```
* ed8d73c (HEAD -> master) Commit D: Tank ammunition 8 -> 10
| * 68b4b53 (origin/feature-tank-movable) Commit C: Tank movable feature - completely done
| * 3720274 Commit B: Tank movable feature - partially implemented
|/
* f2ce81d (origin/master) Commit A: Tank added
```  

Now, image we wake up and realize we have deleted our local branch `feature-tank-movable`. How can we undo this?

Because there is still a remote version of the `feature-tank-movable` branch, of which we have registered the remote-tracking branch `origin/feature-tank-movable`, our solution is luckily not that difficult.

Perform the following command: `git checkout feature-tank-movable`.
```
Switched to a new branch 'feature-tank-movable'
Branch 'feature-tank-movable' set up to track remote branch 'feature-tank-movable' from 'origin'.
```
- Normally, this command checks-out (switches to) a specific branch (ref). If it does not exist, an error will be thrown.
- However, if the branch does not yet exist locally (e.g. `feature-tank-movable`) **AND** there is a remote-tracking-branch 
with the same name (e.g. `origin/feature-tank-movable`), it will create a new local tracking branch (e.g. `feature-tank-movable`) 
which has the remote-tracking branch (e.g. `origin/feature-tank-movable`) set as its upstream branch. Then, it switches to this branch.

Inspect your local (tracking) branches: `git branch -vv`:
```
* feature-tank-movable 68b4b53 [origin/feature-tank-movable] Commit C: Tank movable feature - completely done
  master               ed8d73c [origin/master: ahead 1] Commit D: Tank ammunition 8 -> 10
```

Then, inspect your project history (`git log --all --decorate --oneline --graph`)
```
* ed8d73c (master) Commit D: Tank ammunition 8 -> 10
| * 68b4b53 (HEAD -> feature-tank-movable, origin/feature-tank-movable) Commit C: Tank movable feature - completely done
| * 3720274 Commit B: Tank movable feature - partially implemented
|/
* f2ce81d (origin/master) Commit A: Tank added
```

We have fully restored our previous situation. It is as if our local branch `feature-tank-movable` was never deleted.

## 7. Push to master

The last time we inspected our history, we got the following:
Then, inspect your project history (`git log --all --decorate --oneline --graph`)
```
* ed8d73c (master) Commit D: Tank ammunition 8 -> 10
| * 68b4b53 (HEAD -> feature-tank-movable, origin/feature-tank-movable) Commit C: Tank movable feature - completely done
| * 3720274 Commit B: Tank movable feature - partially implemented
|/
* f2ce81d (origin/master) Commit A: Tank added
```

Remember how we made **Commit D: Tank ammunition 8 -> 10** on our local branch `master` which we haven't yet pushed to `origin`? Well, now it's time to do so.

1. Start by checking out branch `master`
    ```
    Switched to branch 'master'
    Your branch is ahead of 'origin/master' by 1 commit.
      (use "git push" to publish your local commits)
    ```
2. Then, push... either by `git push` (which should work perfectly fine if branch `master` is tracking `origin/master`) or 'manually' by `git push origin master`:
    ```
    Enumerating objects: 5, done.
    Counting objects: 100% (5/5), done.
    Delta compression using up to 8 threads
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (3/3), 290 bytes | 290.00 KiB/s, done.
    Total 3 (delta 1), reused 0 (delta 0)
    remote: Resolving deltas: 100% (1/1), completed with 1 local object.
    To https://github.com/<username>/<repo-name>.git
       f2ce81d..ed8d73c  master -> master
    ```
3. Your project history should now look like this:
    ```
    * ed8d73c (HEAD -> master, origin/master) Commit D: Tank ammunition 8 -> 10
    | * 68b4b53 (origin/feature-tank-movable, feature-tank-movable) Commit C: Tank movable feature - completely done
    | * 3720274 Commit B: Tank movable feature - partially implemented
    |/
    * f2ce81d Commit A: Tank added
    ```

## 7. Done

You can inspect the final resulting repository on [https://github.com/switchfully/git-starter-02](https://github.com/switchfully/git-starter-02)

In the next codelab, we'll see how we can merge our changes of branch `feature-tank-movable` into branch `master` and then how we can clean up our branches (both local and remote).