class User < ActiveRecord::Base
  # MN: omniauth 
  has_many :authentications
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
  def apply_omniauth( omniauth )
  	# fill in e-mail if empty
    self.email = omniauth['user_info']['email'] if email.blank?
    # if still empty, then fake it (openid ?)
    self.email = 'invalid@email.openid.org' if email.blank?
    
    # fill in name    
    self.name = omniauth['user_info']['name'] if name.blank?
    
    # if stil blank, then at least set uid as name
    self.name = omniauth['uid'] if name.blank?
    
    authentications.build(:provider=>omniauth['provider'], :uid=>omniauth['uid'])
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
