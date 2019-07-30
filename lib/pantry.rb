class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    # recipe.ingredients_required.keys
    # (recipe.ingredients_required.keys & @stock.keys).size == recipe.ingredients_required.keys.size
    ingredient_differences = @stock.merge!(recipe.ingredients_required){|k, v1, v2| v1 - v2 }.values
    if ingredient_differences.all?(&:positive?) && (recipe.ingredients_required.keys & @stock.keys).size == recipe.ingredients_required.keys.size
      return true
    else ingredient_differences.any?(&:negative?) || (recipe.ingredients_required.keys & @stock.keys).size != recipe.ingredients_required.keys.size
      return false
    end
  end
end
