begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

def use_cases
  [
   {:array_to_process => ["3", "+", "5"], :expected_result => 8},
   {:array_to_process => ["3", "-", "5"], :expected_result => -2},
   {:array_to_process => ["3", "*", "5"], :expected_result => 15},
   {:array_to_process => ["15", "/", "3"], :expected_result => 5},
   {:array_to_process => ["9", "+", "3"], :expected_result => 12},
   {:array_to_process => ["1", "+", "2", "*", "3", "-", "4", "/", "5"], :expected_result => 1}
  ]  
end
