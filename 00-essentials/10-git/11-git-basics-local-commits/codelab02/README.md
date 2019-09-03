# Codelab Commit 2

## Initialize

- Create a directory named `universe`
- Initialize an empty git repository in this directory
    - Use the terminal / command line (CMD), make sure you navigate (command: `cd <PATH>`) to your working directory before initializing.
    - After successfully executing the correct command, you should receive the following message
        ```
        Initialized empty Git repository in <PATH_TO_DIRECTORY>/universe/.git/
        ```
- We're all set to start creating some files!

## Navigating the Git object using commands

- Create the following directory structure, put some text in each file:
    ```
        |-- universe
            |-- earth.txt
            |-- stars
                |-- sun.txt
            |-- .git  
    ```
- Start tracking both files by adding them to the stage
- Commit the changes, use message `"creation of the universe"`
- Check the commit history, it should now contain one entry.
    - E.g.:
        ```
        commit 754899d32521d88134eab2f7108c600150465142
        Author: nielsdelestinne <nielsdelestinne@my-hidden-email.com>
        Date:   Mon Jan 01 00:00:01 2018 +0100
        ```
- Open the snapshot (an object) using its key (E.g.: `754899d32521d88134eab2f7108c600150465142`)
    - `git cat-file -p <KEY>`
    - This will result in something like this:
        ```
        tree ac9e4d8b1ed00d9859c355606fa9b95f801cd8c3
        author nielsdelestinne <nielsdelestinne@hotmail.com> 1515586507 +0100
        committer nielsdelestinne <nielsdelestinne@hotmail.com> 1515586507 +0100
        
        creation of the universe
        ```
        - Remember how the Git objects representing our files in Git are either:
            - Blob objects (Git's way of representing files)
            - Tree objects (Git's way of representing directories / grouping files together )
            - (The commits itself are also Git objects)
- We're about to traverse the (parent) tree. To make things a bit easier to understand. 
Compare this (parent) tree with the `universe` folder. 
The `universe` folder contains 2 tracked files of which one is located in a subdirectory called `stars`.
We'll see that this same structure is created inside our snapshot (using blob objects and tree objects).
- Traverse the tree, use the correct key:
    - `git cat-file -p <KEY>`
        - You should be fine by just using the first 6 (or even 4) characters of the key instead of the full key.
    - This will result in something like this:
        ```
        100644 blob 33c8f8b55425c2085bbdfcae3871d0cdf59c009a    earth.txt
        040000 tree f45cbf0cc0c5399e993080fc3ed157684f5162a1    stars
        ```
        - Copy/paste your result to a temporary file (don't place this file in your working directory).
        We'll need this result later on!
    - Using `git cat-file -p <KEY>`, do the following 
        - Read the contents of `earth.txt` (use the correct key)
        - Traverse the stars tree, you should see the sun.txt file and its key
            - copy this line (`<key> stars`) and paste it into the results file you created in the previous step.
        - Read the contents of `sun.txt` (use the correct key)
- By now, you've hopefully grasped how the Git repository stores its objects. 
Let's now find out what happens if a file is changed and committed.

## Optimized storing of objects in Git

- Modify the contents of `earth.txt`
- Add the changes to the stage (maybe first check the status)
- Commit, use message `"Some other content for earth"`
- Check the commit history, it should now contain two entries:
    - E.g.:
        ```
        commit 85f78f84a37f3b5426792d349f9388bab750ca58
        Author: nielsdelestinne <nielsdelestinne@my-hidden-email.com>
                Date:   Mon Jan 01 00:00:02 2018 +0100
        
            Some other content for earth
        
        commit 754899d32521d88134eab2f7108c600150465142
        Author: nielsdelestinne <nielsdelestinne@my-hidden-email.com>
                Date:   Mon Jan 01 00:00:01 2018 +0100
        
            creation of the universe
        ```
- Open the snapshot of the latest commit
    - `git cat-file -p <KEY>`
- Traverse the tree
    - Look at the tree of the commit: `git cat-file -p <KEY_OF_TREE>`
    - This should result in something like:
        ```
        100644 blob d573c8d5685fd17fbb287959e88dbbae78d65bee    earth.txt
        040000 tree f45cbf0cc0c5399e993080fc3ed157684f5162a1    stars
        ```
    - Look at the parent of the commit: `git cat-file -p <KEY_OF_PARENT>`
        ```
        tree ac9e4d8b1ed00d9859c355606fa9b95f801cd8c3
        author nielsdelestinne <nielsdelestinne@hotmail.com> 1515586507 +0100
        committer nielsdelestinne <nielsdelestinne@hotmail.com> 1515586507 +0100
        
        creation of the universe        
        ```
    - And look at the tree again (this time, of the parent): `git cat-file -p <KEY_OF_TREE>`
    - Compare these keys with the keys of the previous snapshot (the one you copy/pasted into a temporary file). 
        - You'll see our blob object (of earth.txt) has a different key now. Meaning, Git has created a different blob object.
        There now exist two different (blob object) versions of earth.txt in our Git repository. One containing the changes we made in the last commit, 
        the other containing only the original content.
        - The tree object (of stars) however, kept the same key. You'll notice that if you traverse this tree, 
        the blob object of sun.txt also has the same key as before. 
        Since the `sun.txt` file wasn't modified in our latest commit, Git doesn't need to create a new version (create a new blob object).
        In its latest snapshot, it simply references the already existing blob object (and tree) of sun.txt and stars (which is an optimized way of handling this situation). 
        That is why both these objects (both blob and tree) have kept their key in the latest snapshot.
 - Now, go back to the slides (the Git Basics chapter in particular) and compare what you've just seen happening with how it was described and visualized in the slides. 
 Does it connect? Questions, ask!
