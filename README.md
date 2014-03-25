# doneski

[![Gem Version](https://badge.fury.io/rb/doneski.png)](http://badge.fury.io/rb/doneski)

This is a quick CLI to manage tasks. 

You can install the gem simply with:

```
$ gem install doneski 
```

Simply run `doneski` to list your current tasks. You can add a task by calling `doneski -a The task title here`. 

![alt tag](https://raw.github.com/chadmckenna/doneski/master/screenshot.png)

## Current functionality:
### Listing tasks
```
$ doneski -l [column to sort]
```
Example: `doneski -l title` will sort by title

### Adding tasks
```
$ doneski -a The task title goes here
```
This will add a new task with the title `The task title goes here` and move the task to the `:new` phase

### Removing tasks
```
$ doneski -r [id]
```
Example: `doneski -r xysf` will remove the task with the `id` of `xysf`
Example: `doneski -r` will remove ALL completed tasks

### Starting tasks
```
$ doneski -s id
```
Example: `doneski -s xysf` will move the task with the id `xysf` to the `:started` phase

### Finishing tasks
```
$ doneski -f id
```
Example: `doneski -f xysf` will finish the task with the id `xysf` to the `:completed` phase

### Getting help
```
$ doneski -h
```
This will display the help menu

Ruby 2.0 and 1.9.3 have been tested.
