# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'pm_validation')

require 'validation'
require 'hardware_info'

hw = PMValidation::HardwareInfo.new
hw.collection_hardware_info

#valid = PMValidation::Validation.new
#valid.validate
#valid.get_results.each do |r|
#  #puts "#{r.step_name}: #{format("%.2f", r.response)}s"
#end

