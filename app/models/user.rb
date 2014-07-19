class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  def self.create_with_omniauth(auth_hash)
    self.create(
      :provider => auth_hash["provider"], 
      :name => auth_hash["info"]["name"], 
      :uid => auth_hash["uid"]
      )
  end 
end
