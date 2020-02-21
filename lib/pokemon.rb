class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id 
  end 
  
  def self.save(pk_name, pk_type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, pk_name, pk_type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")
  end 
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
    
    pkmn_info = db.execute(sql, id)
    
    save()
  end 
end
