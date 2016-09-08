# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'

module PMValidation
  class StepID
    include Singleton
    
    def initialize
      @stepId = 0
    end

    def fetch_id
      @stepId += 1
    end

  end  

  class TesterStep

  end
end
