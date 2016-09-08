# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'pm_validation/validation'

class ValidationTest < Test::Unit::TestCase
  def test_foo
    valid = PMValidation::Validation.new
    valid.validate
  end
end
