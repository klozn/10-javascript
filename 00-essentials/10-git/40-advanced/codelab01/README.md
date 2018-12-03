# CODELAB 01: MERGING

Let's get you accustomed with merging.

# 1. About Merging

When pulling or fetching changes from the remote repository, Git will merge (there are other options) the changes on the remote repository with the changes 
on our on the local repository.
>: E.g. A file that has been changes on the remote repository, but for which we still have the old version locally.

Git will try to automatically merge both versions of the file, resulting in a single fully updated file which contains both changes. 
This to prevent any loss of changes.

Whenever Git can not automatically merge the changes, it will inform you about this *merge conflict*. 
It is then up to you - as a developer - to manually merge the changes.
In essence, this means you have to decide which changes it should take (and which it should not). 
However, always be careful when merging, it is possible to throw away changes which could have cost days to make.

# 2. Let's Merge

We will now create a *merge* situation that Git will be able to automatically resolve.

## Create a GitHub repository

Start by creating a new repository on GitHub. Then, locally, create a working directory in which you create a simple `readme.txt` file.
Initialize a local Git repository inside this working directory, add the `readme.txt` (containing the words "Hello World") to the stage (start tracking) and commit.
Then, push to the new repository you created on GitHub.

## Create a Merge situation

On GitHub itself (!), modify the `readme.txt` file. Alter the text *Hello World* to *goodbye sun*. Save this change on GitHub (How can we save this change?)

On your computer, open the `readme.txt` file and add a new line, below the *Hello World* line, which reads *hey there moon*. 
Make sure to save your file

1. Check the status of your local repository: 
1. Check the status of your local repository: 
    ```
    git status
    ```
2. Add the file to the stage:
3. Commit it with a custom message: 
4. Push the changes to the remote repository:
Upon pushing, you'll notice it isn't working. You should see the following output:
```
To https://github.com/<username>/<your-repository>.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/<username>/<your-repository>.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Read the output carefully, Git is telling us that the remote repository is having changes (the *goodbye sun* line in `readme.txt`) 
that we locally do not yet have. 

Pushing while your local repository is not up to date with the remote repository is simply not allowed. 

- **Therefore, make sure to always pull before pushing**
- **But, also remember to make sure to commit or undo local changes before pulling (to save you some trouble)**

Now, pull from the remote repository:
```
git pull origin master
```

This should provide the following output:
```
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/<username>/<your-repository>
* branch            master     -> FETCH_HEAD
 ed3dd20..750ee9c  master     -> origin/master
Auto-merging readme.txt
CONFLICT (content): Merge conflict in readme.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Again, read the output carefully: Git tried to auto-merge the changes made to the `readme.txt` file, but was unable to do so.
It is telling us to fix the conflicts and then commit our manual merging result

# 3. Merge conflicts

So, we have merge conflicts. Oh ow...

To view all the merge-conflicts, use the `diff` command on your last commit (HEAD is a pointer to the last commit made of the currently checked-out branch): 
```
git diff HEAD
```

This should provide the following output:
```
diff --git a/readme.txt b/readme.txt
index 2d2386e..e4543ff 10064 a/readme.txt
+++ b/readme.txt
@@ -1 +1,6 @@
+<<<<<<< HEAD
 Hello World
 hey there moon
+=======
+goodbye sun
+>>>>>>> 750ee9c2e521ab184cdcdf95b6e67b5011d9b788
```

We only have one merge-conflict in one file (`readme.txt`).

# 4. Fixing merge conflicts

To fix the merge-conflict, open the `readme.txt` file on your computer. It should look really similar to the *diff* output:
```
<<<<<<< HEAD
Hello World 
hey there moon
=======
goodbye sun
>>>>>>> 750ee9c2e521ab184cdcdf95b6e67b5011d9b788
```

As you might notice, the file now contains both changes:

1. The local *"goodbye sun"* line
2. The remote *"Hello World"* and *"hey there moon"* lines
     
The *=======* line divides the changes into the local changes ("yours") at the top and the remote changes at the bottom ("theirs").

## Manually select the preferred changes

We now have to decide how to merge the changes. Which changes do we keep, which changes (if any) do we not keep. Let's image the readme.txt file
should contain the following content (so, we need some changes of both files, but not all):
```
goodbye sun
hey there moon
```

Update your `readme.txt` file so that it contains this content.

## Tell Git the conflict is resolved

We manually decided which changes of `readme.txt` to keep and which to throw away. 

What's left to do for us is to inform Git that we have resolved the merge conflict.

To do so, firstly check the status (`git status`). This should provide the following output:
```
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

        both modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")
```

Carefully read what Git is telling us: in essence - since we pulled - there are two versions (2 blob objects, but only 1 file in your working directory) of the `readme.txt` file. 
This is because Git couldn't merge the changes into a single version of `readme.txt`.
We were already aware of this issue, right? Git told us about it when we pulled. 

So, what's left to do - since we already manually fixed the conflict - is to tell Git the conflict is resolved (to mark resolution).

To mark the merge conflict as being resolved, simply add it to the stage:
```
    git add readme.txt
```

Now, check the status again (`git status`), this should provide the following output:
```
    Your branch and 'origin/master' have diverged,
    and have 1 and 1 different commits each, respectively.
      (use "git pull" to merge the remote branch into yours)
    All conflicts fixed but you are still merging.
      (use "git commit" to conclude merge)
    
    Changes to be committed:
    
            modified:   readme.txt
```

Git is telling us that we have fixed all the merge conflicts, but also that we're still in the process of merging.

## Finalize the merge conflict resolution

To complete the merging process we have to commit and push our changes which resolved the merge conflict.
 
1. Firstly, commit
2. Then, push:

Your push should have been successful, meaning that the merged changes are successfully stored on the remote repository. 
On GitHub, go the `readme.txt` and validate the content is equal to:
```
goodbye sun
hey there moon
```

**Note**: Manually resolving merge-conflicts is a cumbersome task, even for one simple file. 
Imagine having over 1000 files which all contain around 100 lines of code.

Luckily, Git is pretty good in automatically merging. Merge conflicts shouldn't happen to often, 
although they will happen more frequent on larger project. 

To help you with solving merge conflicts, there is an abundance of tools available. For example: [Kdiff3](http://kdiff3.sourceforge.net/).
When using an [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) like IntelliJ, these tools are built in.
