# doneski

This is a quick CLI to manage tasks. 

You can install the gem simply with:

```
$ gem install doneski 
```

Simply run `doneski` to list your current tasks. You can add a task by calling `doneski -a The task title here`. 

![alt tag](https://raw.github.com/chadmckenna/doneski/master/screenshot.png)

Running `doneski -h` will get you a list of functions that can be called.

Current functions:
```
$ doneski -l [column to sort]
```
Example: `doneski -l title` will sort by title
```
$ doneski -r [id]
```
Example: `doneski -r xysf` will remove the task with the `id` of `xysf`
Example: `doneski -r` will remove ALL completed tasks
```
$ doneski -a The task title goes here
```
This will add a new task with the title `The task title goes here` and move the task to the `:new` phase
```
$ doneski -s id
```
Example: `doneski -s xysf` will move the task with the id `xysf` to the `:started` phase
```
$ doneski -f id
```
Example: `doneski -f xysf` will finish the task with the id `xysf` to the `:completed` phase
```
$ doneski -h
```
This will display the help menu

Ruby 2.0 and 1.9.3 have been tested.
