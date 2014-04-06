require 'yaml/store'

class TasksCollection

  @@location = File.expand_path '~/.task.store'

  def initialize
    create unless File.exists? @@location
    @yaml = YAML.load_file(@@location)
    @tasks = @yaml ? @yaml['tasks'] : []
    update_attributes(@tasks)
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

  def set_priority(id, priority)
    @tasks.select{|task| task.match({id: id})}.first.priority = priority
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
    "#{'-'*132}\n| #{'id:'.ljust(8)}#{'title:'.ljust(80)}#{'created:'.ljust(30)}#{'priority:'.ljust(10)} |\n#{'-'*132}"
  end

  def self.display_footer
    "#{'-'*132}"
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

  def update_attributes(tasks)
    tasks.each do |task|
      attrs.each do |attr|
        task.send((attr.to_s+"=").to_sym, '') unless task.send attr
      end
    end
  end

  def attrs
    [:title, :date_created, :stage, :priority]
  end

end
