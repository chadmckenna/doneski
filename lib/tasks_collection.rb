require 'yaml/store'
require_relative 'task'

class TasksCollection

  @@location = ENV['HOME'] + '/.task.store'

  def initialize
    `touch #{@@location}`
    @yaml = YAML.load_file(@@location)
    @tasks = @yaml ? @yaml['tasks'] : []
  end

  def all
    @tasks
  end

  def remove(options)
    @tasks = @tasks.select{|task| !task.match(options)}
    store
    @tasks
  end

  def completed
    @tasks.select{|task| task.completed? }
  end

  def incomplete
    @tasks.select{|task| !task.completed? }
  end

  def add(title)
    @tasks << Task.new({'title' => title})
    store
    @tasks
  end

  def finish(id)
    task = @tasks.select{|task| task.id.to_s == id.to_s}.first
    task.complete
    store
    task
  end

  def start(id)
    task = @tasks.select{|task| task.id.to_s == id.to_s}.first
    task.start
    store
    task    
  end

  def self.display_header
    "#{'id:'.ljust(8)}#{'title:'.ljust(80)}#{'created:'.ljust(30)}#{'updated:'.ljust(30)}"
  end

private
  
  def store
    @store = YAML::Store.new(@@location)
    @store.transaction do
      @store['tasks'] = @tasks
    end
  end

end