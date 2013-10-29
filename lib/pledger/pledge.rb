class Pledge
  attr_accessor :name, :amount, :level
  @@cache = {}

  def initialize(name, amount, level)
    @name = name
    @amount = amount
    @level = level
  end


  def id
    self.name.downcase.gsub(/\s/, '_')
  end

  def format_text
    text = ["#{@name} just pledged"]
    text << (@amount == '' ? 'an undisclosed amount' : @amount)
    if @level == ''
      text << "(#{@level})"
    end
    return text.join(' ')
  end

  def cache
    @@cache[id] = self
  end

  def cached?
    @@cache.key?(id)
  end

end
