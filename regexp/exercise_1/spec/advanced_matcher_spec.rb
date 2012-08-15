# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + '/../processor'

describe SingleCharacterMatcher do

  # that can match a single character
  it "should match cases with a single character" do
    SingleCharacterMatcher.check("\n").should be_true
    SingleCharacterMatcher.check("\t").should be_true
    SingleCharacterMatcher.check("\r").should be_true
    SingleCharacterMatcher.check("\f").should be_true
  end

  it "should not match cases without single characters" do
    SingleCharacterMatcher.check("a\n").should be_false
    SingleCharacterMatcher.check("\n\n").should be_false
    SingleCharacterMatcher.check("'").should be_false
  end

  it "should find if a string contains a single instance of a character" do
    SingleCharacterMatcher.contains?('a', "a\nabc").should be_false
  end

end

describe CharacterSequenceMatcher do

  # that can match a single character
  it "should match cases with a sequence of similar characters" do
    CharacterSequenceMatcher.check("\n\n").should be_true
    CharacterSequenceMatcher.check("hello\n\t\tworld").should be_true
    CharacterSequenceMatcher.check("it''s me").should be_true
  end

end
