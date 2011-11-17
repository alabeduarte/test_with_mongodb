class Task
  include MongoMapper::Document

  key :description, String
  
  belongs_to :owner, :class => "User"

end
