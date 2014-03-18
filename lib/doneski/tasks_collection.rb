require 'yaml/store'

class TasksCollection

  @@location = File.expand_path '~/.task.store'

  def initialize
    create unless File.exists? @@location
    @yaml = YAML.load_file(@@location)
    @tasks = @yaml ? @yaml['tasks'] : []
  end

  def all
    @tasks
  end

  def sort(column = :stage)
    @tasks.sort {|a, b| a.send(column) <=> b.send(column)} if @tasks.length > 0
  end

  def remove(options)
    @tasks = @tasks.select{|task| !task.match(options)}
    store
  end

  def add(title)
    @tasks << Task.new({'title' => title})
    store
  end

  def finish(id)
    @tasks.select{|task| task.id.to_s == id.to_s}.first.complete
    store
  end

  def start(id)
    @tasks.select{|task| task.id.to_s == id.to_s}.first.start
    store
  end

  def self.display_header
    "#{'-'*152}\n| #{'id:'.ljust(8)}#{'title:'.ljust(80)}#{'created:'.ljust(30)}#{'updated:'.ljust(30)} |\n#{'-'*152}"
  end

  def self.display_footer
    "#{'-'*152}"
  end

private
  
  def store
    @store = YAML::Store.new(@@location)
    @store.transaction do
      @store['tasks'] = @tasks
    end
  end

  def create
    File.open(@@location, 'w+'){|f| f.puts "# .task.store"}
  end

end