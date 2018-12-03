# CODELAB 01: RESET, CHECKOUT AND REVERT

From time to time, you will want to undo certain changes you have made. 
For this, Git provides us with the reset, checkout and revert commands (and actually even more options...).

Where reset and checkout can be used for both entire commits and individual files, revert can only operate on the level of commits.
These commands and their difference can be tricky. 

We will cover their most common and basic use cases.
 
# 1. Undo staging a file - with uncommitted changes - using reset
 
We can unstage a file - once it is staged and it has uncommitted changes - by using `reset`.

First, create a new working directory, initialize it as a Git repository and create a new file inside.

Name this file *codelab03.txt* and add *"I am the codelab03"* as its content.

1. Add this new file to the stage (start tracking)
2. Commit this file

Now, edit the contents of this file to *"I am the codelab03"*

Imagine tracking and staging this file was a mistake.

To fix our mistake, we need to unstage the file.

Use `reset` to unstage (and untrack) the file:
```
git reset codelab03.txt
```

**Note**: git reset defaults to HEAD. HEAD is the pointer to our last commit (of our current checked-out branch).
What we're asking Git - more or less - is to reset *codelab03.txt* to the state it has on HEAD.
Since *codelab03.txt* is new and uncommitted - meaning it doesn't exist on HEAD - the file will be unstaged.

Verify that the file is removed from the stage and - since it is a new file - untracked:
```
git status
```

This should provide the following output:
```
On branch master
Your branch is up-to-date with 'origin/master'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        codelab03.txt

nothing added to commit but untracked files present (use "git add" to track)
```

**Note**: Unstaging a file is not the same as removing changes made to a file. 
With unstaging - using `reset` - we simply remove the file from the stage. 

# 2. Restore a file - with uncommitted changes - to its last committed version using checkout

A file which has uncommitted changes can be reverted to its last committed version.

This will undo the uncommitted changes.
 
To do so, we use the `checkout` command.

1. Add the *codelab03.txt* to the stage again 
2. Now, commit the file with message `initial commit`

We committed a file, which we'll now change.

Edit the content of *codelab03.txt*:
```
echo I am codelab03, updated > codelab03.txt
```

You now have uncommitted changes for the *codelab03.txt* file.

1. Check the status of the local repository

**Note**: The *codelab03.txt* file is registered as modified but not added to the stage.
We could stage the changes, but it isn't required since our way of working with `checkout` works 
for both staged and unstaged files.

We now want to revert the uncommitted changes made in *codelab03.txt* (and only these changes). 

More specifically, we want to restore *codelab03.txt* to its version of the last commit.

To do so, execute:
```
git checkout HEAD codelab03.txt
```

**Note**: HEAD is the pointer to the last commit (of the current checked-out branch).

*codelab03.txt* is now restored to its version of the last commit.

This means that the *", updated"* part of *codelab03.txt's* content is gone.


# 3. Restore a file - with committed changes - to a different committed version using checkout

Whenever we want to undo changes which are committed, 
we can use `checkout`.

The following method applies to both pushed and 'unpushed' commits.

