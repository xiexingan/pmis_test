# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'watir-webdriver'
require 'watir-webdriver-performance'

module PMValidation
  class StepActor
    
    def initialize
      @browser = Watir::Browser.new(:chrome)
    end
    
    def goto(url)
      @browser.goto(url)
      @browser.performance.summary[:response_time]/1000.0
    end
        
    def open_by_click(options={})
      @browser.button(options).click if @browser.button(options)
      @browser.link(options).click if @browser.link(options)
      @browser.performance.summary[:response_time]/1000.0
    end
    
    def click(options={})
      @browser.button(options).click if @browser.button(options)
      @browser.link(options).click if @browser.link(options)
    end

    def set_text(text, options={})
      @browser.text_field(options).set(text)
    end
    
    def destroy
      @browser.close
    end
    
    alias_method :submit, :open_by_click
  end
end
