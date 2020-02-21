class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def intitalize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id 
  end 
  
  def save(pk_name, pk_type, db)
    
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    DB[:conn].execute(sql, self.pk_name, self.pk_type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")
  end 
end
