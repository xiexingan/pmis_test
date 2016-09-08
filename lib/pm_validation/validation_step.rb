# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module PMValidation
  class ValidationStep
    attr_reader :id
    attr_accessor :state

    def initialize()
      @id = StepID.instance.fetch_id
    end

    def run

    end

    def validate

    end

    def get_result

    end
  end
end
