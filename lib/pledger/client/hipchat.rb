class Hipchat < Pledger:: Client
  attr_accessor :apikey

  def initialize(apikey, channel, nick = 'pledgie_bot')
    super
    @apikey = apikey
  end


end
