class Pokemon
  attr_accessor :pk_name, :pk_type
  attr_reader :id 
  
  def intitalize(id = nil, pk_name, pk_type)
    @pk_name = pk_name
    @pk_type = pk_type
    @id = id 
  end 
  
  def save 
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    
    DB[:conn].execute(sql, self.pk_name, self.pk_type)
  end 
end
