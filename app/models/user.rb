class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :registerable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,  :role_ids, :company
  
  has_and_belongs_to_many :roles
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s)
  end
  
end
