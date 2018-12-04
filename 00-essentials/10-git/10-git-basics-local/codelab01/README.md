# Codelab01

A codelab in which you'll initialize a git repository, 
create and modify some files, add them to the stage (staging area) and commit them.

## Install and Initialize

- Create a directory named `cars` (this is our working directory)
    - Tip: create it on a easy accessible place. E.g. in your home folder, or in c:\ (short path)
- To know if you have correctly installed Git, execute the following command in your terminal / CMD: `git --version`
    - If Git is correctly installed, the command will be recognized and it will answer you by providing you with the installed version number of Git.
    - If the command is not recognized, you either haven't installed Git, or the `git` command is not available on your PATH.
- If you already have installed Git, you can skip this step.
    - If not, download the latest installer of Git and execute that installer. 
    After installation, try running the `git --version` command again.
        - Before re-running the command, make sure you've closed and reopened all your terminal / CMD instances after installation. 
        It's possible the `git` command still won't be recognized.
    - Now, set your identity (you only have to do this once, the first time)
        - Execute command `git config --global user.name "Your Name"` for setting your username
        - Execute command `git config --global user.email your-email@mail.com` for setting your email
        - This information is stored in the `gitconfig` file. On Windows, this file is usually located in the $HOME directory (`c:\Users\$USER`)
        - This information will be used by Git to enrich its data
        
- Initialize an empty git repository in this directory
    - Use the terminal / command line (CMD), make sure you navigate (command: `cd <PATH>`) to your working directory before initializing.
    - After successfully executing the correct command, you should receive the following message
        ```
        Initialized empty Git repository in <PATH_TO_DIRECTORY>/cars/.git/
        ```
- Go inside your working directory, you should see the `.git` directory.
    - If not, it's possible your hidden folders are not visible
        - In Windows: `Control panel > File / Folder Explorer Options > View (tab)`. 
        In the Advanced setting box, enable the `Show hidden files, folders, and drives` 
        and disable the `Hide extensions for known file types`
- We're all set to start creating some files!

## Creating some new files, add to stage and commit

- Create the following directory structure:
    ```
        |-- cars
            |-- lightningmcqueen.txt
            |-- expensive
                |-- ferrari.txt
                |-- lamborghini.txt
            | -- cheap
                |-- lada.txt
        |-- .git  
    ```
    - Provide each `.txt` with some (dummy) content.
- Get yourself an overview of which files are untracked, unstaged or staged
    - There's a git command for this: `git status`. It shows the working directory status. 
    - Tip: Every git command should be executed from the path of your working directory (and not deeper)
        - E.g. `c:\switchfully\cars> git <command>`
    - You should get the following result:
        ```
        On branch master
        
        No commits yet
        
        Untracked files:
          (use "git add <file>..." to include in what will be committed)
        
                cheap/
                expensive/
                lightningmcqueen.txt
        
        nothing added to commit but untracked files present (use "git add" to track)
        ```
- Start tracking the `lightningmcqueen.txt` file. By doing so, it will be added to the staging area
    - `git add lightningmcqueen.txt` 
- Get yourself a status overview of your files
    - You should now get the following result:
        ```
        On branch master
        
        No commits yet
        
        Changes to be committed:
          (use "git rm --cached <file>..." to unstage)
        
                new file:   lightningmcqueen.txt
        
        Untracked files:
          (use "git add <file>..." to include in what will be committed)
        
                cheap/
                expensive/
        ```
        - From now on, git is fully aware of the `lightningmcqueen.txt` file and it will actively monitor it.
- Commit the staged changes, as commit message use `"cars initial commit"`
    - All staged changes (files) will be committed
    - A snapshot will be created of the current situation (only taken into account all the tracked files, so for now, just lightningmcqueen.txt)
    - After committing, this should be the returned result:
        ```
         1 file changed, 1 insertion(+)
         create mode 100644 lightningmcqueen.txt
        ```
- Get yourself an overview of the commit history using `git log`
    - Each commit has a unique key / identifier, the author, date of commit and message. 
- Get yourself a status overview:
    ```
    On branch master
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            cheap/
            expensive/
    
    nothing added to commit but untracked files present (use "git add" to track)
    ```     
- Add the remaining changes to the stage
    - You can do this in multiple ways, all have the same end result in your current situation:
        - `git add .` adds all changes
        - `git add *.txt` adds all changes of files ending with `.txt`
        - `git add cheap expensive` adds all changes inside directories `cheap` and `expansive`
    - Good to know: Git itself doesn't add directories to its repository (as in: an empty directory does not have any meaning to Git), but it does keep the parent-child **tree** relation, so whenever a directory contains at least one tracked file, it will 'remember' the directories naam and it's position in the tree.
- Get yourself a status overview:
    ```
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
            new file:   cheap/lada.txt
            new file:   expensive/ferrari.txt
            new file:   expensive/lamborghini.txt
    ``` 
    - From now on, git is also fully aware of all the other files, not longer only of the `lightningmcqueen.txt` file.
- Commit the staged changes, as commit message use `"cheap and expensive cars added"`
    - result:
        ```
        [master 904af61] cheap and expensive cars added
         3 files changed, 3 insertions(+)
         create mode 100644 cheap/lada.txt
         create mode 100644 expensive/ferrari.txt
         create mode 100644 expensive/lamborghini.txt
        ```
- Get yourself an overview of the commit history using `git log`
    - You should see a new entry
- Get yourself a status overview:
    ```
    On branch master
    nothing to commit, working tree clean
    ```
    - Meaning: we have no untracked files, nor do we have any modified files!
    
### Modifying files, adding and committing changes

- Open up your `lightningmcqueen.txt` file, alter its content and save it
    - E.g. from `"cars the movie"` to `"from cars da movie"`
- Get yourself a status overview
    - Git should detect its tracked file `lightningmcqueen.txt` is modified
        ```
        On branch master
        Changes not staged for commit:
          (use "git add <file>..." to update what will be committed)
          (use "git checkout -- <file>..." to discard changes in working directory)
        
                modified:   lightningmcqueen.txt
        
        no changes added to commit (use "git add" and/or "git commit -a")
        ```
    - We can even ask Git what the exact changes are, it has all this information.
        - Command `git diff` should return:
            ```
            diff --git a/lightningmcqueen.txt b/lightningmcqueen.txt
            index 3beee19..1fbe043 100644
            --- a/lightningmcqueen.txt
            +++ b/lightningmcqueen.txt
            @@ -1 +1 @@
            -"cars the movie"
            +"from cars da movie"
            ```
- Add these changes to the stage.
- Commit the changes with message `"changed the only sentence to something better"`
- Check the status. The working directory should be clean, we should have nothing to commit:
    ```
    On branch master
    nothing to commit, working tree clean
    ```
- Check the commit history
    - You should have 3 entries: meaning we have 3 different snapshots ("picture of a certain state").
