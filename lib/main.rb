# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'pm_validation')

require 'validation'

valid = PMValidation::Validation.new
valid.validate
