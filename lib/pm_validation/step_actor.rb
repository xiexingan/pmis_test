# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'watir-webdriver'
require 'watir-webdriver-performance'

module PMValidation
  class StepActor
    
    def initialize
      
    end
    
    def start
      @browser = Watir::Browser.new(:chrome)
    end
    
    def goto(url)
      @browser.goto(url)
    end
        
    def click(options={})
      @browser.element(options).when_present.click
    end

    def set_text(text, options={})
      @browser.text_field(options).when_present.set(text)
    end
    
    def hover(options={})
      @browser.element(options).when_present.hover
    end
    
    def wait_verify_element_present(verify_element_options={})
      @browser.element(verify_element_options).wait_until_present
    end
    
    def stop
      start = Time.now
      @browser.close
      Time.now - start
    end
    
    alias_method :submit, :click
  end
end
