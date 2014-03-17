class Task
  attr_reader :id
  attr_accessor :title, :date_created, :date_finished, :completed

  def initialize(options)
    @id = options['id'] || (0...4).map { ('a'..'z').to_a[rand(26)] }.join
    @title = options['title']
    @completed = options['completed'] || false
    @date_created = options['date_created'] || Time.now
    @date_finished = options['date_finished'] || nil
  end

  def complete
    @date_finished = Time.now
    @completed = true
  end

  def completed?
    completed
  end

  def match(options)
    options.each{|key, value| return true if self.send(key) == value}
    false
  end

  def to_s
    "\e[0;3#{completed? ? '2' : '1'}m#{id.to_s.ljust(8)}#{title.ljust(80)}#{date_created.to_s.ljust(30)}#{date_finished.to_s.ljust(30)}\e[0m"
  end
end