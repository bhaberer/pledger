require 'hipchat'

module Pledger
  class Hipchat < Pledger::Client
    attr_accessor :apikey, :color, :notify
    attr_reader :client

    def initialize(apikey, channel, nick: 'pledgie_bot', color: 'purple', notify: true)
      super(channel, nick)
      @apikey = apikey
      @color = color
      @notify = notify
      @client = HipChat::Client.new(@apikey)
    end

    def post_message(text)
      @client[@channel].send(@nick, text, color: @color, notify: @notify)
    end
  end
end
