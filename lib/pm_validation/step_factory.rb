# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module PMValidation
  class StepFactory
    def initialize
      @step_actor = StepActor.new
    end
    
    def create_start
      StartStep.new(@step_actor)
    end
    
    def create_end
      EndStep.new(@step_actor)
    end
    
    def create_open(name, url)
      OpenPageStep.new(@step_actor, name, url)
    end
    
    def create_click(name, options={})
      ClickStep.new(@step_actor, name, options)
    end
    
    def create_hover(name, options={})
      HoverStep.new(@step_actor, name, options)
    end
    
    def create_set_text(name, text, options={})
      SetTextStep.new(@step_actor, name, text, options)
    end
  end
end
