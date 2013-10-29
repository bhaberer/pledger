# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'

require 'nokogiri'
require 'open-uri'
require 'hipchat'
require 'psych'

require 'pledger/pledge'
require 'pledger/watcher'
require 'pledger/client'
require 'pledger/client/hipchat'
require 'pledger/project'
require 'pledger/project/indiegogo'

module Pledger
  def Pledger.log(text, project = @proj)
     puts "[Pledger] [#{Time.now.strftime("%Y.%m.%d@%H:%M:%S")}] #{text}"
  end

  def Pledger.start(project, chatclient)
    @proj = ''
    # Cache all the current pledges so the bot doesn't spam old shit.
    Pledger.log "Caching current pledges for #{project.project_id}"
    @pledges = projectclient.get_pledges.map(&:cache)
    Pledger.log "Cached #{@pledges.length} old pledges."

    # Let's start looking for pledges
    Pledger.log "Watching for new pledges for #{project.project_id}..."

    while true do
      queue = []
      # Post the new pledges to the channel and the terminal
      projectclient.get_pledges.each do |pledge|
        unless pledge.cached?
          queue << pledge.format_text
          pledge.cache
          Pledger.log "New pledge cached."
        end
      end

      queue.each do |post|
        Pledger.log "#{post}"
        client[@config[:channel]].send(@config[:nick], post, color: 'purple', notify: true)
      end

      sleep 30
    end
  end
end

