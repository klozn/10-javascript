# CODELAB 01

Let's fork

# FORK

## 1. Forking the Guava repository

1. Go to `https://github.com/google/guava`
2. On the right, at the top, you'll see a button called `Fork`
3. Click on it, it will create a fork!
    - After a few seconds, a fork should have been created. 
    Meaning you have a full copy of the Guava repository on your own GitHub account (`https://github.com/<your_username>/guava`).
4. There's nothing more to creating a fork.

## 2. A Forking workflow

Creating a fork is most likely part of a bigger plan. Let's setup a basic forking workflow.
One where we can make changes to our local copy of the Guava repository and push them to our own fork on GitHub (origin).
However, when contributors push changes to the original Guava repository (upstream), we want to be able to pull them into our own copy.

1. Reuse the directory (`repositories`, `githubrepos`,...) that you created in codelab02 of the Git Basics Remote codelabs.
2. Using CMD, navigate to this directory
3. Clone your fork (`https://github.com/<your_username>/guava.git`)
4. Edit a single file. Just change some of its contents (and save it).
4. Add those changes to the stage
5. Commit those changes, use a describing message
6. Check your configured remotes
    - origin should be set to your fork!
7. Push branch master to the origin remote
8. Check on GitHub that your made commit came through.

We still have to configure the upstream remote, so we can pull changes from (sync with) the original Guava repository.

1. Add the remote `upstream`, connecting to the original Guava repository (`https://github.com/google/guava.git`)
2. Pull from upstream
    - Since `upstream` is not our default remote (origin is), we'll have to specify from which branch we pull. 
    Pull from the upstream master branch (main/live).
    
Any changes made to Guava (on the main / live / master branch) will be integrated into our own local repository, 
which we can then push to our own fork!