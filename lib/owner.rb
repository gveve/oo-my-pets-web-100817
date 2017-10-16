require 'pry'
class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []



  def initialize(owner)
    @name = owner
    @@owners << self
    @species = "human"
    @pets = {:fishes=>[], :dogs=>[], :cats=>[]}
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.length
  end

  def say_species
    return "I am a #{@species}."
  end

  # def name
  #   @name
  # end


  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] <<(fish)
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats]<<(cat)
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs]<<(dog)
  end

  def walk_dogs
    pets[:dogs].each{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each{|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each{|fish| fish.mood = "happy"}
  end

  def sell_pets
     pets.each do |species, pets_array|
      #  binding.pry
       pets_array.each do |pet|
         pet.mood = "nervous"
       end
       pets_array.clear
     end
   end

  def list_pets
    return "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
