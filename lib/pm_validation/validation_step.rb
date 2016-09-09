# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module PMValidation
  class ValidationStep
    attr_reader :id, :name, :step_actor, :options
    attr_accessor :state, :verify_element_options, :verify_expected

    def initialize(step_actor, name, options={})
      @id = StepID.instance.fetch_id
      @name = name
      @step_actor = step_actor
      @step_result = nil
      @state = :ready
      @options = options
      @verify_element_options = nil
      @verify_expected = true
      
    end

    def run
      start = Time.now
      @success = false
      self.run_step
      verify
      @state = :already_run
      @step_result = StepResult.new(@name, true, Time.now - start)
    end

    def get_result
      @step_result
    end
    
    protected
    def run_step
      raise NotImplementError, "run_step methods should be override!"
    end
    
    protected
    def verify
      @step_actor.wait_verify_element_present(@verify_element_options, @verify_expected) if verify_is_required?
    end
    
    private
    def verify_is_required?
      @verify_element_options && self.class != VerifyElementStep
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
    attr_reader :text
    def initialize(step_actor, name, text, options)
      @text = text
      super(step_actor, name, options)
    end
    
    protected
    def run_step
      @step_actor.set_text(@text, @options)
    end
  end
  
  class ClickStep < ValidationStep
    def initialize(step_actor, name, options)
      super(step_actor, name, options)
    end
    
    protected
    def run_step
      @step_actor.click(@options)
    end
  end
  
  class HoverStep < ValidationStep
    def initialize(step_actor, name, options)
      super(step_actor, name, options)
    end
    
    protected
    def run_step
      @step_actor.hover(@options)
    end
  end
  
  class VerifyElementStep < ValidationStep
    attr_reader :expected
    def initialize(step_actor, name, expected, options)
      @expected = expected
      super(step_actor, name, options)
    end
    
    protected
    def run_step
      #do nothing
    end
  end
  
end
