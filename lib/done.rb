require 'yaml/store'
require 'fileutils'
require_relative 'task'

class Done

  def initialize
    FileUtils.touch '~/.task.store'
    @yaml = YAML.load_file('~/.task.store')
    @tasks = @yaml ? @yaml['tasks'] : []
  end

  def completed
    @tasks.select{|task| task.completed? }
  end

  def incomplete
    @tasks.select{|task| !task.completed? }
  end

  def ids
    @tasks.map(&:id)
  end

  def add(title)
    @tasks << Task.new({'title' => title})
    store
    @tasks.last
  end

  def finish(id)
    task = @tasks.select{|task| task.id.to_s == id.to_s}.first
    task.complete
    store
    task
  end

private
  
  def store
    @store = YAML::Store.new 'task.store'
    @store.transaction do
      @store['tasks'] = @tasks
    end
  end

end