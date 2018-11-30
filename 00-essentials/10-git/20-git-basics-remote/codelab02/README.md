# CODELAB: Cloning

Let's clone a remote repository. Thus, create a local repository out of an already existing remote repository!

# CLONE YOUR OWN REMOTE REPOSITORY

## 1. Setup
In the previous codelab, you created your own remote repository. Let's reuse that one.

Start by creating a new empty folder for this codelab in your working directory (don't reuse the one from the previous codelab. 
However, don't throw away the folder from the previous codelab either).

In it, clone your existing remote repository from the previous codelab:
```
git clone https://github.com/<username>/switchfully-version-control-git.git
```

After executing the clone command, inspect the output
```
Cloning into 'switchfully-version-control-git'...
remote: Enumerating objects: 26, done.
remote: Counting objects: 100% (26/26), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 26 (delta 0), reused 12 (delta 0), pack-reused 0
Unpacking objects: 100% (26/26), done.
```

## 2. Inspect your repository

Inspect the directory, it should contain all of your files + the `.git` directory.

Since we cloned an entire git repository, we download the entire project history (so not just the file we see in the explorer). 
We downloaded all objects git stores: the different versions of our files, commits, branches, references,...)

Check the Git commit history (you know the command for this). See that all of your previous commits are there?

Check your configured remotes (`git remote -v`), see that by cloning we have already a remote called origin configured.

## 3. Commit a new file

1. Create a new file, provide it with some content
2. Let Git start tracking it by adding it to the stage
3. Make a commit containing the current changes
4. Check the status, notice how we're now 1 commit ahead of master on origin?

## 4. Push your changes

Push your changes to the configured remote. You should be able to just execute command `git push`, 
but for clarity, execute command `git push origin master`.

When your push is complete, go on GitHub and refresh your repository page. 
In the 'Code' tab, you should see your new file with its changes.

## 5. Pull changes

Go back to the folder from the **previous codelab**. 
It should still contain a local git repository configured with an `origin` remote that is pointing to `https://github.com/<username>/switchfully-version-control-git.git` as well.

For now, the newly created file should not be present in this folder. But when we pull the changes from the `origin` remote, it will be there.

Now, pull from the origin: `git pull origin master`.

After successfully pulling, the newly created file should be present in the folder. 
Check the commit history to see that your new commit is now part of it as well.

# CLONE ANOTHER REMOTE REPOSITORY

When we want to clone, we need an existing Git repository.
Let's find one that contains some open-source code.

## 1. Find a repository to clone
Let's go to GitHub. More specific, let's go to the top trending Java or C# repositories of the day.

Surf to `https://github.com/trending/java` or `https://github.com/trending/csharp` and select yourself an interesting repository to clone.
- sidenote: make sure the repository is not **huge**, as in, not more than a few MB to download. 

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
    
## 2. What does the commit history look like?

Check the Git commit history
- You'll probably notice that the commit history is long and scrollable (press enter a few times, it'll scroll down)
- Examine some of the most recent commits
- To close the Git commit history, press `q`
- You can add the `-n` option to specify how many commits you want to show in the history, e.g. `git log -5`
    
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
