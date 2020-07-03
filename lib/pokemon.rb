class Pokemon
  attr_accessor :name, :type, :db 
  attr_reader :id 
  
  def initialize id = nil, name, type, db  
    @id = id 
    @name = name 
    @type = name 
    @db = db 
  end 
  
  def save 
    sql = <<-SQL 
      INSERT INTO pokemons (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
  end 
  
  def self.new_on_db(row)
    id = row[0]
    name = row[1]
    type = row[2]
    self.new(id, name, type)
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
