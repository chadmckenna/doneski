#!/usr/bin/env ruby
require 'optparse'
require_relative 'tasks_collection'

@done = TasksCollection.new

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: doneski.rb"

  opts.on('-ls', '--list', 'Show all tasks') do
    puts TasksCollection.display_header
    puts @done.all
  end

  opts.on('-r', '--remove [ID]', 'Clears all completed tasks from the list') do |id|
    puts TasksCollection.display_header
    puts @done.remove id: id if id
    puts @done.remove completed: true unless id
  end

  opts.on('-c', '--completed', 'Completed tasks') do
    puts TasksCollection.display_header
    puts @done.completed
  end

  opts.on('-i', '--incomplete', 'Tasks in progress') do
    puts TasksCollection.display_header
    puts @done.incomplete
  end

  opts.on('-a', '--add title', 'Add a new task') do |title|
    puts TasksCollection.display_header
    puts @done.add(title)
  end

  opts.on('-s', '--start id', 'Start a task') do |id|
    puts TasksCollection.display_header
    puts @done.start(id)
  end

  opts.on('-f', '--finish id', "Finish a task") do |id|
    puts TasksCollection.display_header
    puts @done.finish(id)
  end

  opts.on('-h', '--help', 'Display help') do
    puts opts
    exit
  end
end


optparse.parse!
