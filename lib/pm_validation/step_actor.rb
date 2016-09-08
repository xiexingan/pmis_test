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
      get_performance
    end
    
    def goto(url)
      @browser.goto(url)
      get_performance
    end
        
    def click(options={})
      @browser.button(options).click if @browser.button(options)
      @browser.link(options).click if @browser.link(options)
      get_performance
    end

    def set_text(text, options={})
      @browser.text_field(options).set(text)
      get_performance
    end
    
    def stop
      start = Time.now
      @browser.close
      Time.now - start
    end
    
    def get_performance
      @browser.performance.summary[:response_time]/1000.0
    end
    
    private_methods :get_performance
    alias_method :submit, :click
  end
end
