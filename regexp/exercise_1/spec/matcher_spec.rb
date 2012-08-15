# -*- encoding: utf-8 -*-
require File.dirname(__FILE__) + '/../processor'

describe SingleCharacterMatcher do

  it "should match cases with a single character" do
    SingleCharacterMatcher.check("a").should be_true
    SingleCharacterMatcher.check(" ").should be_true
    SingleCharacterMatcher.check("1").should be_true
    SingleCharacterMatcher.check("A").should be_true
    SingleCharacterMatcher.check("ñ").should be_true
    SingleCharacterMatcher.check("ñ").should be_true
  end

  it "should not match cases without single characters" do
    SingleCharacterMatcher.check("abc").should be_false
    SingleCharacterMatcher.check(" a ").should be_false
    SingleCharacterMatcher.check("  ").should be_false
    SingleCharacterMatcher.check("123").should be_false
  end

  it "should find if a string contains a single instance of a character" do
    SingleCharacterMatcher.contains?('a', 'abc').should be_true
    SingleCharacterMatcher.contains?('a', 'aabc').should be_false
    SingleCharacterMatcher.contains?('1', '1234').should be_true
    SingleCharacterMatcher.contains?('a', 'abac').should be_false
    SingleCharacterMatcher.contains?('a', '').should be_false
  end

end

describe CharacterSequenceMatcher do

  it "should match cases with a sequence of similar characters" do
    CharacterSequenceMatcher.check("foo").should be_true
    CharacterSequenceMatcher.check("faab").should be_true
    CharacterSequenceMatcher.check("1 33 2").should be_true
    CharacterSequenceMatcher.check("AABBCC").should be_true
    CharacterSequenceMatcher.check("ññ").should be_true
  end

  it "should not match cases without sequences of similar characters" do
    CharacterSequenceMatcher.check("abc").should be_false
    CharacterSequenceMatcher.check("aAbBcC").should be_false
    CharacterSequenceMatcher.check(" a ").should be_false
    CharacterSequenceMatcher.check("  ").should be_false
    CharacterSequenceMatcher.check("'`").should be_false
  end

end


describe VowlePairMatcher do

  it "it should find two vowels following each other" do
    VowlePairMatcher.check("qwrtp").should be_false
    VowlePairMatcher.check("qwer").should be_false
    VowlePairMatcher.check("qweer").should be_true
    VowlePairMatcher.check("qwe.rr").should be_false
    VowlePairMatcher.check("aas").should be_true
    VowlePairMatcher.check("the\ngray\nass").should be_false
    VowlePairMatcher.check("zo\noey").should be_true
    VowlePairMatcher.check("oey").should be_true
    VowlePairMatcher.check("booey").should be_true
    VowlePairMatcher.check("ZoEy").should be_true
    VowlePairMatcher.check("a e u").should be_false
    VowlePairMatcher.check("arg").should be_false
  end

end

describe RepetitionMatcher do
  it "should find one or more repetition of a letter" do
    RepetitionMatcher.check("a abc").should be_false
    RepetitionMatcher.check("baaac").should be_true
    RepetitionMatcher.check("BaAaC").should be_true
    RepetitionMatcher.check("abc").should be_false
  end

  it "should extract the last repetition" do
    RepetitionMatcher.last("zooxyleem").should == "ee"
    RepetitionMatcher.last("iirsen\nbook;haas").should == "aa"
    RepetitionMatcher.last("Iirsen book ha.as").should == "oo"
    RepetitionMatcher.last("Iirse∞∞£nbok ha.as-t t").should == "∞∞"
    RepetitionMatcher.last("aAeEiI").should == "iI"
    RepetitionMatcher.last("aAe\nEiI").should == "iI"
    RepetitionMatcher.last("aAeEiIUU").should == "UU"
  end
end
