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

  def to_s
    {
      id: id,
      title: title,
      date_created: date_created,
      date_finished: date_finished,
      completed?: completed?
    }.to_s
  end
end