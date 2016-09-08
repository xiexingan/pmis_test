# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
$:.unshift File.join(File.dirname(__FILE__))

require 'step_factory'
require 'step_actor'
require 'step_id'
require 'step_result'
require 'validation_step'

module PMValidation
  class Validation
    
    def initialize
      factory = StepFactory.new
      @steps = [
        factory.create_start,
        factory.create_open(:access_login_page, "http://192.168.1.84:8080"),
        factory.create_set_text(:type_username, "xiexingan", :id=>"username"),
        factory.create_set_text(:type_password, "0000", :id=>"password"),
        #login pm system
        factory.create_click(:login_and_open_home, :id=>"btLogin", :class=>"form-submit-btn"),
        
        #navigate to 项目信息跟踪页面
        factory.create_hover(:open_tbgl_menu, :class=>"menu-txt", :text=>"投标管理"),
        factory.create_click(:open_xxgz_page, :class=>"lv4-menu-txt", :text=>"项目信息跟踪")
      ]
      set_verify_elements
    end
    
    def validate
      @steps.each do |step|
        step.run
        puts "#{step.get_result().step_name}: #{step.get_result().response}"
      end
    end
    
    private
    def set_verify_elements
      0.upto(@steps.length-2) do |index|
        step = @steps[index]
        next_step = @steps[index+1]
        step.verify_element_options = next_step.options if(next_step.options != {})
      end
    end
    
  end
end
