class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def obtain_calories_per_serving
    @ingredients_required.keys.map do |ingredient|
      ingredient.calories
    end
  end

  def total_calories
    obtain_calories_per_serving.zip(@ingredients_required.values).map{|first, second| first * second}.sum
  end
end