1. Push your commit to the remote repository (which you'll firstly have to create on GitHub)

File *codelab03.txt* with content *"I am codelab03"* should now be on your remote repository

Again, on your local working directory, edit the content of *codelab03.txt*:
```
echo I am codelab03, updated again > codelab03.txt
```

1. Add it to the stage, commit (message `updating codelab03 again`) and push

We would now like to revert our changes of *codelab03.txt* so that it again reads *"I am codelab03"*.

Try to use checkout as we did before:
```
git checkout HEAD codelab03.txt
```

When we verify - with `git status` - if any changes are reverted by using `checkout` - we don't see any.

If we inspect the content of *codelab03.txt* in our working directory we see it still has *"I am codelab03, updated again"* as its content.

This behavior is normal. Remember that *HEAD* is a pointer to our last commit (of our current checked-out commit). 
In our last commit *codelab03.txt* contained *"I am codelab03, updated again"*.

It is in our second last commit where *codelab03.txt* contains *"I am codelab03"*.

We can specify a commit using `HEAD~n`, where *n* is the n-th commit after the last one.

E.g.:

- Last commit: `HEAD`
- Second last commit: `HEAD~1`
- Third last commit: `HEAD~2`
- Etc..
    
Now - since the content of *codelab03.txt* to which we want to revert is in our second last commit - try the following command:
```
git checkout HEAD~1 codelab03.txt
```

Again, verify with `git status` if any changes are made:
```
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   codelab03.txt
```

Success.

We successfully reverted committed (and pushed) changes of file *codelab03.txt* by restoring the file to its version of the second last commit.

To make sure our remote repository also contains these reverted changes, we have to commit and push them. 
This will complete the process:
```
git commit -m "reverting codelab03.txt"
git push origin master
```

Verify both locally and on GitHub that the file *codelab03.txt* contains *"I am codelab03"*

# 4. Restore multiple files - with uncommitted changes - to their last committed version using checkout

We can restore multiple files - with uncommitted changes - to their last committed version by using `checkout`.

Modify the *codelab03.txt* in your working directory: simply add some extra text.

Also, add a new file:
```
echo undo-me > undo.txt
```

Leave it untracked.

We now decide the changes made to the existing files and the creation of the new file were unnecessary.

We want to revert all those changes.

Execute:
```
git checkout .
```

This will revert all your unstaged and staged changes.

To remove your untracked files (in essence: to remove newly created files), use:
```
git clean -f
```

Verify with `git status` you have nothing to commit and your working tree is clear.

# 5. Undo entire commits - which are not yet pushed - by using reset

Whenever you want to revert entire commits which are not yet pushed, use `reset`.

Update *codelab03.txt's* content to *"I am codelab03 commit 1"*, add it to the stage and commit
```
echo I am codelab03 commit 1 > codelab03.txt
git add codelab03.txt
git commit -m "codelab03 commit 1 for reset"
```

Repeat this process 2 more times, where you replace *"commit 1"* with *"commit 2"* the first time and with *"commit 3"* the second time

We should now have 3 local commits, the final content of *codelab03.txt* equals that of  *"I am codelab03 commit 3"*.

Verify with `git status` that we are now 3 commits ahead of origin/master.

Imagine, that somehow we screwed up and we need to revert the last 2 commits. 

Simply put: we want to go back to the version of *codelab03.txt* as it was in our first commit ("commit 1")

Use `reset` and specify the correct commit to which we want to reset:
```
git reset HEAD~2
```

**Note**: Remember that HEAD points to our last commit (of our current checked-out branch)("Commit 3"), HEAD~1 to the second last commit ("Commit 2") and HEAD~2 to our third last commit ("Commit 1").

This should provide the following output:
```
Unstaged changes after reset:
M       codelab03.txt
```

The changes that are unstaged are the changes made in the second and third commit.

However, the 'undoing' of these changes are not yet applied to our working directory, but they are applied in our staging area.

If you open *codelab03.txt* you will see that it still contains *"I am codelab03 commit 3"*.

We will come back to this in a moment.

Verify with `git status` that we are now only 1 commit ahead of origin/master (since we reverted the last 2 commits)

Push your one remaining commit to the remote repository:
```
git push origin master
```

Verify on GitHub, that the file *codelab03.txt* contains the text *"I am codelab03 commit 1"*

Locally however, on our working directory, the text *"I am codelab03 commit 3"* is still present in our *codelab03.txt* file.

Remember the message about the unstaged changes 2 slides back? If we would add these changes back to the stage, commit and push,
our *codelab03.txt* file would again contain the text *"I am codelab03 commit 3"*.

So, these unstaged changes are the changes from the second and third commit we made. 

We now have to tell Git to get rid of these changes (since we do not longer want them).
By doing so, our working directory will be updated, meaning when we open the file *codelab03.txt* it will contain the text *"I am codelab03 commit 1"*

Tell Git to discard all the changes in the working directory:
```
git checkout .
```

Verify, on your working directory, that *codelab03.txt* now contains the text *"I am codelab03 commit 1"*

Verify with `git status` we have nothing to commit and a clean working tree

- Tip: look into `git reset --hard`, however be careful since all committed changes will be lost.

# 6. Undo entire commits - which are already pushed - by using revert

Whenever you want to revert entire commits which are already pushed, the safest way to do so is by using the `revert` command.

Start by updating the *codelab03.txt* file from *"I am codelab03"* to *"I am codelabrador03, woof woof"*

Add it to the stage, commit and push it:
```
git add codelab03.txt
git commit -m "from lab to labrador"
git push origin master
```

We pushed our "labrador" changes, but come to mind, we actually don't want these changes, oops...

With `revert` we can specify any commit we want to revert. 

What this command does is create a new commit containing changes which undo every change made in the specified and all later commits.

Pretty neat, right?

We now want to revert our last commit, which we pushed.

Since HEAD is the pointer to the last commit (of our current checked-out branch), use it to indicate the commit to be reverted:
```
git revert HEAD
```

**Note**: We could have also used the SHA key to indicate the commit to be reverted.

As mentioned before, Git will automatically create a new commit containing changes to undo all the changes made in the specified and all later commits.

It is possible an editor window will automatically open in your CMD / Terminal, where Git asks you for a commit message for this new commit.

The default commit message suffices, just close the editor by typing `:q` (or `:z`, or by pressing `ctrl + z`).

You should go back into the CMD / Terminal where your last commands are being shown.

Verify with `git status` that we are now 1 commit ahead of origin/master, this is the commit containing all the 'undo' changes.

Push it:
```
git push origin master
```

Verify, both locally and on GitHub that *codelab03.txt's* content is reverted from *"I am codelabrador03, woof woof"* to *"I am codelab03"*