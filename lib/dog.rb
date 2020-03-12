class Dog 
  attr_accessor :breed, :id, :name
  
  
  def initialize (id: nil, name:,  breed:)
    @name = name 
    @breed = breed
  end 
  
  def self.create_table
  end 
  
end 