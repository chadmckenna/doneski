#!/usr/bin/env ruby
require 'optparse'
require_relative 'done'

@done = Done.new

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: doneski.rb"

  opts.on('-c', '--completed', 'Completed tasks') do
    puts @done.completed
  end

  opts.on('-i', '--incomplete', 'Tasks in progress') do
    puts @done.incomplete
  end

  opts.on('-a', '--add title', 'Add a new task') do |title|
    puts @done.add(title)
  end

  opts.on('-f', '--finish id', "Finish a task #{@done.ids}") do |id|
    puts @done.finish(id)
  end

  opts.on('-h', '--help', 'Display help') do
    puts opts
    exit
  end
end


optparse.parse!
