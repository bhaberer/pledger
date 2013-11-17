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
  def Pledger.log(text)
    puts "[Pledger] [#{Time.now.strftime("%Y.%m.%d@%H:%M:%S")}] #{text}"
  end
end
