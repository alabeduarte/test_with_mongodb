class User
  include MongoMapper::Document

  key :name, String
  
  many :tasks

end
