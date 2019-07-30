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
    positive_differences = []
    ingredient_differences = recipe.ingredients_required.merge!(@stock){|k, v1, v2| v1 - v2 }.values
    ingredient_differences.each do |difference|  #.all?(&:negative?)
      positive_differences << difference if difference > 0
    end
    if positive_differences.count == 0
      return true
    else
      return false
    end
  end

# def enough_ingredients_for?(recipe)
#   positive_differences = []
#   ingredient_differences = recipe.ingredients_required.merge!(@stock){|k, v1, v2| v1 - v2 }.values
#   actual_positive_differences = ingredient_differences.find_all do |difference|  #.all?(&:negative?)
#     difference if difference > 0
#   end
#   if positive_differences.count == actual_positive_differences.count
#     return true
#   else
#     return false
#   end
# end
end
