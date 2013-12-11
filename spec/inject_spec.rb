require 'inject'

describe Array do 

  let (:array) {Array.new}

  context "re-writing the inject method" do

    # You don't need these three tests at all.
    # Don't test that methods take arguments and block
    # because if they don't, then your 'tests with examples'
    # will fail.     
    it "must be able to take a block of code" do
      array = [1,2,3]      
      expect(array.injection(1){|memo, obj| :block}).not_to raise_error
    end

    it "should be able to take an argument" do
      array = [1,2,3]
      expect(array.injection(1){|memo, obj| :block}).not_to raise_error
    end

    it "should be able to not take an argument" do
      array = [1,2,3]
      expect(array.injection {|memo, obj| :block}).not_to raise_error
    end

  end

  context "testing with examples" do
    # but these three tests are good    
    it "should be able to do addition" do 
      array = [2,3,4]
      expect(array.injection(1) {|sum, num| sum + num}).to eq(10)
    end

    it "should be able to do multiplication" do
      array = [3,4,5]
      expect(array.injection(2) {|product, num| product * num}).to eq(120)
    end

    it "should be able to take longer blocks" do
      array = ["cat", "dog", "mouse", "flea"]
      expect(array.inject {|animal, word| animal.length > word.length ? animal : word }).to eq("mouse")
    end
  
    # but this one fails because of the bug in the implementation    
    it "should be able to do multiplication without the argument" do
      array = [2,3,4]
      expect(array.injection {|sum, num| sum * num}).to eq(24)
    end

  end
 
end