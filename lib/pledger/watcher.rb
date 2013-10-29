module Pledger
  class Watcher
    attr_accessor :client, :project, :delay

    def initialize(client, project, delay: 30)
      @client = client
      @project = project
      @delay = delay
    end

    def log(text)
       puts "[Pledger] [#{Time.now.strftime("%Y.%m.%d@%H:%M:%S")}] #{text}"
    end

    def start
      # Fetch all pledges for the project
      @pledges = project.pledges

      # Cache all the current pledges so the bot doesn't spam old shit.
      log "Caching current pledges for #{project.project_id}"
      @pledges.map(&:cache)
      log "Cached #{@pledges.length} old pledges."

      # Let's start looking for pledges
      log "Watching for new pledges for #{project.project_id}..."

      while true do
        queue = []
        # Post the new pledges to the channel and the terminal
        project.pledges.each do |pledge|
          unless pledge.cached?
            queue << pledge.format_text
            pledge.cache
            log "New pledge cached."
          end
        end

        queue.each do |post|
          log post
          client.send_message(post)
        end

        sleep @delay
      end
    end
  end
end
