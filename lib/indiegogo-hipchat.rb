# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'

require 'nokogiri'
require 'open-uri'
require 'hipchat'
require 'psych'



---
@filename = './config.yml'
@config = Psych::load(File.open(@filename))
exit if @config.nil?

@apikey = @config[:apikey]
@proj   = @config[:igg_project]


# Spin up a hipChat client.
Pledge.log("Spining up client for #{@proj}")
client = HipChat::Client.new(@apikey)

# Cache all the current pledges so the bot doesn't spam old shit.
Pledge.log "Caching current pledges for #{@proj}"
@pledges = Pledge.get_all(@proj).map(&:cache)
Pledge.log "Cached #{@pledges.length} old pledges."

# Let's start looking for pledges
Pledge.log "Watching for new pledges for #{@proj}..."
while true do
  queue = []
  # Post the new pledges to the channel and the terminal
  Pledge.get_all(@proj).each do |pledge|
    unless pledge.cached?
      queue << pledge.format_text
      pledge.cache
      Pledge.log "New pledge cached."
    end
  end

  # OH GOD WHY ARE YOU SO BIG
  exit if queue.length > 5

  queue.each do |post|
    Pledge.log "#{post}"
    client[@config[:channel]].send(@config[:nick], post, color: 'purple', notify: true)
  end

  sleep 30
end
