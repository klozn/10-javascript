# CODELAB 02

Let's clone!

# CLONE
We can only clone an existing Git repository.
So, let's find one first.

## 1. Find a repository to clone
Let's go to GitHub. More specific, let's go to the top trending Java or C# repositories of the day.

Surf to `https://github.com/trending/java` or `https://github.com/trending/csharp` and select yourself an interesting repository to clone.

1. Click on the name of the repository you want to clone
2. You're now on the repository main GitHub page.
3. On the right, you'll see a button **Clone or download**.
4. Click on this button, we're going to clone this repository using the HTTPS protocol
    - Alternatively, we can clone using the SSH protocol. But this requires more configuration. 
    GitHub currently also recommends using HTTPS over SSH. So, let's stick to HTTPS.
5. Copy the url of the repository, e.g.: `https://github.com/user/repository.git`
    - Notice how it's the same url as the url in the browser's address bar + the `.git` extension.
6. Now, locally, create a new directory. Call it something like `repositories`, `githubrepos`,...
7. Using CMD, navigate to this directory
8. Clone the selected repository (you can paste the url)
    - A directory with as name the name of the selected repository will be created. 
    Inside this directory, all the files of the repository will be downloaded (over HTTPS).
9. After executing the clone command, your output should be something like this:
    ```
    Cloning into 'name-of-the-repo'...
    remote: Counting objects: 54381, done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 54381 (delta 0), reused 0 (delta 0), pack-reused 54379
    Receiving objects: 100% (54381/54381), 8.85 MiB | 3.96 MiB/s, done.
    Resolving deltas: 100% (19814/19814), done.
    Checking out files: 100% (1829/1829), done.
    ```
10. Inspect the directory, it should contain all the files (source code) you also saw on the GitHub page.
11. You have successfully cloned an existing repository.

## 2. What did we clone besides the actual source code?
Since we cloned an entire git repository, we not only cloned the actual source code, 
but we also cloned the entire history (Git objects: all the different versions of our source code files, snapshots, commits)

1. Check the Git commit history (you know the command for this)
    - You'll probably notice that the commit history is scrollable (press enter a few times, it'll scroll down)
    - Examine some of the most recent commits
    - To close the Git commit history, press `q`
    
## 3. Let's try and Push some changes

1. Firstly, do a quick status check, there shouldn't be any untracked or modified files
2. Now, edit a single file. Just change some of its contents (and save them).
3. Check the status, you should see the file you just edit show up as a modified file
4. Add those changes to the stage
5. Commit those changes, use a describing message
6. Before pushing, check your remotes (does Git know to where it can push?)
    - `git remote -v`
    - See how our origin is perfectly configured (our Clone command does this for us)
7. Almost there, but before pushing. Let's pull from origin (it's possible someone already pushed new changes)
8. After pulling, you can now push the master branch to origin.
    - You should get the following result:
        ```
        remote: Permission to user/remote-repo.git denied to nielsdelestinne.
        fatal: unable to access 'https://github.com/user/remote-repo.git/': The requested URL returned error: 403
        ```
9. Our push failed, think about how this is pretty obvious.
    - With open source, anyone is able to see the source code and get a copy of that source code. 
    However, if every individual (even those with malicious intent) has the possibility to alter the code and push the changes to everyone else, 
    the source code would become a complete mess. Only the project maintainer (owner) and users with the role 
    contributor can push code to a remote (GitHub) repository.
