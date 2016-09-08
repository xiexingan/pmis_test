# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'pm_validation/step_actor'

class StepActorTest < Test::Unit::TestCase
  def setup
    @b = PMValidation::StepActor.new
    @b.start
  end
  
  def teardown
    @b.stop
  end
  
  def test_goto
    @b.goto("http://www.baidu.com")
  end
  
  def test_submit
    @b.goto("http://www.baidu.com")
    @b.set_text("test", :name=>"wd")
    @b.submit(:id =>"su")
  end
 
end
