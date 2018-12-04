# CODELAB 04: The purple revolt (exercise)

> Deprecated codelab. To be removed in the near future. **Do not solve...**

Note: make sure to regularly check the status of your local repository (with `git status`)
and your remote repository (on GitHub). Make sure you always understand the state your repositories are in.

1. On GitHub, create a new repository which you name *version-control-git-assignment-1*.
2. Locally, create a new directory (folder) with the same name.
3. Initialize a local Git repository within this folder (the root).
4. Create 3 *.txt* files inside the root, name them *"red.txt"*, *"blue.txt"* and *"green.txt"*
5. For every file, fill in the text *"I am color [color]"*, where you replace *[color]* with the color from the filename.
6. Push these 3 files to the remote repository on branch master (remember, you have to do some other steps before you can push).
    - Use a single commit, as your commit message use *initial commit*
7. Create a new directory (folder), name it *"new-colors"*.
8. In this folder, create a file *"purple.txt"* which contains the line *"I am color purple"*.
9. Push this new file to the remote repository on branch master
    - As your commit message use *"add purple.txt"*.
10. Your current folder tree structure should look like this
```
|--- version-control-git-assignment-1
|  |--- new-colors
|  |   |--- purple.txt
|  |--- blue.txt
|  |--- green.txt
|  |--- red.txt
```
11. Replace the contents of *red.txt*, *blue.txt*, *green.txt* and *purple.txt* to *"I am a file with [color] as my name"*. Replace *[color]* with the corresponding filename.
13. Push the files to the remote repository on branch master, but pay attention:
    - Use 2 different commits: one for *red*, *blue* and *green* and one for *purple*. 
    As commit messages use *"changing the 3 old colors"* and *"changing purple"*
14. Change the line of *purple.txt* to *"the future of new colors is now! Purple FTW!"*.
15. Push the changes, as the commit message use *"the revolt of purple"*.
16. Create and switch to the branch *"fixing_the_revolt"*.
17. Change the line of *purple.txt* to *"all colors are equal, new and old, purple and not purple"*.
18. Commit the changes with message *"stopped the purple revolt"*.
19. Push the local branch *"fixing_the_revolt"* to the remote repository.
20. Create and switch to the branch *"remember_the_purple_revolt"*
21. Change the line of *red.txt* to *"I am a file with red as my name. My color has flowed during the purple revolt, let us never forget"*.
22. Push the local branch *remember_the_purple_revolt* to the remote repository. As your commit message use *"remembering the purple revolt"*.
23. Switch back to the master branch.
24. First, merge the changes from the *fixing_the_revolt* branch into the master branch.
25. Secondly, merge the changes from the *remember_the_purple_revolt* branch into the master branch.
26. Push the master branch.
27. Great job, you completed the Git assignment (and stopped the purple revolt).
