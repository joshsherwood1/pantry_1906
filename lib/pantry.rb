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
    # @stock
    # recipe.ingredients_required
    #@stock.merge!(recipe.ingredients_required){|k, v1, v2| v1 - v2 }
  end
end
