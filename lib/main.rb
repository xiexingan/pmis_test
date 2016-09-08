# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'watir-webdriver'


b = Watir::Browser.new(:chrome)
b.goto("http://www.chuantu.biz")
b.file_field(:name=>"uploadimg").set("/home/ubuntu/Pictures/login_04.jpg")
b.button(:type=>"submit", :class=>"button").click
