module Pledger
  class Watcher
    attr_accessor :client, :project, :delay

    def initialize(client, project, delay: 30)
      @client = client
      @project = project
      @delay = delay
    end

    def start
      # Fetch all pledges for the project
      @pledges = project.pledges

      # Cache all the current pledges so the bot doesn't spam old shit.
      Pledger.log "Caching current pledges for #{project.project_id}"
      @pledges.map(&:cache)
      Pledger.log "Cached #{@pledges.length} old pledges."

      # Let's start looking for pledges
      Pledger.log "Watching for new pledges for #{project.project_id}..."

      while true do
        queue = []
        # Post the new pledges to the channel and the terminal
        project.pledges.each do |pledge|
          unless pledge.cached?
            pledge_text = pledge.format_text
            pledge_text << "[Total: #{project.total}]" unless project.total.nil?
            queue << pledge_text
            pledge.cache
            Pledger.log "New pledge cached."
          end
        end

        queue.each do |post|
          Pledger.log post
          client.send(post, total: project.total)
        end

        sleep @delay
      end
    end
  end
end
