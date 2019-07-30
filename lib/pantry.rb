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
    ingredient_differences = @stock.merge!(recipe.ingredients_required){|k, v1, v2| v1 - v2 }.values
    if recipe.ingredients_required.keys.all?{ |ingredient| @stock.keys.include?(ingredient) } && ingredient_differences.all?(&:positive?)
      return true
    else @stock.keys.include?(recipe.ingredients_required.keys) == false || ingredient_differences.any?(&:negative?)
      return false
    end
  end
end
