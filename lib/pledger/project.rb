module Pledger
  class Project
    attr_accessor :project_id

    def initialize(project_id)
      @project_id = project_id
    end
  end
end
