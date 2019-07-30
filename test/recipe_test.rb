require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipieTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_that_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_that_it_has_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end
end
