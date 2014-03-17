#!/usr/bin/env ruby
require 'optparse'
require_relative 'done'

@done = Done.new

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: doneski.rb"

  opts.on('-ls', '--list', 'Show all tasks') do
    puts Done.display_header
    puts @done.all
  end

  opts.on('-rmv', '--remove-completed', 'Clears all completed tasks from the list') do
    puts Done.display_header
    puts @done.clear_completed
  end

  opts.on('-c', '--completed', 'Completed tasks') do
    puts Done.display_header
    puts @done.completed
  end

  opts.on('-i', '--incomplete', 'Tasks in progress') do
    puts Done.display_header
    puts @done.incomplete
  end

  opts.on('-a', '--add title', 'Add a new task') do |title|
    puts Done.display_header
    puts @done.add(title)
  end

  opts.on('-f', '--finish id', "Finish a task #{@done.ids}") do |id|
    puts Done.display_header
    puts @done.finish(id)
  end

  opts.on('-h', '--help', 'Display help') do
    puts opts
    exit
  end
end


optparse.parse!
