require File.dirname(__FILE__) + '/spec_helper.rb'
require File.dirname(__FILE__) + '/../lib/number_utilities'

describe NumberUtilities do
  
  use_cases.each do |use_case|
    it "should process #{use_case[:array_to_process]} properly and return the expected number" do
        NumberUtilities.process_array(use_case[:array_to_process]).should == use_case[:expected_result]
    end
  end
  
end