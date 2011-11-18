class Task
  include MongoMapper::Document

  key :description, String
  key :owner_id, ObjectId
  
  belongs_to :owner, :class => 'User'
  
  def owner
    User.find(@owner_id)
  end

end
