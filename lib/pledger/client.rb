module Pledger
  class Client
    attr_accessor :channel, :nick

    def initialize(channel, nick)
      @channel = channel
      @nick = nick
    end
  end
end
