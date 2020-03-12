require 'pry'
class Dog 
  attr_accessor :breed, :id, :name
  
  
  def initialize (id: nil, name:,  breed:)
    @name = name 
    @breed = breed
  end 
  
  def self.create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, 
      name TEXT, 
      breed TEXT)
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = <<-SQL 
      DROP TABLE dogs
    SQL
    DB[:conn].execute(sql)
  end 
  
  
  def self.new_from_db (row)
    binding.pry
    new_dog = self.new(id: row[0], name: row[1], breed: row[2])
    new_dog.id= row[0]
    new_dog
  end 
  
  def self.find_by_name(name)
    sql = <<-SQL 
      SELECT * FROM dogs
      WHERE name = ?
      
    SQL
    binding.pry
    DB[:conn].execute(sql, name)
  end
  
  
  def save
  end 
  
end 