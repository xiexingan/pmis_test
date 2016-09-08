# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module PMValidation
  class ValidationStep
    attr_reader :id, :name, :step_actor
    attr_accessor :state

    def initialize(step_actor, name)
      @id = StepID.instance.fetch_id
      @name = name
      @step_actor = step_actor
      @step_result = nil
      @state = :ready
    end

    def run
      @response = 0
      @success = false
      begin
        @response = self.run_step
        @success = true
      rescue
        @success = false
      end
      @state = :already_run
      @step_result = StepResult.new(@name, @success, @response)
    end

    def get_result
      @step_result
    end
    
    protected
    def run_step
      raise NotImplementError, "run_step methods should be override!"
    end
  end
  
  class StartStep < ValidationStep
    def initialize(step_actor)
      super(step_actor, :start)
    end
    
    protected
    def run_step
      @step_actor.start
    end
  end
  
  class EndStep < ValidationStep
    def initialize(step_actor)
      super(step_actor, :end)
    end
    
    protected
    def run_step
      @step_actor.stop
    end
  end
  
  class OpenPageStep < ValidationStep
    attr_reader :url
    def initialize(step_actor, name, url)
      @url = url
      super(step_actor, name)
    end
    
    protected
    def run_step
      @step_actor.goto(@url)
    end
  end
  
  class SetTextStep < ValidationStep
    attr_reader :text, :options
    def initialize(step_actor, name, text, options={})
      @text = text
      @options = options
      super(step_actor, name)
    end
    
    protected
    def run_step
      @step_actor.set_text(@text, @options)
    end
  end
  
  class ClickStep < ValidationStep
    attr_reader :options
    def initialize(step_actor, name, options={})
      @options = options
      super(step_actor, name)
    end
    
    protected
    def run_step
      @step_actor.click(@options)
    end
  end
end
