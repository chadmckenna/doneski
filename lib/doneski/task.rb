class Task
  attr_reader :id
  attr_accessor :title, :date_created, :date_updated, :stage

  STATUS = {new: 1, started: 5, complete: 2}

  def initialize(options)
    @id = options['id'] || (0...4).map { ('a'..'z').to_a[rand(26)] }.join
    @title = options['title']
    @stage = options['stage'] || STATUS[:new]
    @date_created = options['date_created'] || Time.now
    @date_updated = options['date_updated'] || nil
  end

  def complete
    @date_updated = Time.now
    @stage = STATUS[:complete]
  end

  def start
    @date_updated = Time.now
    @stage = STATUS[:started]
  end

  def match(options)
    options.each{|key, value| return true if self.send(key) == value}
    false
  end

  def to_s
    "| \e[0;3#{stage.to_s}m#{id.to_s.ljust(8)}#{title.ljust(80)[0...80]}#{date_created.to_s.ljust(30)}#{date_updated.to_s.ljust(30)}\e[0m |"
  end
end