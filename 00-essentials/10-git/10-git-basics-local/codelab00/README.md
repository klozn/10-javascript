Before we continue with the git exercises, 
we'll provide you with a brief introduction on how to navigate your working directory from the command line.

It's a useful skill to have.

You can skip this exercise if you are already familiar with command line prompt navigation.

## 1. Navigating your working directory using the command line (CMD) or Terminal

### Your current location

Check your CMD or Terminal window, you will see a blinking underscore. This is your cursor.
The cursor is always prefixed by the *path* in which you're currently located.
E.g.:
```
C:\folders\switchfully> _
```

**Note**: On mac/unix based systems: the `>` will be replaced by the `$` sign, possibly prefixed by the user.
On mac, only the last part of the path is shown:
```
mac-pc: switchfully nielsd$ _
```

but you can show the current path using the `pwd` command:
```
mac-pc: switchfully nielsd$ pwd
/Users/nieldsd/switchfully
```

### Navigate downwards (deeper in the folder / directory hierarchy)

To move down one folder (to go deeper), use `cd <NAME_OF_FOLDER>`.

The command `cd` stands for 'change directory' and allows for multiple arguments.
By doing so, we will navigate to the specified subfolder (which needs to exist) of the current folder we're in:
```
C:\folders\switchfully> cd version-control
C:\folders\switchfully\version-control> _
```

To go more than one 'level' down, repeat the individual commands or chain the folders:
```
C:\folders\switchfully> cd version-control
C:\folders\switchfully\version-control> cd labs
C:\folders\switchfully\version-control\labs> _
```

or:
```
C:\folders\switchfully> cd version-control\labs
C:\folders\switchfully\version-control\labs> _
```

Use forward slashes on a unix like os:
```
mac-pc:switchfully nielsd$ cd version-control/labs
mac-pc:labs nielsd$
```

### Navigate upwards

To move up one folder, use `cd ..`

By doing so, we will navigate to the parent folder of the current folder we're in:
```
C:\folders\switchfully> cd ..
C:\folders> _
```

To go up more than one 'level', add `..` for every level:
```
C:\folders\switchfully> cd ..
C:\folders> cd ..
C:\> _
```

You can chain the `..`'s into a single command:
```
C:\folders\switchfully> cd ..\..
C:\> _
```

### show the content of the current directory

To show what files and other directories the current directory (which is a synonym for folder) contains use `dir` on Windows 
and `ls` on Mac/Unix:
```
C:\folders\switchfully> dir
```

or, on mac/unix:
```
mac-pc:switchfully nielsd$ ls
```

### Create a directory

A directory, synonym for folder, can be created using the `mkdir` command.
After creating a directory, we can navigate to it:
```
C:\folders\switchfully> mkdir mynewfolder
C:\folders\switchfully> cd mynewfolder
C:\folders\switchfully\mynewfolder> _
```

### Create a file

We can create new files using the `echo` and `>` command:

```
C:\folders\switchfully> echo hello world > myfile.txt
```

This will create the file myfile.txt (if it does not yet exists) and inserts "hello world" as its content.
It is possible on mac or unix based systems that you have to use quotes for the content:
```
mac-pc:switchfully nielsd$ echo "hello world" > myfile.txt
```

The `>` command overwrites the already existing content. The `>>` command adds the new content to the already present content.

### Conclusion to navigating your working directory using the command line (CMD) or Terminal

This is as far as our introduction to command line navigation goes.

From now on, for the purpose of simplicity, 
we'll leave out the path part whenever we provide you with commands to execute.
This means that:
```
C:\folders\switchfully> echo hello world > myfile.txt
```

will be presented as:
```
echo hello world > myfile.txt
```

And we will be using forward path separators `/`. Windows users should read them as backslashes ` \ `.

## 2. Create a working directory
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

or

```
mac-pc: switchfully nielsd$ pwd
/Users/nieldsd/switchfully
```

Now, each time you start a new codelab, make a new folder within the `switchfully` folder. 
For each codelab, you will be creating a new git repo.

```
mkdir codelab01
cd codelab01
```
