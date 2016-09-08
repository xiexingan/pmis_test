# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'pm_validation/step_actor'

class StepActorTest < Test::Unit::TestCase
  def setup
    @b = PMValidation::StepActor.new
  end
  
  def teardown
    @b.destroy
  end
  
  def test_goto
    1.upto(10) do
      response = @b.goto("http://www.baidu.com")
      puts "Loading time #{response}"
      assert(response > 0)
    end
  end
  
  def test_submit
    @b.goto("http://www.baidu.com")
    @b.set_text("test", :name=>"wd")
    response = @b.submit(:id =>"su")
    puts "Loading time #{response}"
    assert(response > 0)
  end
end
