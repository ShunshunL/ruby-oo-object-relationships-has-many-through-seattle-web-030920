class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max {|meal1,meal2| meal1.tip <=> meal2.tip}
    best_tipped_meal.customer
  end

  def worst_tipper
    worst_tipped_meal = meals.min {|meal1, meal2| meal1.tip <=> meal2.tip}
    worst_tipped_meal.customer
  end
end
