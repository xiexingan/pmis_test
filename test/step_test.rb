# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'pm_validation/validation_step'
require 'pm_validation/step_result'

class StepTest < Test::Unit::TestCase
  def setup
    
  end
  
  def teardown
    @step_actor.stop if @step_actor
  end
  
  def test_steps
    @step_actor = PMValidation::StepActor.new
    test_start_step
    test_open_page_step
    test_set_step
    test_click_step
    test_end_step
  end
  
  private
  def test_start_step
    step = PMValidation::StartStep.new(@step_actor)
    assert_equal(step.name, :start)
    assert_equal(step.step_actor, @step_actor)
    step.run
    result = step.get_result
    assert_equal(result.step_name, :start)
    assert(result.success)
    assert(result.response > 0)
  end
  
  private
  def test_open_page_step
    step = PMValidation::OpenPageStep.new(@step_actor, :goto_baidu_home, "http://www.baidu.com")
    assert_equal(step.name, :goto_baidu_home)
    assert_equal(step.url, "http://www.baidu.com")
    assert_equal(step.step_actor, @step_actor)
    assert_not_nil(@step_actor)
    step.run
    result = step.get_result
    assert_equal(result.step_name, :goto_baidu_home)
    assert(result.success)
    assert(result.response > 0)
  end
  
  private
  def test_set_step
    step = PMValidation::SetTextStep.new(@step_actor, :type_keyword, "test", :name=>"wd")
    assert_equal(step.name, :type_keyword)
    assert_equal(step.options[:name], "wd")
    assert_equal(step.text, "test")
    assert_equal(step.step_actor, @step_actor)
    assert_not_nil(@step_actor)
    step.run
    result = step.get_result
    assert_equal(result.step_name, :type_keyword)
    assert(result.success)
    assert(result.response > 0)
  end
  
  private
  def test_click_step
    step = PMValidation::ClickStep.new(@step_actor, :submit_search, :id=>"su")
    assert_equal(step.name, :submit_search)
    assert_equal(step.options[:id], "su")
    assert_equal(step.step_actor, @step_actor)
    assert_not_nil(@step_actor)
    step.run
    result = step.get_result
    assert_equal(result.step_name, :submit_search)
    assert(result.success)
    assert(result.response > 0)
  end
  
  private
  def test_end_step
    step = PMValidation::EndStep.new(@step_actor)
    assert_equal(step.name, :end)
    assert_not_nil(@step_actor)
    step.run
    result = step.get_result
    assert_equal(result.step_name, :end)
    assert(result.success)
    assert(result.response > 0)
  end
      
end
