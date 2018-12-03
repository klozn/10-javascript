# Codelab: conflicting merge

Things do not always go the way we want. Suppose a file has been changed in another branch, on the same line?
We will have to decide which line is correct. The other branch, my branch, or a combination of both. Clearly,
git cannot merge this automatically, and we will have to tell git how to deal with it.

The situation actually is not different from codelab 02. File is changed on both branches, and on merge, a new commit
will be made. Only this time, git will not be able to create the merge automatically.

![conflicting merge](../codelab02/git-merge-with-commit.png "Conflicting merge")


## 1. Setup (clone)
The setup is identical to codelab 02.

```
git clone https://github.com/stijnhaezebrouck/codelab-changed-on-branches.git exercise
cd exercise
git checkout feature
git checkout master
```

This is the result (head pointing to feature branch):

```
$ git log --all --decorate --oneline --graph
* c4b0120 (HEAD -> master) commit D
* 77a4170 commit B
| * 9d8f024 (feature) commit C
|/  
* f6ad194 commit A
```
