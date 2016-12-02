require "pry"
class Owner
  # code goes here
  @@all = []

  attr_accessor :pets, :name
  attr_reader :species

  #intializes with an empty hash
  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  #this method calls the @@all array that stores all owner instances
  def self.all
    @@all
  end

  #reset the @@all array of owners
  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].each { |instance| instance.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].each { |instance| instance.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|instance| instance.mood = "happy"}
  end

  def sell_pets
    #binding.pry
    pets.each do |type,name|
      name.each { |pet_instance| pet_instance.mood = "nervous"}
    end
    pets.each {|type, name| pets[type]= []}
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end
