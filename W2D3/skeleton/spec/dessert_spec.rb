require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new('cookie', 5, chef)}
  let(:chef) { double("chef", name: "Nadav") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cookie', 'five', 'Nadav')}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("ketchup")
      expect(dessert.ingredients).to include('ketchup')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ing_array = ["ice cream", "cookies", "coke"]
      ing_array.each do |el|
        dessert.add_ingredient(el)
      end
      expect(dessert.ingredients).to eq(ing_array)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ing_array)


    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(4)

    end

    it "raises an error if the amount is greater than the quantity" do
      expect { (dessert.eat(10)) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Nadav the Great Baker")
      expect(dessert.serve).to eq("Chef Nadav the Great Baker has made 5 cookies!")
    end


  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"

    
  end
end
