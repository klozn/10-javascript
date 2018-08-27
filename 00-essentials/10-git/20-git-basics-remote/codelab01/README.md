# CODELAB 01
Init, Pushing and Pulling

# CREATE A GITHUB ACCOUNT

GitHub is currently the most popular online service for hosting public and private Git repositories. Public repositories are completely free of charge.
While GitHub's main purpose is to host repositories, it has allowed coding to become a more social and fun experience.

## 1. Create an account on GitHub
Go to [GitHub](https://github.com/) and create yourself a free account. 
Make sure to remember your account information since you will it during the complete remainder of the course.

## 2. Create a new repository on GitHub
Repositories are a core concept of version control (and thus Git). 
Simply put, it is a place where the history of your work is stored.

1. Login on GitHub with your newly created account and create a new repository.
2. Name it `switchfully-version-control-git`.
3. Keep the default options.
4. Finalize the creation, you will receive a new screen.
5. Keep this screen open, since you will need the information in the *'Quick setup'* section for the next lab.


# INITIALIZE YOUR LOCAL GIT REPOSITORY

By now, you should have installed Git and created a GitHub account.
You should also have a basic understanding of how to initialize your Git repository.
However, let's do a small recap.

## 1. Navigating your working directory using the command line (CMD) or Terminal

Before we continue with initializing your local Git repository, 
we'll provide you with a brief introduction on how to navigate your working directory from the command line.

It's a useful skill to have.

### Your current location

Check your CMD or Terminal window, you will see a blinking underscore. This is your cursor.
The cursor is always prefixed by the *path* in which you're currently located.
E.g.:
```
C:\folders\switchfully > _
```

**Note**: On mac/unix based systems: the `>` will be replaced by the `$` sign, possibly prefixed by the user, something like:
```
mac-pc: ~/Users/nielsde/switchfully nielsd$ _
```

### Navigate downwards (deeper in the folder / directory hierarchy)

To move down one folder (to go deeper), use `cd <NAME_OF_FOLDER>`.

The command `cd` stands for 'change directory' and allows for multiple arguments.
By doing so, we will navigate to the specified subfolder (which needs to exist) of the current folder we're in:
```
C:\folders\switchfully > cd version-control
C:\folders\switchfully\version-control > _
```

To go more than one 'level' down, repeat the individual commands or chain the folders:
```
C:\folders\switchfully > cd version-control
C:\folders\switchfully\version-control > cd labs
C:\folders\switchfully\version-control\labs > _
```

or:
```
C:\folders\switchfully > cd version-control/labs
C:\folders\switchfully\version-control\labs > _
```

### Navigate upwards

To move up one folder, use `cd ..`

By doing so, we will navigate to the parent folder of the current folder we're in:
```
C:\folders\switchfully > cd ..
C:\folders > _
```

To go up more than one 'level', add `..` for every level:
```
C:\folders\switchfully > cd ..
C:\folders > cd ..
C:\ > _
```

You can chain the `..`'s into a single command:
```
C:\folders\switchfully > cd ../..
C:\ > _
```

### show the content of the current directory

To show what files and other directories the current directory (which is a synonym for folder) contains use `dir` on Windows 
and `ls` on Mac/Unix:
```
C:\folders\switchfully > dir
```

or, on mac/unix:
```
mac-pc: ~/Users/nielsde/switchfully nielsd$ ls
```

### Create a directory

A directory, synonym for folder, can be created using the `mkdir` command.
After creating a directory, we can navigate to it:
```
C:\folders\switchfully > mkdir mynewfolder
C:\folders\switchfully > cd mynewfolder
C:\folders\switchfully\mynewfolder > _
```

### Create a file

We can create new files using the `echo` and `>` command:

```
C:\folders\switchfully > echo hello world > myfile.txt
```

This will create the file myfile.txt (if it does not yet exists) and inserts "hello world" as its content.
It is possible on mac or unix based systems that you have to use quotes for the content:
```
mac-pc: ~/Users/nielsde/switchfully nielsd$ echo "hello world" > myfile.txt
```


### Conclusion to navigating your working directory using the command line (CMD) or Terminal

This is as far as our introduction to command line navigation goes.

From now on, for the purpose of simplicity, 
we'll leave out the path part whenever we provide you with commands to execute.
This means that:
```
C:\folders\switchfully > echo hello world > myfile.txt
```

will be presented as:
```
echo hello world > myfile.txt
```

## 2. Create a working directory

Now, back to initializing your local Git repository.

On your computer, create a directory named `switchfully`.

You decide where you create the folder, just make sure you remember the path.

Using the CMD or Terminal, navigate to the newly created folder:
```
cd "<path>"
```
Replace *\<path\>* with the path to your newly created folder.

    - E.g.: *"C:\Users\nielsde\switchfully"*
    
When you have successfully navigated to the folder, 
you should see the complete path before the cursor (in CMD / Terminal):
```
C:\Users\nielsde\switchfully > _
```

## 3. Initialize your local Git Repository

Initialize a local Git repository inside the *switchfully* folder:
```
git init
```

If successful, you’ll read:
```
Initialized empty Git repository in <path>/.git/
```

You now have created a fully functional local git repository inside your *switchfully* folder.    
    
**Note**: A `.git` directory / folder will be created in your switchfully folder, 
although it can be hidden. It contains all the configuration files of your local Git repository

# CHECK STATUS AND COMMIT YOUR FIRST FILE

## 1. Git status
To see the current state of our project, type the following command into the CMD or Terminal:
```
git status
```
    
This should provide the following output:
```
On branch master
No commits yet
nothing to commit (create/copy files and use "git add" to track)
```

It tells us that we are on the master branch (so we are working on the main/live code), 
that no previous commit has been made and that Git has nothing to commit. Let us give Git something to commit.

## 3. Create a new directory
Still inside your *switchfully* folder, create a new folder / directory using the CMD, Terminal:
```
mkdir version-control
```

Navigate to this directory
```
cd version-control
```

From this moment on, this will be the directory in which you work for the remainder of the Version Control labs.

## 3. Create a file
Inside your *version-control* folder, create a new file using the CMD, Terminal:
```
echo hello world > readme.txt
```

This will create a file *readme.txt* in your *version-control* folder. 

Again, check the status of your project:
```
git status
```

This should now provide the following output:
```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        ./

nothing added to commit but untracked files present (use "git add" to track)
```

So, it's detecting there are untracked files present, however it's not showing the name...

1. Let's go one level up in the directory hierarchy.
2. Now, inside the *switchfully* folder, again, get the status:
    ```
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            version-control/
    
    nothing added to commit but untracked files present (use "git add" to track)
    ```

Git will ignore the context of a directory if the directory doesn't already contain tracked files. 
However, you know by the presence of version-control/ in `git status` that there are files in there! 

We can however aks Git to also show us the files that are included in the directories using the following command:
```
git status -uall
```

Which will result in:
    
```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        version-control/readme.txt

nothing added to commit but untracked files present (use "git add" to track)
```

    
Git automatically detects newly created files, however it does not automatically track newly created files.
Git expects us to tell which files to track (and which not).

To make Git track our *readme.txt* file, insert the following command, if you're still inside the *switchfully* directory: 
`git add */readme.txt` or `git add *readme.txt` or `git add *` or `git add .`

You can also use the following command if you're inside the *version-control* directory: `git add readme.txt`

**Note:** all these commands will add our file to the stage:

---
    
This should provide the following output:
```
 On branch master
 No commits yet
 Changes to be committed:
   (use "git rm --cached <file>..." to unstage)
         new file:   readme.txt
```

(or `new file:   version-control/readme.txt` if you're not inside the *version-control* directory, but one level up)

Git is now tracking our *readme.txt* file, meaning that from now on Git will keep a complete history of all modifications 
made to this file.
    
## 5. Commit files

A commit is a snapshot of our repository, taken on the moment we entered the commit command. It allows us to look back at all the changes made over time.
Commit your changes, use option *–m* to provide a custom message describing what it is we’re committing:
```
git commit -m "Adding a simple readme file"
```
    
This should provide the following output:
```
[master (root-commit) 6858465] Adding a simple readme file
 1 file changed, 1 insertion(+)
 create mode 100644 readme.txt    
```

The last line of the output shows our file, which was created and now inserted into the local repository. 
The number from the first line, *6858465*, is the SHA-1 key (the shorter version): the unique identifier key for our commit 
that references the snapshot object.

# PUSHING

We have committed our changes to the local repository. 
However, we're still working completely locally. 
In order to send our changes to the repository we created on GitHub, 
we have to *push* our changes to that remote repository. 

## 1. Inspect your (local) commits
Before pushing, let us inspect which local commits we have made so far:
```
git log
```

It will show all of our commits in the order we have made them. The last being at the top of the list.
    
This should provide the following output:
```
commit 68584654243a1b934d8d60c86096d802a820a5e7
Author: nielsde <niels@somemail.com>
Date:   Mon Aug 21 18:00:56 2017 +0200

    Adding a simple readme file
```
    
For now, we only have one commit.

For every commit we receive:

1. The SHA-1 unique key (the long version) of the commit. It references the snapshot.
2. The author.
3. The date the commit was made.
4. The commit message.

## 2. Push your commits
We are now ready to push to our remote GitHub repository. 

By doing so, we’ll have stored our complete project on a remote server (so if our computer crashes, we will still have an online back-up).
Other developers will also be able to clone our work and contribute!

### Add the remote repository

Before adding the remote, check which remotes have already been configured using the following command
```
git remote -v
```
 
Now, le's add the remote GitHub repository, we will name it origin, which is the default name for your main remote.
As the remote address, use the url that is shown on the 'Quick Setup' page of your remote repository on GitHub:
```
git remote add origin https://github.com/<username>/switchfully-version-control-git.git
```

Now, again, check the remotes that have been configured:
```
git remote -v
```

Try the same command, leaving out the `-v` option. See how it's less informative.


**Note**: Adding your remote repository address is something you normally do only once for every local repository. 
Mostly right after you initialized the local repository.

### Push (it real good)  
We can now *push*. By specifying the name of the remote (origin) and the branch name (master) 
we will push our changes from master branch on the local repository to the master branch on the remote repository. 
```
git push –u origin master
```

Don't forget the `–u` option, since it's the first time we push the (master) branch to the origin remote.
    
When your push is complete, go on GitHub and refresh your repository page. 
In the 'Code' tab, you should see your *readme.txt* file.

**Note**: Multiple local commits can be made before doing a single push to the remote repository.

# PULLING

With the *push* command we send our local changes to the remote repository. 
With *pull* we do the opposite, retrieving changes from the remote repository to our local repository.

## 1. Pull before push

Before *pushing*, your local repository should be up to date with the latest changes from the remote repository.
 
Imagine, after some time, another developer from its own computer *clones* the remote repository, edits the *readme.txt* file 
and *pushes* it back to the remote repository. From then on, the *readme.txt* file that is located on your computer is outdated. 
It will remain outdated until you *pull* (update) changes from the remote repository.

## 2. Pull command

To pull changes from the remote repository:
```
git pull origin master
```
    
You will get the message `Already up-to-date`, since no one made any changes to your remote repository.
Your local repository has the exact same changes as the remote repository.

## 3. Pull changes

To mimic a situation where someone else did make changes to the *readme.txt* file on your remote repository:
    - Go to the repository page on GitHub
    - Click on the *readme.txt* file
    - When on the *readme.txt* page, click on the pencil icon (right side) to edit the file
    - Change the text to *goodbye world* (yes, we're intentionally leaving out the *cruel* part. #NoDrama)
    - Scroll down to the *commit changes* button and click it. 
    - We now have an updated version of the *readme.txt* file on the remote repository

Open the *readme.txt* on your computer, validate that it still has the text *hello world*

Now, pull again from the remote repository:
```
  git pull origin master
```

- This should provide the following output:
```
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/<username>/switchfully-version-control-git
   6d5d88e..476eaff  master     -> origin/master
Updating 6d5d88e..476eaff
Fast-forward
 readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

- The most important thing to notice is that Git shows the total amount and names of the files changed (last 2 lines). 

**NOTE**: Since the local *readme.txt* was unmodified, Git had no problem with merging the local *readme.txt* with the new data 
from the remote *readme.txt* file. However, if both the local and the remote *readme.txt* would have been changed, 
Git can potentially be unable to automatically *merge* the changes of both versions of the file. This could potentially lead to merge conflicts.
Merging and merge-conflicts will be discussed in the Git follow-up module.

## 4. You're done!

Feel free to experiment some more by adding and modifying files and pushing them to your remote repository.
When you're done, head over to the next codelab that will cover cloning an existing repository.