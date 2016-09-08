# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module PMValidation
  class StepResult
    attr_reader :step_name, :success, :response
    def initialize(step_name, success, response)
      @step_name = step_name
      @success = success
      @response = response
    end
  end
end
