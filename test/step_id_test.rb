# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'pm_validation/step_id'

class StepIDTest < Test::Unit::TestCase
  def test_step_id
    assert_equal(1, PMValidation::StepID.instance.fetch_id)
    assert_equal(2, PMValidation::StepID.instance.fetch_id)
    assert_equal(3, PMValidation::StepID.instance.fetch_id)
  end
end
