class Pokemon
  attr_accessor :name, :type 
  attr_reader :id 
  
  def initialize id = nil, name, type 
    @id = id 
    @name = name 
    @type = name 
  end 
  
  def save 
    sql = <<-SQL 
      INSERT INTO pokemons (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
  end 
  
  def self.new_on_db(row)
    id = row[0]
    name = row[1]
    type = row[2]
    pokemon = Pokemon.new(id, name, type)
  end 
  
  def self.find(id) 
  sql = <<-SQL   
    SELECT * 
    FROM pokemons 
    WHERE id = ?
  SQL
  DB[:conn].execute(sql, id)
  end 
  
end
