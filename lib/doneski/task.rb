class Task
  attr_reader :id
  attr_accessor :title, :date_created, :stage

  STATUS = {new: 1, started: 5, complete: 2}

  def initialize(options)
    @id = options['id'] || (0...4).map { ('a'..'z').to_a[rand(26)] }.join
    @title = options['title']
    @stage = options['stage'] || STATUS[:new]
    @date_created = options['date_created'] || Time.now
    @priority = options['priority'] || ''
  end

  def complete
    @stage = STATUS[:complete]
  end

  def priority
    !@priority.nil? ? -@priority.length : nil
  end

  def priority=(priority)
    if priority.nil?
      @priority = ''
    else
      @priority = priority.match(/\+{1,}/)[0] unless priority.nil?
    end
  end

  def start
    @stage = STATUS[:started]
  end

  def match(options)
    options.each{|key, value| return true if self.send(key) == value}
    false
  end

  def to_s
    "| \e[0;3#{stage.to_s}m#{id.to_s.ljust(8)}#{title.ljust(80)[0...80]}#{date_created.to_s.ljust(30)}#{@priority.ljust(10)}\e[0m |"
  end
end
