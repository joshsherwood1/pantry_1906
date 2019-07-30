require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @pantry = Pantry.new
  end

  def test_that_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_that_it_has_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_stock_status_for_ingredients
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end
end
