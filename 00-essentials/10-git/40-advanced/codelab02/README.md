# CODELAB 08: BRANCHING

When implementing new requirements, fixing bugs or experimenting with the code, 
developers tend to create a copy of the whole source code (on which they can work freely).
 
Later on, they can decide to throw away their changes or (more likely) merge the updated copy back into the original source code.

In Git, creating a copy is called *creating a branch*.

# 1. Creating a branch

Let's reuse the repository (both locally and on GitHub) you created for the previous codelab (on Merging).
 
On your local repository, Create a new branch called *alternate_universe*
- Tip: `branch` command

We created a new local branch, however we are still on the *master* branch (also read: the master branch is still *checked out*)

Switch to the newly created branch:
- Tip: `checkout` command

We are now switched to the *alternate_universe* branch. 

**Note**: It is also possible to create and checkout a branch using a single command: 
- Find out how!

# 2. Making changes to a branch

Open the `readme.txt` file and add the lines *"oh hello sirius"* and *"yo pollux"* to the end of the file.

Your `readme.txt` file should now contain the following lines:
```
goodbye sun
hey there moon
oh hello sirius
yo pollux
```

1. Add your changes to the stage:
2. Now, commit with message `adding 2 stars to the readme.txt file`

**Note**: None of the changes made in the *alternate_universe* branch are - at the moment - visible on the local **master** branch 
or on the remote repository.

# 3. Merging changes of a branch back into the master branch

We are now ready to merge the changes from the *alternate_universe* branch back into the master branch.

First, switch back to the master branch:
- Tip: `checkout` command

We are back on the master branch, 
we now just need to tell Git to merge our *alternate_universe* changes into the current (master) branch:
```
git merge alternate_universe
```

This should provide the following output, which means the changes from the *alternate_universe* branch are 
successfully merged into the master branch.
```
Updating 7620f8b..66e1a8b
Fast-forward
 readme.txt | 2 ++
 1 file changed, 2 insertions(+)
```

Notice how Git was able to automatically merge, meaning no merge conflicts occurred.
 
Thanks Git!

Notice with `git status` that all of your changes are already committed, 
which you did yourself on the *alternate_universe* branch.

Now push your changes to the origin (remote), on branch **master**

Verify, on GitHub, that the `readme.txt` file is updated and contains the 4 lines of text.

# 4. Pushing an entire branch

The *alternate_universe* branch is a branch that only exists on our local repository. 
However, it is possible to push the complete branch to the remote repository. 

Imagine you are working on a bug fix, on a separate branch, which takes multiple days to solve.
Daily, you will want an online backup of the work you already made. 
However, you don't want to merge your unfinished bugfix into the master branch...
>: E.g. You're working on a new feature, it isn't complete yet, nor is your code properly tested yet. You 
already push your changes to the master branch on the remote repository, since you want to make sure your code is backed-up remotely.
However, your new code breaks some parts of the existing code. Since you pushed to the master (which is the main/live) branch, 
you probably affected some test-environments, which now aren't working any longer. At the very least, you affect the other developers in your team the moment they 
pull (your) changes from the remote. 

But, say you do want to make sure you have a daily online back-up of your code, although you haven't working code?
Your solution consists of pushing your local branch and its changes to the remote repository. 
Every day, you push your work to this remote branch until you are finished.
Only then do you locally merge your changes back into the master branch, which you can then push back to the remote repository.

## Prepare to push the branch

1. switch back to your *alternate_universe* branch:
2. Add the following line to the end of your `readme.txt` file:
    - *"to me you're a planet, pluto"* 
    
You should have 5 lines of text in total now.

1. Add the `readme.txt` file to the stage:
2. Commit it with message `pluto is a planet added to readme.txt`

## Push the branch

Now push your *alternate_universe* branch to the remote repository. 
Remember that the command to push is `git push <remote-name> <branch-name>`.

So instead of pushing to the remote master branch, 
we will now push to the remote *alternate_universe* branch, 
which does not yet exists on the remote repository but will be created in the process.

1. Push your branch!

This should provide the following output:
```
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 327 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/<username>/<your-repository>.git
 * [new branch]      alternate_universe -> alternate_universe
```

As you can see, a new remote branch was created. 
- **Note:** When using the command `push`, you always push the locally checked-out branch. 
The name of the branch we specify as an argument of the `push` command is the branch **on the remote repository** we want to push to!
We could have chosen another name for the remote branch, but in general you want to have the same name for your local and remote branches.

Verify that your branch is created by going to the GitHub homepage of your repository (https://github.com/<username>/<your-repository>). 
You should see that there are now 2 branches.

Still on GitHub, click on your `readme.txt` file. Notice that the 5th line seems to be missing. 
This is because you're still viewing the version as it exists on the master branch.

On the top of the page, there is dropdown list (branch: master), click on it and select the *alternate_universe* branch.

You'll now see the extra line of text, 5 in total. 

Switch back to the master branch using the dropdown list.

## Active branch

Now, go back to your CMD / Terminal. 

1. check which is the active (checked out) branch:
- Tip: `branch` command

This should provide the following output:
```
* alternate_universe
  master
```

The * annotated branch is the checked out, 'active' branch.

# 5. Merging a remote branch

Merging a branch which is pushed to the remote repository, is actually the same as merging a local branch.

1. Locally, switch back to the master branch
2. Merge the *alternate_universe* branch into the *master* branch
    - Tip: `merge` command
3. Push the (changes of) the *master* branch

Verify on GitHub that the `readme.txt` file on the master branch now also contains the 5 lines of text.

# 6. Deleting a branch

Al what is left to do now is to clean up the *alternate_universe* branch by removing it, 
since it will no longer be used and all its changes are merged into the master branch.

1. delete the local branch *alternate_universe*
    - Tip: `branch` command with a certain option...
2. Then, also delete the remote branch *alternate_universe*
    ```
    git push -d origin alternate_universe
    ```
3. Verify that the branch is deleted 
    ```
    git branch -a
    ```

it will show the local and remote branches:
```
* master
  remotes/origin/master
```

No trace of the *alternate_universe* branch. Not locally. Not on the remote repository.

Good.