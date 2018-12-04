# Codelab Commit

This codelab will cover how Git internally stores data (upon tracking and committing changes).
In order to tackle more complex situations in Git, it's important to a basic understanding of how Git works behind the scenes.

## Initialize

- Create a directory named `sports`
- Initialize an empty git repository in this directory
    - Use the terminal / command line (CMD), make sure you navigate (command: `cd <PATH>`) to your working directory before initializing.
    - After successfully executing the correct command, you should receive the following message
        ```
        Initialized empty Git repository in <PATH_TO_DIRECTORY>/sports/.git/
        ```
- Go inside your working directory, you should see the `.git` directory.
- Go inside the `.git` directory
    - There shouldn't yet be an index file
    - The `objects` directory should still be empty (it does contain 2 subdirectories, which should be empty as well)
- We're all set to start creating some files!

## Git internals

- Create a new file inside your `sports` working directory called `football.txt`
    - Put some text into it, make it so that it has a file size of around 25kb.
- Again, go inside the `.git` directory
    - There still shouldn't be an index file (used to track staging area)
    - The `objects` directory should still be empty (it does contain 2 subdirectories, which should be empty as well)
- In other words: `football.txt` is untracked, Git is keeping no data on this file whatsoever.
- Get yourself an overview of which files are untracked, unstaged or staged
    - You should get the following result:
        ```
        On branch master
        
        No commits yet
        
        Untracked files:
          (use "git add <file>..." to include in what will be committed)
        
                football.txt
        
        nothing added to commit but untracked files present (use "git add" to track)
        ```
- Start tracking the `football.txt` file. By doing so, it will be added to the staging area. As git needs the `index` file to track
what is in the staging area, git now creates the `index`.
- Again, get yourself a status overview of your files
    - You should now get the following result:
        ```
        On branch master
        
        No commits yet
        
        Changes to be committed:
          (use "git rm --cached <file>..." to unstage)
        
                new file:   football.txt
        ```
- Go inside the `.git` directory
    - Now, there should be an index file (used to track staging area)! This file will never disappear once created.
    - The `objects` directory should no longer be empty. It should contain a new directory, which should contain a file.
        - This file is actually the (heavily compressed, blob) Git object of our `football.txt` file.
            - Open it, you'll see it's unreadable (compressed, blob)
        - The `objects` directory is used by Git as a key-value store / database to store these objects (compressed blob representations of our files)
        - The value is the object itself.    
        - The key (a SHA-1 hash) is the combination of the newly created directory name in `objects` and the filename itself
            - Example given:
                ```
                   |-- .git
                        |-- objects
                            |-- b9
                                |-- b612e02a6c86afc6ffe5200fde3ea832f28edd
                            |-- ...
                        | -- ...  
                ```
            - The key is therefore `b9b612e02a6c86afc6ffe5200fde3ea832f28edd` (mind the b9 at the beginning)
        - Using the key, we can extract the original value from the blob object
            - Use command `git cat-file -p <THE_SHA1_KEY>` where you use the correct key.
                - You should see the original contents of the `football.txt` file.
- As said, the `.git/index` is used by git to track staging area.
    - The index file is binary. You cannot read it directly. But the following command shows its contents: `git ls-files --stage`
    ```
    100644 f5e0b64be61f3192446711edbff48f4570d2b156 0	sports/football.txt
    ```
    The first number are the file permissions. The second string is a hash. The last string is the path of the file.
    - Try to remove this file, then do a `git status`. 
    - What happened? Is the file still staged?
    - If not, add the file again to the staging area using `git add .`
    
> NOTICE:
You could successfully remove the file from the staging area by removing the .git/index file.
In practise, you should never modify any file in the .git folder. Although this might work,
you should always use equivalent git commands. The git command will verify your action and
prevent you from making mistakes. Interacting with the .git dir directly will not, and you might 
end up breaking your git repository!

> NOTICE:
The staging area is not the only information kept by git in the index file. The index file contains also the
file hashes from the last commit (HEAD), modification times from the working area, and hashes from the working area.

- Get yourself a status overview of your files. It should still return the following:
    ```
      On branch master
      
      No commits yet
      
      Changes to be committed:
        (use "git rm --cached <file>..." to unstage)
      
              new file:   football.txt
      ```
- Let's commit these changes, as the commit message use `"my first initial commit"`
    - It should return something like this
        ```
         1 file changed, 89 insertions(+)
         create mode 100644 football.txt
        ```
    - A snapshot should have been created!
- Go back to the `objects` directory
    - 2 new directories should have been created, each containing one file. 
    - The combination of the directory and file name again form a SHA-1 key.
    - 1 of these two files contains the snapshot (data), which looks something like this:
        ```
        tree 8a4efcebb8d3238acc6c1be9e31c6ccb54a84b20
        author nielsdelestinne <nielsdelestinne@my-hidden-email.com> 1515574944 +0100
        committer nielsdelestinne <nielsdelestinne@my-hidden-email.com> 1515574944 +0100
        ```
    - The other file contains the parent tree (which is referenced in the snapshot (label: 'tree')). 
    All data under version control is either stored as a tree or as a blob object. 
    In essence it allows for a simple directory structure for Git between all our blob objects. It will look something like this:
        ```
        100644 blob b9b612e02a6c86afc6ffe5200fde3ea832f28edd    football.txt
        ```
    - Inspect your own snapshot and (parent) tree using the `git cat-file -p <THE_SHA1_KEY>` command.
        - Tip: You can check the commit history (`git log`), the SHA-1 key next to label 'commit' is the key to your snapshot. 
- Get yourself a status overview of your files. It should still return the following:
     ```
     On branch master
     nothing to commit, working tree clean
     ```
 - Now, go back to the slides (the Git Basics chapter in particular) and compare what you've just seen happening with how it was described and visualized in the slides. 
 Does it connect? Questions? Ask!
    
